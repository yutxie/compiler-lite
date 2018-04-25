package AstNode;

import static Tool.PrintTool.*;

public class DefinitionExpressionNode extends ExpressionStatementNode {
    
    public VariableTypeNode variableType;
    public String variableName;
    public ExpressionStatementNode initValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (variableType != null) variableType.printInformation(tab + 1);
        printSpaceAndStr(tab, "variableName: " + variableName);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
