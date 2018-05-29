package IRCode;

import IRCode.Operand.*;

public class Set extends IRCode {

    public enum Type {
        SETZ, SETNZ,
        SETE, SETNE,
        SETL, SETNL, SETG, SETNG,
        SETLE, SETNLE, SETGE, SETNGE
    }

    public Type type;
    public Operand dst;

//    Set() {}

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t" + dst.getName());
    }
}
