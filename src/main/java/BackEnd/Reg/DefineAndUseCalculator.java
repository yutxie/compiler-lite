package BackEnd.Reg;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Variable.*;

public class DefineAndUseCalculator {

    public void calculateDefineAndUse(IR ir) {
        for (MethodEntity methodEntity : ir.methodList)
            for (BasicBlock bb : methodEntity.basicBlockList)
                for (IRCode ins : bb.codeList)
                    calculateDefineAndUse(ins);
    }

    public void calculateDefineAndUse(IRCode ir) {
        if (ir instanceof Allocate) calculateDefineAndUse((Allocate)ir);
        else if (ir instanceof Binary) calculateDefineAndUse((Binary)ir);
        else if (ir instanceof Jump) calculateDefineAndUse((Jump)ir);
        else if (ir instanceof MethodCall) calculateDefineAndUse((MethodCall)ir);
        else if (ir instanceof Move) calculateDefineAndUse((Move)ir);
        else if (ir instanceof Return) calculateDefineAndUse((Return)ir);
        else calculateDefineAndUse((Unary)ir);
    }

    public void calculateDefineAndUse(Allocate ir) {
        ir.def.addAll(ir.lhs.colorable());
    }

    public void calculateDefineAndUse(Binary ir) {
        ir.def.addAll(ir.lhs.colorable());
        ir.use.addAll(ir.lhs.colorable());
        ir.use.addAll(ir.rhs.colorable());
    }

    public void calculateDefineAndUse(Jump ir) {

    }

    public void calculateDefineAndUse(MethodCall ir) {
        ir.def.addAll(ir.lhs.colorable());
        for (Variable rhs : ir.actualParaVarList)
            ir.use.addAll(rhs.colorable());
    }

    public void calculateDefineAndUse(Move ir) {
        ir.def.addAll(ir.lhs.colorable());
        ir.use.addAll(ir.rhs.colorable());
    }

    public void calculateDefineAndUse(Return ir) {
        if (ir.returnValue != null)
            ir.use.addAll(ir.returnValue.colorable());
    }

    public void calculateDefineAndUse(Unary ir) {
        ir.def.addAll(ir.lhs.colorable());
        ir.use.addAll(ir.lhs.colorable());
    }
}
