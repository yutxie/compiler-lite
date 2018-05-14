package IRCode;

public class IndexAcess extends IRCode{

    public Register lhs;
    public Register callerReg;
    public Register indexReg;

    @Override
    public void printInformation() {
        System.out.println("index " + lhs.id() + " " +
            callerReg.id() + " " + indexReg.id());
    }
}
