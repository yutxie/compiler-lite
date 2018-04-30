package AstNode;

import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

public class VariableTypeNode extends TypeNode {

    public boolean isPrimitiveType(PrimitiveTypeNode.PrimitiveTypeKeyword type) {
        if (type == INT && this instanceof ClassTypeNode)
            if (((ClassTypeNode) this).referenceClassName.equals("string"))
                return true;
        if (!(this instanceof PrimitiveTypeNode)) return false;
        if (((PrimitiveTypeNode) this).type.equals(type)) return true;
        else return false;
    }

    public boolean equalTo(VariableTypeNode node) {
        if (this instanceof PrimitiveTypeNode) return ((PrimitiveTypeNode)node).equalTo(node);
        else if (this instanceof ClassTypeNode) return ((ClassTypeNode)node).equalTo(node);
        else return ((ArrayTypeNode)node).equalTo(node);
    }
}
