package AstNode;

import Tool.*;

public class ConstantNode extends PrimaryExpressionNode {
    
    public String constantStr;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "constantStr: " + constantStr);
    }
}
