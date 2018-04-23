package AstNode;

import Symbol.Type.*;
import static Tool.PrintTool.*;

public class DefinitionExpressionNode extends ExpressionStatementNode {
    
    public VariableType variableType;
    public VariableType variableTypeReference;
    public String variableName;
    public ExpressionStatementNode initValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (variableType != null)
        printSpaceAndStr(tab, "variableType: " + variableType.getTypeName());
        printSpaceAndStr(tab, "variableTypeReference: " + variableTypeReference.getTypeName());
        printSpaceAndStr(tab, "variableName: " + variableName);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
