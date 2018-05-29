package IRCode.Operand;

import java.util.HashSet;

public class IndexVariable extends Operand {

    public Operand array;
    public Operand index;

    @Override
    public HashSet<Variable> colorable() {
        return new HashSet<Variable>();
    }

    @Override
    public String getName() {
        return array.getName() + "[" + index.getName() + "]";
    }
}
