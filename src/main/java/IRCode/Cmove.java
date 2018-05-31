package IRCode;

import IRCode.Operand.*;

public class Cmove extends IRCode {

    public enum Type {
        CMOVZ, CMOVNZ,
        CMOVE, CMOVNE,
        CMOVL, CMOVNL, CMOVG, CMOVNG,
        CMOVLE, CMOVNLE, CMOVGE, CMOVNGE
    }

    public Type type;
    public Operand dst;
    public Operand src;

//    Set() {}

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t" + dst.getName() + " " + src.getName());
    }
}
