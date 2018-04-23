package Symbol.Type;

import java.util.*;

public class ArrayType extends VariableType {

    public NonArrayType nonArrayType;
    public int dim;
    public LinkedList<Integer> dimList;
    public String dimStr;

    @Override
    public String getTypeName() {
        return nonArrayType.getTypeName() + dimStr;
    }
}
