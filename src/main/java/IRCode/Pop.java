package IRCode;

import IRCode.Operand.*;

public class Pop extends IRCode {

    public Operand dst;

    @Override
    public void printInformation() {
        System.out.println("pop\t\t" + dst.getName());
    }
}
