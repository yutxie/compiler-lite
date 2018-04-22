package AstNode;

import Symbol.*;
import Tool.*;

public class TypeNode extends ExpressionStatementNode {

    public Type type;
    public TypeReference typeReference;

    public TypeNode() {}

    public TypeNode(TypeReference typeReference) {
        this.typeReference = typeReference;
    }

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (type != null) PrintTool.printSpaceAndStr(tab, "type: " + type.getTypeName());
        if (typeReference != null)
            PrintTool.printSpaceAndStr(tab, "typeReference: " + typeReference.getReference());
    }
}
