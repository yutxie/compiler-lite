package IR.IRCode;

import AstNode.*;
import IR.IRCode.Operand.*;

import java.util.*;

public class MethodCall extends IRCode {

    public Operand lhs;
    public Operand caller;
    public LinkedList<Operand> actualParaVarList = new LinkedList<Operand>();
    public MethodDefinitionNode method;

    @Override
    public void printInformation() {
        String callerStr = "";
        if (caller != null) callerStr = caller.getName();
        System.out.print("call " + lhs.getName() + " = " +
            callerStr + "." + method.methodName + " ");
        for (Operand item : actualParaVarList)
            System.out.print(item.getName() + " ");
        System.out.println();
    }
    // ATTENTION: pass caller as this
}
