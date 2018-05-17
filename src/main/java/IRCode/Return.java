package IRCode;

import IRCode.Register.Register;

public class Return extends IRCode{

    public Register returnValue;

    @Override
    public void printInformation() {
        String returnValueStr = "";
        if (returnValue != null) returnValueStr = returnValue.id();
        System.out.println("return " + returnValueStr);
    }
}
