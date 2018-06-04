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
        for (BasicBlock u : method.basicBlockList)
            if (!visited.contains(u)) dfs(u);
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
//        for (InterferenceGraph.Node u : interGraph.nodeSet) {
//            if (u.selected == true) continue;
//            boolean flag = true;
//            for (InterferenceGraph.Node v : u.edges)
//                if (v.selected == false) {
//                    flag = false;
//                    break;
//                }
//            if (flag) {
//                for (InterferenceGraph.Node v : u.edges)
//                    --v.degree;
//                u.selected = true;
//                toColorStack.addLast(u);
//                return true;
//            }
//        }
//        return false;
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
//        System.out.println("========== " + method.methodName);
//        method.printInformation();
//        interGraph.printInformation();
    }

}
