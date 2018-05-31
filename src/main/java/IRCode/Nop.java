package IRCode;

public class Nop extends IRCode {

    public String realName;

    @Override
    public void printInformation() {
        if (realName == null) System.out.println("nop");
        else System.out.println(realName);
    }
}
