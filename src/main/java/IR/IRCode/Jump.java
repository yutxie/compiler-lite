package IR.IRCode;

import IR.IRCode.Operand.*;

public class Jump extends IRCode {

    public enum Type {
        JMP,
        JZ, JNZ,
        JE, JNE,
        JL, JNL, JG, JNG,
        JLE, JNLE, JGE, JNGE
    }

    public String targetLabel;
    public Type type;

    @Override
    public void printInformation() {
        System.out.println(type.toString().toLowerCase() + "\t\t" + targetLabel);
    }
}
