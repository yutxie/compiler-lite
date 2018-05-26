package IR.IRCode.Variable;

public class IndexVariable extends Variable {

    public Variable array;
    public Variable index;

    public IndexVariable(String name) {
        super(name);
    }

    public IndexVariable() {
        super();
    }

    @Override
    public String id() {
        return array.id() + "[" + index.id() + "]";
    }
}
