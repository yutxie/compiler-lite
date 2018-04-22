package AstNode;

import Symbol.*;
import Tool.*;

public abstract class ExpressionStatementNode extends StatementNode {
    
    public VariableType type;
    public boolean leftValue;
    
    ExpressionStatementNode() {
        type = null;
        leftValue = false;
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (type != null) PrintTool.printSpaceAndStr(tab, "type: " + type.getVariableTypeStr());
        PrintTool.printSpaceAndStr(tab, "leftValue: " + leftValue);
    }
}
