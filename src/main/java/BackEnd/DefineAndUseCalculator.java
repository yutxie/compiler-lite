package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

public class DefineAndUseCalculator {

    public void calculateDefineAndUse(IR ir) throws Exception {
        for (MethodEntity methodEntity : ir.methodList)
            for (BasicBlock bb : methodEntity.basicBlockList)
                for (IRCode ins : bb.codeList)
                    calculateDefineAndUse(ins);
    }

    public void calculateDefineAndUse(IRCode ins) throws Exception {
        if (ins instanceof Allocate) calculateDefineAndUse((Allocate)ins);
        else if (ins instanceof Binary) calculateDefineAndUse((Binary)ins);
        else if (ins instanceof Compare) calculateDefineAndUse((Compare)ins);
        else if (ins instanceof Jump) return;
        else if (ins instanceof MethodCall) calculateDefineAndUse((MethodCall)ins);
        else if (ins instanceof Move) calculateDefineAndUse((Move)ins);
        else if (ins instanceof Nop) return;
        else if (ins instanceof Pop) calculateDefineAndUse((Pop)ins);
        else if (ins instanceof Push) calculateDefineAndUse((Push)ins);
        else if (ins instanceof Return) calculateDefineAndUse((Return)ins);
        else if (ins instanceof Set) calculateDefineAndUse((Set)ins);
        else if (ins instanceof Unary) calculateDefineAndUse((Unary)ins);
        else throw new Exception();
    }

    public void calculateDefineAndUse(Allocate ins) {
        ins.def.addAll(ins.dst.colorable());
    }

    public void calculateDefineAndUse(Binary ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorable());
        ins.use.addAll(ins.src.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
        ins.use.addAll(ins.src.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Compare ins) {
        ins.use.addAll(ins.src0.colorable());
        ins.use.addAll(ins.src1.colorable());
        ins.use.addAll(ins.src0.colorableInIndexOrMember());
        ins.use.addAll(ins.src1.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(MethodCall ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
        for (Operand src : ins.actualParaVarList) {
            ins.use.addAll(src.colorable());
            ins.use.addAll(src.colorableInIndexOrMember());
        }
    }

    public void calculateDefineAndUse(Move ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.src.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
        ins.use.addAll(ins.src.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Pop ins) {
        ins.use.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Push ins) {
        ins.def.addAll(ins.src.colorable());
        ins.use.addAll(ins.src.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Return ins) {
        if (ins.src == null) return;
        ins.use.addAll(ins.src.colorable());
        ins.use.addAll(ins.src.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Set ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
    }

    public void calculateDefineAndUse(Unary ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorableInIndexOrMember());
    }
}
