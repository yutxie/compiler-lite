package AstNode;

import Symbol.*;
import Tool.*;

import java.util.*;

public class MethodDefinitionNode extends AstNode {

    public VariableType returnType;
    public IdentifierExpressionNode identifier;
    public List<DefinitionExpressionNode> formalArgumentList;
    public BlockNode block;

    public MethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "returnType: " + returnType.getVariableTypeStr());
        identifier.printInformation(tab + 1);
        for (DefinitionExpressionNode item : formalArgumentList)
            item.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
