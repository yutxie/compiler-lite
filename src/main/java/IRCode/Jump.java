package IRCode;

import IRCode.Register.Register;

public class Jump extends IRCode {

    public Register condition;
    public String targetLabel;
//    public int target;

    @Override
    public void printInformation() {
        String conditionStr = "";
        if (condition != null) conditionStr = condition.id();
        System.out.println("jump " + targetLabel + " when " + conditionStr);
    }
}
