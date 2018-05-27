package IR.IRCode;

import IR.IRCode.Operand.*;

public class Move extends IRCode{

    public Operand lhs;
    public Operand rhs;

    @Override
    public void printInformation() {
        System.out.println("mov " + lhs.getName() + " " + rhs.getName());
    }
}
