package AstNode;

import Symbol.Type.*;
import static Tool.PrintTool.*;

public abstract class ExpressionStatementNode extends StatementNode {
    
    public Type exprType;
    public boolean leftValue;
    
    ExpressionStatementNode() {
        exprType = null;
        leftValue = false;
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (exprType != null)
        printSpaceAndStr(tab, "type: " + exprType.getTypeName());
        printSpaceAndStr(tab, "leftValue: " + leftValue);
    }
}
