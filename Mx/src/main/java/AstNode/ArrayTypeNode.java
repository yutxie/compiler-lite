package AstNode;

import java.util.*;

public class ArrayTypeNode extends VariableTypeNode {

    public NonArrayTypeNode nonArrayTypeNode;
    public int dim;
    public LinkedList<Integer> dimList;
    public String dimStr;

    @Override
    public String getTypeName() {
        return nonArrayTypeNode.getTypeName() + dimStr;
    }
}
