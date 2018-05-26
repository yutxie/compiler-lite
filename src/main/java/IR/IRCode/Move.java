package IR.IRCode;

import IR.IRCode.Variable.*;

public class Move extends IRCode{

    public Variable lhs;
    public Variable rhs;

    @Override
    public void printInformation() {
        System.out.println("mov " + lhs.id() + " " + rhs.id());
    }
}
