package AstNode;

import Symbol.*;
import Tool.*;

public class DefinitionExpressionNode extends ExpressionStatementNode {
    
    public VariableType variableType;
    public IdentifierExpressionNode variableIdentifier;
    public ExpressionStatementNode initValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "variableType: " + variableType.getVariableTypeStr());
        variableIdentifier.printInformation(tab + 1);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
