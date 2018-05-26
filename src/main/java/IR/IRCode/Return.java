package IR.IRCode;

import IR.IRCode.Variable.*;

public class Return extends IRCode{

    public Variable returnValue;

    @Override
    public void printInformation() {
        String returnValueStr = "";
        if (returnValue != null) returnValueStr = returnValue.id();
        System.out.println("return " + returnValueStr);
    }
}
