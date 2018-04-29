package AstNode;

public class ClassTypeNode extends NonArrayTypeNode {

    public String referenceClassName;
    public ClassDefinitionNode referenceClass;

    public ClassTypeNode(String str) {
        referenceClassName = str;
    }

    @Override
    public String getTypeName() {
        return referenceClassName;
    }
}
