package AstNode;

import java.util.LinkedList;
import java.util.List;

// ------------------------- program ------------------------
public class ProgramNode extends AstNode {

    public List<ClassDefinitionNode> classDefinitionList;
    public List<MethodDefinitionNode> methodDefinitionList;
    public List<DefinitionExpressionNode> variableDefinitionList;

    public ProgramNode() {
        classDefinitionList = new LinkedList<ClassDefinitionNode>();
        methodDefinitionList = new LinkedList<MethodDefinitionNode>();
        variableDefinitionList = new LinkedList<DefinitionExpressionNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (ClassDefinitionNode item : classDefinitionList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : methodDefinitionList)
            item.printInformation(tab + 1);
        for (DefinitionExpressionNode item : variableDefinitionList)
            item.printInformation(tab + 1);
    }
}
