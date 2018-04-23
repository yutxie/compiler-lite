package AstNode;

import Symbol.Type.*;
import static Tool.PrintTool.*;

import java.util.*;

public class MethodDefinitionNode extends AstNode {

    public VariableType returnType;
    public VariableType returnTypeReference;
    public String methodName;
    public List<DefinitionExpressionNode> formalArgumentList;
    public BlockNode block;

    public MethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (returnType != null)
        printSpaceAndStr(tab, "returnType: " + returnType.getTypeName());
        if (returnTypeReference != null)
        printSpaceAndStr(tab, "returnTypeReference: " + returnTypeReference.getTypeName());
        printSpaceAndStr(tab, "methodName: " + methodName);
        for (DefinitionExpressionNode item : formalArgumentList)
            item.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
