package AstNode;

import static Tool.PrintTool.*;

public class ReferenceNode extends PrimaryExpressionNode {

    public enum ReferenceType {
        VARIABLE, METHOD, CLASS
    }

    public String referenceName;
    public ReferenceType referenceType;
    public AstNode definitionNode;

    public ReferenceNode(String str) {
        referenceName = str;
    }

    @Override
    public void printInformation(int tab) {
        super.printInformation(tab);
        printSpaceAndStr(tab, "referenceName: " + referenceName);
        if (referenceType != null)
        printSpaceAndStr(tab, "referenceType: " + referenceType);
        if (definitionNode != null)
        printSpaceAndStr(tab, "definitionNode: " + Integer.toString(definitionNode.line));
    }
}
