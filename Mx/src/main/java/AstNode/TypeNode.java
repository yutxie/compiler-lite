package AstNode;

import static Tool.PrintTool.*;

public class TypeNode extends ExpressionStatementNode {

    public String getTypeName() {
        return this.getClass().getName();
    }

    @Override
    public void printInformation(int tab) {
        super.printInformation(tab);
        printSpaceAndStr(tab, "type: " + getTypeName());
    }
}
