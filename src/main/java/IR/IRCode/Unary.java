package IR.IRCode;

import IR.IRCode.Operand.*;

public class Unary extends IRCode {

    public enum Type {
        INC, DEC, NEG, NOT,
    }

    public Type type;

    public Operand dst;

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t\t" + dst.getName());
    }
}
