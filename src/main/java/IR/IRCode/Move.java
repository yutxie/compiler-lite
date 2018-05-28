package IR.IRCode;

import IR.IRCode.Operand.*;

public class Move extends IRCode{

    public Operand dst;
    public Operand src;

    @Override
    public void printInformation() {
        System.out.println("mov\t\t" + dst.getName() + " " + src.getName());
    }
}
