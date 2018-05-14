package IRCode;

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
}
