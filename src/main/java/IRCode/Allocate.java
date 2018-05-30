package IRCode;

import AstNode.*;
import IRCode.Operand.*;

public class Allocate extends IRCode {

    public Operand dst;
    public Operand size;

    @Override
    public void printInformation() {
        System.out.println("allocate\t" + dst.getName() + " " + size.getName());
    }
}
