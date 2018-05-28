package IR.IRCode;

import AstNode.*;
import IR.IRCode.Operand.*;

import java.util.*;

public class MethodCall extends IRCode {

    public Operand dst;
    public Operand caller;
    public LinkedList<Operand> actualParaVarList = new LinkedList<Operand>();
    public MethodDefinitionNode method;

    @Override
    public void printInformation() {
        String callerStr = "";
        if (caller != null) callerStr = caller.getName() + ".";
        String dstStr = "";
        if (dst != null) dstStr = dst.getName() + " = ";
        System.out.print("call\t" + dstStr +
            callerStr + method.methodName + " ");
        for (Operand item : actualParaVarList)
            System.out.print(item.getName() + " ");
        System.out.println();
    }
    // ATTENTION: pass caller as this
}
