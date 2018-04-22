package AstNode;

import Symbol.Type.Type;
import Symbol.Type.TypeReference;
import Tool.*;

public abstract class ExpressionStatementNode extends StatementNode {
    
    public Type exprType;
    public TypeReference exprTypeReference;
    public boolean leftValue;
    
    ExpressionStatementNode() {
        exprType = null;
        exprTypeReference = null;
        leftValue = false;
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (exprType != null) PrintTool.printSpaceAndStr(tab, "type: " + exprType.getTypeName());
        if (exprTypeReference != null)
            PrintTool.printSpaceAndStr(tab, "type: " + exprTypeReference.getReference());
        PrintTool.printSpaceAndStr(tab, "leftValue: " + leftValue);
    }
}
