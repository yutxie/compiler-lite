package IRCode;

import AstNode.*;

import java.util.*;

public class MethodCall extends IRCode {

    public Register lhs;
    public Register callerReg;
    public LinkedList<Register> actualParaRegList;
    public MethodDefinitionNode method;

    public MethodCall() {
        actualParaRegList = new LinkedList<Register>();
    }

    @Override
    public void printInformation() {
        String callerStr = "";
        if (callerReg != null) callerStr = String.valueOf(callerReg.id());
        System.out.print("call " + lhs.id() + " " +
            callerStr + " " + method.methodName + " ");
        for (Register item : actualParaRegList)
            System.out.print(item.id() + " ");
        System.out.println();
    }
    // ATTENTION: pass caller as this
}
