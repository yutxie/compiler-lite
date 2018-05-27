package IR.IRCode;

import IR.IRCode.Operand.Operand;

public class Push extends IRCode {

    public Operand rhs;

    @Override
    public void printInformation() {
        System.out.println("push\t" + rhs.getName());
    }
}
