package BackEnd;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Operand.*;

public class AllVariableCalculator {

    public void calculateAllVariable(IR ir) {
        for (MethodEntity method : ir.methodList)
            for (IRCode ins : method.codeList)
                calculateAllVariable(ins);
    }

    public void calculateAllVariable(IRCode ins) {
        if (ins instanceof Allocate) calculateAllVariable((Allocate)ins);
        else if (ins instanceof Binary) calculateAllVariable((Binary)ins);
        else if (ins instanceof Jump) calculateAllVariable((Jump)ins);
        else if (ins instanceof MethodCall) calculateAllVariable((MethodCall)ins);
        else if (ins instanceof Move) calculateAllVariable((Move)ins);
        else if (ins instanceof Push) calculateAllVariable((Push)ins);
        else if (ins instanceof Return) calculateAllVariable((Return)ins);
        else calculateAllVariable((Unary)ins);
    }

    public void calculateAllVariable(Allocate ins) {
        ins.allVariable.addAll(ins.lhs.colorable());
    }

    public void calculateAllVariable(Binary ins) {
        ins.allVariable.addAll(ins.lhs.colorable());
        ins.allVariable.addAll(ins.rhs.colorable());
    }

    public void calculateAllVariable(Jump ins) {

    }

    public void calculateAllVariable(MethodCall ins) {
        ins.allVariable.addAll(ins.lhs.colorable());
        for (Operand rhs : ins.actualParaVarList)
            ins.allVariable.addAll(rhs.colorable());
    }

    public void calculateAllVariable(Move ins) {
        ins.allVariable.addAll(ins.lhs.colorable());
        ins.allVariable.addAll(ins.rhs.colorable());
    }

    public void calculateAllVariable(Push ins) {
        ins.allVariable.addAll(ins.rhs.colorable());
    }

    public void calculateAllVariable(Return ins) {
        if (ins.returnValue != null)
            ins.allVariable.addAll(ins.returnValue.colorable());
    }

    public void calculateAllVariable(Unary ins) {
        ins.def.addAll(ins.lhs.colorable());
        ins.use.addAll(ins.lhs.colorable());
    }
}
