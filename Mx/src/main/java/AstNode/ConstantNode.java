package AstNode;

import Symbol.Type.VariableType;

import static Tool.PrintTool.*;

public class ConstantNode extends PrimaryExpressionNode {
    
    public VariableType exprTypeReference;
    public String constantStr;

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        printSpaceAndStr(tab, "exprTypeReference: " + exprTypeReference.getTypeName());
        printSpaceAndStr(tab, "constantStr: " + constantStr);
    }
}
