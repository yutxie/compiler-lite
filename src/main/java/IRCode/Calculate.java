package IRCode;

import IRCode.Register.Register;

public class Calculate extends IRCode {

    public enum Type {
        ASSIGN,
        MUL, DIV, MOD, ADD, SUB,
        LSHIF, RSHIF,
        LE, GE, LT, GT,
        EQUAL, NOTEQUAL,
        AND, XOR, OR, LAND, LOR,
        NEGATE, NOT, LNOT,
        INC, DEC
    }

    public Type type;

    public Register lhs;
    public Register rhs0;
    public Register rhs1;

    @Override
    public void printInformation() {
        String lhsStr = String.valueOf(lhs.id());
        String rhs0Str = String.valueOf(rhs0.id());
        String rhs1Str = "";
        if (rhs1 != null) rhs1Str = String.valueOf(rhs1.id());
        System.out.println("calculate " + lhsStr + " = " +
            rhs0Str + " " + type.toString() + " " + rhs1Str);
    }
}
