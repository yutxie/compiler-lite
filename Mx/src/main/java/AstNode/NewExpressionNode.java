package AstNode;

import Symbol.Type.*;
import static Tool.PrintTool.*;

import java.util.*;

public class NewExpressionNode extends ExpressionStatementNode {

    public VariableType variableType;
    public VariableType variableTypeReference;
    public List<ExpressionStatementNode> actualParameterList;
    
    public NewExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (variableType != null)
        printSpaceAndStr(tab, "variableType: " + variableType.getTypeName());
        printSpaceAndStr(tab, "variableTypeReference: " + variableTypeReference.getTypeName());
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
