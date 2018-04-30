package AstNode;

import java.util.*;

public class MethodCallExpressionNode extends ExpressionStatementNode {

    public ExpressionStatementNode caller;
    public List<ExpressionStatementNode> actualParameterList;

    public MethodCallExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
