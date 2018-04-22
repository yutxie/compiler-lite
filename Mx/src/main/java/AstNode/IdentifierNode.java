package AstNode;

import Tool.*;

class IdentifierNode extends PrimaryExpressionNode {

    String identifierStr;

    public IdentifierNode(String str) {
        identifierStr = str;
    }

    public String getIdentifierStr() {
        return identifierStr;
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "identifierStr: " + identifierStr);
    }
}
