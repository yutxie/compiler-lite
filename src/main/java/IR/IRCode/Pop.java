package IR.IRCode;

import IR.IRCode.Operand.*;

public class Pop extends IRCode {

    public Operand dst;

    @Override
    public void printInformation() {
        System.out.println("pop\t\t" + dst.getName());
    }
}
