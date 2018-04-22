package AstNode;

import Tool.*;

import java.util.*;

public class MethodDefinitionNode extends AstNode {

    public TypeNode returnType;
    public String methodName;
    public List<DefinitionExpressionNode> formalArgumentList;
    public BlockNode block;

    public MethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "methodName: " + methodName);
        returnType.printInformation(tab + 1);
        for (DefinitionExpressionNode item : formalArgumentList)
            item.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
