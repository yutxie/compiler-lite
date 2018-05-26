package IR.IRCode;

import IR.IRCode.Variable.*;

public class Unary extends IRCode {

    public enum Type {
        INC, DEC, NEG, NOT,
    }

    public Type type;

    public Variable lhs;

    @Override
    public void printInformation() {
        System.out.println(type.toString() + " " + lhs.id());
    }
}
