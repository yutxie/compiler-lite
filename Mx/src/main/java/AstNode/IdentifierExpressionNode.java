package AstNode;

import Tool.*;

public class IdentifierExpressionNode extends PrimaryExpressionNode {

    String identifierStr;

    public IdentifierExpressionNode(String str) {
        identifierStr = str;
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "identifierStr: " + identifierStr);
    }
}
