package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

public class AllVariableCalculator {

    public void calculateAllVariable(IR ir) throws Exception {
        for (MethodEntity method : ir.methodList)
            for (BasicBlock bb : method.basicBlockList)
                for (IRCode ins : bb.codeList)
                    calculateAllVariable(ins);
    }

    public void calculateAllVariable(IRCode ins) throws Exception {
        ins.allVariable.addAll(ins.def);
        ins.allVariable.addAll(ins.use);
        return;
//        if (ins instanceof Allocate) calculateAllVariable((Allocate)ins);
//        else if (ins instanceof Binary) calculateAllVariable((Binary)ins);
//        else if (ins instanceof Compare) calculateAllVariable((Compare)ins);
//        else if (ins instanceof Jump) calculateAllVariable((Jump)ins);
//        else if (ins instanceof MethodCall) calculateAllVariable((MethodCall)ins);
//        else if (ins instanceof Move) calculateAllVariable((Move)ins);
//        else if (ins instanceof Nop) return;
//        else if (ins instanceof Push) calculateAllVariable((Push)ins);
//        else if (ins instanceof Return) calculateAllVariable((Return)ins);
//        else if (ins instanceof Set) calculateAllVariable((Set)ins);
//        else if (ins instanceof Unary) calculateAllVariable((Unary)ins);
//        else throw new Exception();
    }

//    public void calculateAllVariable(Allocate ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//    }
//
//    public void calculateAllVariable(Binary ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//        ins.allVariable.addAll(ins.src.colorable());
//    }
//
//    public void calculateAllVariable(Compare ins) {
//        ins.allVariable.addAll(ins.src0.colorable());
//        ins.allVariable.addAll(ins.src1.colorable());
//    }
//
//    public void calculateAllVariable(Jump ins) {
//
//    }
//
//    public void calculateAllVariable(MethodCall ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//        for (Operand src : ins.actualParaVarList)
//            ins.allVariable.addAll(src.colorable());
//    }
//
//    public void calculateAllVariable(Move ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//        ins.allVariable.addAll(ins.src.colorable());
//    }
//
//    public void calculateAllVariable(Push ins) {
//        ins.allVariable.addAll(ins.src.colorable());
//    }
//
//    public void calculateAllVariable(Return ins) {
//        if (ins.src != null)
//            ins.allVariable.addAll(ins.src.colorable());
//    }
//
//    public void calculateAllVariable(Cmove ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//        ins.allVariable.addAll(ins.src.colorable());
//    }
//
//    public void calculateAllVariable(Unary ins) {
//        ins.allVariable.addAll(ins.dst.colorable());
//    }
}
