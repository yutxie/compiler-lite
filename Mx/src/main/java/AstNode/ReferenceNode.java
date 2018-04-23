package AstNode;

import static Tool.PrintTool.*;

public class ReferenceNode extends PrimaryExpressionNode {

    public enum ReferenceType {
        VARIABLE, METHOD, CLASS
    }

    public String referenceName;
    public ReferenceType referenceType;

    public ReferenceNode(String str) {
        referenceName = str;
    }

    @Override
    public void printInformation(int tab) {
        super.printInformation(tab);
        if (referenceType != null)
        printSpaceAndStr(tab, "referenceType: " + referenceType);
        printSpaceAndStr(tab, "referenceName: " + referenceName);
    }
}
