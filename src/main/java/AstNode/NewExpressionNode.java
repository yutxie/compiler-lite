package AstNode;

import static Tool.PrintTool.*;

import java.util.*;

public class NewExpressionNode extends ExpressionStatementNode {

    public VariableTypeNode variableType;
    public List<ExpressionStatementNode> actualParameterList;
    
    public NewExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (variableType != null) variableType.printInformation(tab + 1);
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
