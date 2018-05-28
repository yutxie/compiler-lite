package IR.IRCode;

import IR.IRCode.Operand.*;

public class Binary extends IRCode {

    public enum Type {
        ADD, SUB,
        // MUL,DIV, MOD,
        XOR, OR, AND,
//        LSHIFT, RSHIFT,
//        LE, GE, LT, GT,
//        EQUAL, NOTEQUAL
    }

    public Type type;

    public Operand dst;
    public Operand src;

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t\t" + dst.getName() + " " + src.getName());
    }
}
