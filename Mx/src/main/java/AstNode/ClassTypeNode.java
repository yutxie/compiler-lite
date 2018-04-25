package AstNode;

public class ClassTypeNode extends NonArrayTypeNode {

    public ReferenceNode referenceClass;

    public ClassTypeNode(ReferenceNode node) {
        referenceClass = node;
    }

    @Override
    public String getTypeName() {
        return referenceClass.referenceName;
    }
}
