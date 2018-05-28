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

    public Operand lhs;
    public Operand rhs;

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t\t" + lhs.getName() + ", " + rhs.getName());
    }
}
