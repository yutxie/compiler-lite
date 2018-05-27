package IR.IRCode;

import IR.IRCode.Operand.*;

public class Jump extends IRCode {

    public enum Type {
        TURE, FALSE
    }

    public Operand condition;
    public String targetLabel;
    public Type type;

    @Override
    public void printInformation() {
        System.out.print("jump " + targetLabel);
        if (condition != null)
            System.out.println(" when " + condition.getName() + " " + type.toString());
        else System.out.println();
    }
}
