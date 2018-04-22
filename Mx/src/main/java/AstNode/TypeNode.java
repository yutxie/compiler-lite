package AstNode;

import Symbol.Type.Type;
import Symbol.Type.TypeReference;
import Symbol.Type.TypeTypeReference;
import Tool.*;

public class TypeNode extends ExpressionStatementNode {

    public Type type;
    public TypeReference typeReference;

    public TypeNode() {
        exprTypeReference = new TypeTypeReference();
    }

    public TypeNode(TypeReference typeReference) {
        this();
        this.typeReference = typeReference;
    }

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (type != null) PrintTool.printSpaceAndStr(tab, "type: " + type.getTypeName());
        if (typeReference != null)
            PrintTool.printSpaceAndStr(tab, "typeReference: " + typeReference.getReference());
    }
}
