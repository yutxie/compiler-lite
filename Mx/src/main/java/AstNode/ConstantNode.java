package AstNode;

import static Tool.PrintTool.*;

public class ConstantNode extends PrimaryExpressionNode {
    
    public String constantStr;

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        printSpaceAndStr(tab, "constantStr: " + constantStr);
    }
}
