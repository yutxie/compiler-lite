package BackEnd.Reg;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Variable.*;

import java.util.*;

public class RegisterAllocator {

    IR ir;
    RegisterConfig regConfig = new RegisterConfig();
    DefineAndUseCalculator defineAndUseCalculator = new DefineAndUseCalculator();
//
//    public void allocateRegister(IR ir) {
//        this.ir = ir;
//        initLivenessAnalysis();
//        livenessAnalysis();
//        defineAndUseCalculator.calculateDefineAndUse(ir);
//    }
//
//    LinkedList<BasicBlock> sorted;
//    HashSet<BasicBlock> visited;
//    void dfs(BasicBlock u) {
//        sorted.addLast(u);
//        visited.add(u);
//        for (BasicBlock v : u.predecessorList)
//            if (!visited.contains(v)) dfs(v);
//    }
//
//    void initLivenessAnalysis() {
//        sorted = new LinkedList<BasicBlock>();
//        visited = new HashSet<BasicBlock>();
//        for (BasicBlock u : cfg.basicBlockList)
//            if (!visited.contains(u)) dfs(u);
//    }
//
//    void livenessAnalysis() {
//        // in block
//        for (BasicBlock bb : cfg.basicBlockList) {
//            bb.def.clear();
//            bb.use.clear();
//            bb.liveIn.clear();
//            bb.liveOut.clear();
//            for (IRCode ir : bb.irCodeList) {
//                bb.def.addAll(ir.def);
//                bb.use.addAll(ir.use);
//            }
//        }
//        // among blocks
//        boolean modified = true;
//        while (modified) {
//            modified = false;
//            for (BasicBlock bb : sorted) {
//                HashSet<Variable> newIn = new HashSet<Variable>();
//                newIn.addAll(bb.liveOut);
//                newIn.removeAll(bb.def);
//                newIn.addAll(bb.use);
//                HashSet<Variable> newOut = new HashSet<Variable>();
//                for (BasicBlock suc : bb.successorList)
//                    newOut.addAll(suc.liveIn);
//                modified |= !bb.liveIn.equals(newIn) || !bb.liveOut.equals(newOut);
//                bb.liveIn = newIn;
//                bb.liveOut = newOut;
//            }
//        }
//    }
}
