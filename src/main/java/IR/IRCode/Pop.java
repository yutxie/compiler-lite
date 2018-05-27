package IR.IRCode;

import IR.IRCode.Operand.*;

public class Pop extends IRCode {

    public Operand rhs;

    @Override
    public void printInformation() {
        System.out.println("pop\t\t" + rhs.getName());
    }
}
