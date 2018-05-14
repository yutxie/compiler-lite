package IRCode;

public class Jump extends IRCode {

    public Register condition;
    public String targetLabel;
    public IRCode target;
}
