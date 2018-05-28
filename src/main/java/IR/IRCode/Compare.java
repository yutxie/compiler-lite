package IR.IRCode;

import IR.IRCode.Operand.*;

public class Compare extends IRCode {

    public Operand src0;
    public Operand src1;

    @Override
    public void printInformation() {
        System.out.println("cmp\t\t" + src0.getName() + " " + src1.getName());
    }
}
