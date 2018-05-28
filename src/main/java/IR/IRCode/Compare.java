package IR.IRCode;

import IR.IRCode.Operand.*;

public class Compare extends IRCode {

    public Operand rhs0;
    public Operand rhs1;

    @Override
    public void printInformation() {
        System.out.println("cmp\t\t" + rhs0.getName() + " " + rhs1.getName());
    }
}
