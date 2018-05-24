package IRCode;

import IRCode.Variable.*;

public class Calculate extends IRCode {

    public enum Type {
        INC, DEC, NEG, NOT,
        ADD, SUB, MUL, DIV, MOD,
        XOR, OR, AND,
        LSHIFT, RSHIFT,
        LE, GE, LT, GT,
        EQUAL, NOTEQUAL
    }

    public Type type;

    public Variable lhs;
    public Variable rhs;

    @Override
    public void printInformation() {
        String lhsStr = lhs.id();
        String rhsStr = "";
        if (lhs != null) lhsStr = lhs.id();
        System.out.println(type.toString() + " " + lhsStr + ", " + rhsStr);
    }
}
