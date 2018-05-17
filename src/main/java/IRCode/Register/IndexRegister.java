package IRCode.Register;

public class IndexRegister extends Register {

    public Register array;
    public Register index;

    @Override
    public String id() {
        return String.valueOf(array.hashCode()) + "[" + index.hashCode() + "]";
    }
}
