package AstNode;

import java.util.*;

public class ArrayTypeNode extends VariableTypeNode {

    public VariableTypeNode innerTypeNode;
    public ExpressionStatementNode size;

    @Override
    public String getTypeName() {
        if (size == null) return innerTypeNode.getTypeName() + "[]";
        else return innerTypeNode.getTypeName() + "[" + size.toString() + "]";
    }

    public boolean contain(ArrayTypeNode node) {
        if (size != null && node.size == null) return false;
        if (innerTypeNode instanceof ArrayTypeNode && node.innerTypeNode instanceof ArrayTypeNode)
            return ((ArrayTypeNode) innerTypeNode).contain((ArrayTypeNode) node.innerTypeNode);
        else return innerTypeNode.getTypeName().equals(node.innerTypeNode.getTypeName());
    }

    @Override
    public boolean equalTo(VariableTypeNode node) {
        if (!(node instanceof ArrayTypeNode)) return false;
        return innerTypeNode.equalTo(((ArrayTypeNode) node).innerTypeNode);
    }
}
