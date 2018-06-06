package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

import java.util.*;

public class RegisterAllocator {

    IR ir;
    RegisterConfig registerConfig;

    public void allocateRegister(IR ir, RegisterConfig registerConfig) throws Exception {
        this.ir = ir;
        this.registerConfig = registerConfig;
        for (MethodEntity method : ir.methodList)
            acllocateRegister(method);
    }

    LinkedList<InterferenceGraph.Node> toColorStack;
    HashMap<Variable, Register> assignedMap;
    HashSet<Register> methodUsedRegSet;
    void acllocateRegister(MethodEntity method) throws Exception {
        init(method);
        livenessAnalysis(method);
//        method.printInformation();
//        removeCnt = 0;
        removeUselessCode(method);
//        System.out.println(method.methodName + " - " + removeCnt);
//        method.printInformation();
        buildInterGraph(method);
        while (true) {
            if (simplify()) continue;
            if (spill()) continue;
            break;
        }
        methodUsedRegSet = method.usedRegSet;
        assignColors();

        IRRewriter irRewriter = new IRRewriter();
        irRewriter.rewriteIR(ir, method, assignedMap, registerConfig);
//        if (method.methodName.equals("foo")) method.printInformation();
    }
    void init(MethodEntity method) {
        initLivenessAnalysis(method);
        toColorStack = new LinkedList<InterferenceGraph.Node>();
        assignedMap = new HashMap<Variable, Register>();
    }

    ////////////////// liveness analysis /////////////////////////////
    LinkedList<BasicBlock> sorted;
    HashSet<BasicBlock> visited;
    void dfs(BasicBlock u) {
        sorted.addLast(u);
        visited.add(u);
        for (BasicBlock v : u.predecessorSet)
            if (!visited.contains(v)) dfs(v);
    }
    void initLivenessAnalysis(MethodEntity method) {
        sorted = new LinkedList<BasicBlock>();
        visited = new HashSet<BasicBlock>();
        for (ListIterator<BasicBlock> it =
             method.basicBlockList.listIterator(method.basicBlockList.size()); it.hasPrevious();) {
            BasicBlock u = it.previous();
            if (!visited.contains(u)) dfs(u);
        }
    }
    void livenessAnalysis(MethodEntity method) {
        // in block
        for (BasicBlock bb : method.basicBlockList) {
            bb.def.clear();
            bb.use.clear();
            bb.liveIn.clear();
            bb.liveOut.clear();
            for (IRCode ins : bb.codeList) {
                bb.def.addAll(ins.def);
                bb.use.addAll(ins.use);
            }
        }
        // among blocks
        for (Variable para : method.formalParaVarList) {
            BasicBlock firstBB = method.basicBlockList.getFirst();
            firstBB.liveIn.addAll(para.colorable());
        }
        boolean modified = true;
        while (modified) {
            modified = false;
            for (BasicBlock bb : sorted) {
                HashSet<Variable> newIn = new HashSet<Variable>();
                newIn.addAll(bb.liveOut);
                newIn.removeAll(bb.def);
                newIn.addAll(bb.use);
                HashSet<Variable> newOut = new HashSet<Variable>();
                for (BasicBlock suc : bb.successorSet)
                    newOut.addAll(suc.liveIn);
                modified |= !bb.liveIn.equals(newIn) || !bb.liveOut.equals(newOut);
                bb.liveIn = newIn;
                bb.liveOut = newOut;
            }
        }
    }

    ///////////////////// remove useless code ////////////////////////
    void removeUselessCode(MethodEntity method) {
        for (BasicBlock bb : method.basicBlockList)
            bb.codeList = removeUselessCode(bb);
    }

    boolean isRemovable(IRCode ins) {
        if (ins instanceof Move ||
            ins instanceof Cmove ||
            ins instanceof Binary ||
            ins instanceof Unary ||
            ins instanceof Idiv) return true;
        return false;
    }

