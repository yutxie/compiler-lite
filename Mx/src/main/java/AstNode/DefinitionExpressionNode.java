package AstNode;

import Symbol.*;
import Tool.*;

public class DefinitionExpressionNode extends ExpressionStatementNode {
    
    public TypeNode variableType;
    public IdentifierExpressionNode variableIdentifier;
    public ExpressionStatementNode initValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        variableType.printInformation(tab + 1);
        variableIdentifier.printInformation(tab + 1);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
