package AstNode;

import Tool.*;

import java.util.*;

// ------------------------ class definition ----------------------
public class ClassDefinitionNode extends AstNode {

    public String className;
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
        PrintTool.printSpaceAndStr(tab, "name: " + className);
        for (DefinitionExpressionNode item : memberVariableList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : memberMethodList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : memberConstructionMethodList)
            item.printInformation(tab + 1);
    }
}
