package IRCode;

import IRCode.Variable.*;

public class Jump extends IRCode {

    public enum Type {
        TURE, FALSE
    }

    public Variable condition;
    public String targetLabel;
    public Type type;

    @Override
    public void printInformation() {
        System.out.print("jump " + targetLabel);
        if (condition != null)
            System.out.println(" when " + condition.id() + " " + type.toString());
        else System.out.println();
    }
}
