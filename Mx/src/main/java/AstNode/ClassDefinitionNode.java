package AstNode;

import java.util.*;

// ------------------------ class definition ----------------------
public class ClassDefinitionNode extends AstNode {

    public IdentifierExpressionNode identifier;
    public List<DefinitionExpressionNode> memberVariableList;
    public List<MethodDefinitionNode> memberMethodList;
    public List<MethodDefinitionNode> memberConstructionMethodList;
    
    public ClassDefinitionNode() {
        memberVariableList = new LinkedList<DefinitionExpressionNode>();
        memberMethodList = new LinkedList<MethodDefinitionNode>();
        memberConstructionMethodList = new LinkedList<MethodDefinitionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        identifier.printInformation(tab + 1);
        for (DefinitionExpressionNode item : memberVariableList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : memberMethodList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : memberConstructionMethodList)
            item.printInformation(tab + 1);
    }
}
