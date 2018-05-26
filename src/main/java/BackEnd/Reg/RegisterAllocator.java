package BackEnd.Reg;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Variable.*;

import java.util.*;

public class RegisterAllocator {

    IR ir;
    RegisterConfig registerConfig;

    public void allocateRegister(IR ir, RegisterConfig registerConfig) {
        this.ir = ir;
        this.registerConfig = registerConfig;
        for (MethodEntity method : ir.methodList)
            acllocateRegister(method);
    }

    void acllocateRegister(MethodEntity method) {
        init(method);
        livenessAnalysis(method);
        buildInterGraph(method);
        assignColors(method);
    }
    
    void init(MethodEntity method) {
        initLivenessAnalysis(method);
    }

    ////////////////// liveness analysis /////////////////////////////

    LinkedList<BasicBlock> sorted;
    HashSet<BasicBlock> visited;
    void dfs(BasicBlock u) {
        sorted.addLast(u);
        visited.add(u);
        for (BasicBlock v : u.predecessorList)
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
                for (BasicBlock suc : bb.successorList)
                    newOut.addAll(suc.liveIn);
                modified |= !bb.liveIn.equals(newIn) || !bb.liveOut.equals(newOut);
                bb.liveIn = newIn;
                bb.liveOut = newOut;
            }
        }
    }

    ////////////////////////// interference graph /////////////////////
    InterferenceGraph interGraph;
    void buildInterGraph(MethodEntity method) {
        interGraph = new InterferenceGraph();
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

        System.out.println("========== " + method.methodName);
        method.printInformation();
        interGraph.printInformation();
    }

    ///////////////////////// assign colors ///////////////////////////
    void assignColors(MethodEntity methodEntity) {

    }
}
