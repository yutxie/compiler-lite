package IRCode;

import IRCode.Operand.*;

public class Idiv extends IRCode {

    public enum Type {
        IDIV, IMOD
    }

    public Operand dst;
    public Operand src0;
    public Operand src1;
    public Type type;

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t" +
            dst.getName() + " " + src0.getName() + " " + src1.getName());
    }
}
