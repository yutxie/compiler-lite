package AstNode;

import Tool.*;

public class DefinitionExpressionNode extends ExpressionStatementNode {
    
    public TypeNode variableType;
    public String variableName;
    public ExpressionStatementNode initValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "variableName: " + variableName);
        variableType.printInformation(tab + 1);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
