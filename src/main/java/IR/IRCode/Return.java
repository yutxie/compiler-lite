package IR.IRCode;

import IR.IRCode.Operand.*;

public class Return extends IRCode{

    public Operand returnValue;

    @Override
    public void printInformation() {
        String returnValueStr = "";
        if (returnValue != null) returnValueStr = returnValue.getName();
        System.out.println("ret\t\t" + returnValueStr);
    }
}
