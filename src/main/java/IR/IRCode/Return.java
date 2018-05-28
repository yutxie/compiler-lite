package IR.IRCode;

import IR.IRCode.Operand.*;

public class Return extends IRCode{

    public Operand src;

    @Override
    public void printInformation() {
        String srcStr = "";
        if (src != null) srcStr = src.getName();
        System.out.println("ret\t\t" + srcStr);
    }
}
