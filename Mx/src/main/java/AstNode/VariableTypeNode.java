package AstNode;

public class VariableTypeNode extends TypeNode {

    public boolean isPrimitiveType(PrimitiveTypeNode.PrimitiveTypeKeyword type) {
        if (!(this instanceof PrimitiveTypeNode)) return false;
        if (((PrimitiveTypeNode) this).type.equals(type)) return true;
        else return false;
    }
}
