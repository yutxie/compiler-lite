package AstNode;

import static Tool.PrintTool.*;

import java.util.*;

public class MethodDefinitionNode extends AstNode {

    public VariableTypeNode returnType;
    public String methodName;
    public List<DefinitionExpressionNode> formalArgumentList;
    public BlockNode block;

    public MethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (returnType != null) returnType.printInformation(tab + 1);
        printSpaceAndStr(tab, "methodName: " + methodName);
        for (DefinitionExpressionNode item : formalArgumentList)
            item.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
