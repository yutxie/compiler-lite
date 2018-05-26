package IR.IRCode;

import AstNode.*;
import IR.IRCode.Variable.*;

import java.util.*;

public class MethodCall extends IRCode {

    public Variable lhs;
    public Variable caller;
    public LinkedList<Variable> actualParaVarList;
    public MethodDefinitionNode method;

    public MethodCall() {
        actualParaVarList = new LinkedList<Variable>();
    }

    @Override
    public void printInformation() {
        String callerStr = "";
        if (caller != null) callerStr = caller.id();
        System.out.print("call " + lhs.id() + " = " +
            callerStr + "." + method.methodName + " ");
        for (Variable item : actualParaVarList)
            System.out.print(item.id() + " ");
        System.out.println();
    }
    // ATTENTION: pass caller as this
}
