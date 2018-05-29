package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

public class DefineAndUseCalculator {

    public void calculateDefineAndUse(IR ir) {
        for (MethodEntity methodEntity : ir.methodList)
            for (BasicBlock bb : methodEntity.basicBlockList)
                for (IRCode ins : bb.codeList)
                    calculateDefineAndUse(ins);
    }

    public void calculateDefineAndUse(IRCode ins) {
        if (ins instanceof Allocate) calculateDefineAndUse((Allocate)ins);
        else if (ins instanceof Binary) calculateDefineAndUse((Binary)ins);
        else if (ins instanceof Compare) calculateDefineAndUse((Compare)ins);
        else if (ins instanceof Jump) calculateDefineAndUse((Jump)ins);
        else if (ins instanceof MethodCall) calculateDefineAndUse((MethodCall)ins);
        else if (ins instanceof Move) calculateDefineAndUse((Move)ins);
        else if (ins instanceof Pop) calculateDefineAndUse((Pop)ins);
        else if (ins instanceof Push) calculateDefineAndUse((Push)ins);
        else if (ins instanceof Return) calculateDefineAndUse((Return)ins);
        else if (ins instanceof Set) calculateDefineAndUse((Set)ins);
        else if (ins instanceof Unary) calculateDefineAndUse((Unary)ins);
        assert false;
    }

    public void calculateDefineAndUse(Allocate ins) {
        ins.def.addAll(ins.dst.colorable());
    }

    public void calculateDefineAndUse(Binary ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorable());
        ins.use.addAll(ins.src.colorable());
    }

    public void calculateDefineAndUse(Compare ins) {
        ins.use.addAll(ins.src0.colorable());
        ins.use.addAll(ins.src1.colorable());
    }

    public void calculateDefineAndUse(Jump ins) {

    }

    public void calculateDefineAndUse(MethodCall ins) {
        ins.def.addAll(ins.dst.colorable());
        for (Operand src : ins.actualParaVarList)
            ins.use.addAll(src.colorable());
    }

    public void calculateDefineAndUse(Move ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.src.colorable());
    }

    public void calculateDefineAndUse(Pop ins) {
        ins.use.addAll(ins.dst.colorable());
    }

    public void calculateDefineAndUse(Push ins) {
        ins.def.addAll(ins.src.colorable());
    }

    public void calculateDefineAndUse(Return ins) {
        if (ins.src != null)
            ins.use.addAll(ins.src.colorable());
    }

    public void calculateDefineAndUse(Set ins) {
        ins.def.addAll(ins.dst.colorable());
    }

    public void calculateDefineAndUse(Unary ins) {
        ins.def.addAll(ins.dst.colorable());
        ins.use.addAll(ins.dst.colorable());
    }
}
