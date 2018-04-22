package AstNode;

import Symbol.*;
import Tool.*;

import java.util.*;

public class NewExpressionNode extends ExpressionStatementNode {

    public TypeNode variableType;
    public List<ExpressionStatementNode> actualParameterList;
    
    public NewExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        variableType.printInformation(tab + 1);
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