    int removeCnt = 0;
    LinkedList<IRCode> removeUselessCode(BasicBlock bb) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        HashSet<Variable> liveSet = (HashSet<Variable>) bb.liveOut.clone();
        for (ListIterator<IRCode> it = bb.codeList.listIterator(bb.codeList.size());
             it.hasPrevious(); ) {
            IRCode ins = it.previous();
            HashSet<Variable> def = ins.def;
            HashSet<Variable> use = ins.use;
            boolean removable = true;
            if (ins.def.isEmpty()) removable = false;
            for (Variable var : def) {
                if (removable == false) break;
                if (liveSet.contains(var) || var.global == true) {
                    removable = false;
                    break;
                }
            }
            if (!isRemovable(ins)) removable = false;
            if (!removable) {
                res.addFirst(ins);
                liveSet.removeAll(def);
                liveSet.addAll(use);
            } else {
                ++removeCnt;
//                ins.printInformation();
            }
        }
        return res;
    }

    ////////////////////// simplify ////////////////////////
    boolean simplify() {
        boolean res = false;
        for (InterferenceGraph.Node u : interGraph.nodeSet) {
            if (u.selected == true) continue;
            if (u.degree < registerConfig.numOfAssignable) {
                u.selected = true;
                toColorStack.addLast(u);
                for (InterferenceGraph.Node v : u.edges)
                    --v.degree;
            }
        }
        return res;
    }

    //////////////////// spill ///////////////////////////////
    boolean spill() {
        for (InterferenceGraph.Node u : interGraph.nodeSet) {
            if (u.selected == true) continue;
            for (InterferenceGraph.Node v : u.edges)
                --v.degree;
            u.selected = true;
            toColorStack.addLast(u);
            return true;
        }
        return false;
    }

    /////////////////// assign colors /////////////////////
    void assignColors() {
        int n = registerConfig.numOfAssignable;
        ListIterator<InterferenceGraph.Node> it =
                toColorStack.listIterator(toColorStack.size());
        while (it.hasPrevious()) {
            InterferenceGraph.Node u = it.previous();
            HashSet<Integer> set = new HashSet<Integer>();
//            System.out.println("\nu: " + u.var.getName());
            for (InterferenceGraph.Node v : u.edges) {
                if (v.color == -1) continue;
//                System.out.println("v: " + v.var.getName() + " " + v.color);
                set.add(v.color);
            }
            int idx;
            for (idx = 0; idx < n; ++idx)
                if (!set.contains(idx)) break;
            if (idx < n) {
                u.color = idx;
                Register reg = registerConfig.get(registerConfig.numOfAll - idx - 1);
//                System.out.println("assign color: " + u.var.getName() + " --> " + u.color);
                assignedMap.put(u.var, reg);
                methodUsedRegSet.add(reg);
            }
        }
    }

    ////////////////////////// interference graph /////////////////////
    InterferenceGraph interGraph;
    void buildInterGraph(MethodEntity method) {
        interGraph = new InterferenceGraph();
        for (Variable para : method.formalParaVarList)
            interGraph.addNode(para);
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList)
                for (Variable var : ins.allVariable)
                    interGraph.addNode(var);
        for (Variable u : method.formalParaVarList)
            for (Variable v : method.formalParaVarList) {
                if (u == v) continue;
                interGraph.addEdge(u, v);
            }
        for (BasicBlock bb : method.basicBlockList) {
            HashSet<Variable> liveSet = new HashSet<Variable>(bb.liveOut);
            int n = bb.codeList.size();
            for (int i = n - 1; i >= 0; --i) {
                IRCode ins = bb.codeList.get(i);
                ins.liveOut = new HashSet<Variable>(liveSet);
                liveSet.addAll(ins.def);
                for (Variable u : ins.def)
                    for (Variable v : liveSet) {
                        if (ins instanceof Move && u == v) continue;
                        interGraph.addEdge(u, v);
                    }
                liveSet.removeAll(ins.def);
                liveSet.addAll(ins.use);
                ins.liveIn = new HashSet<Variable>(liveSet);
            }
        }
//        if (method.methodName.equals("adjustHeap")) {
//            System.out.println("========== " + method.methodName);
//            method.printInformation();
//            interGraph.printInformation();
//        }
    }

}
