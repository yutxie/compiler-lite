package AstNode;

import java.util.LinkedList;
import java.util.List;

public class ProgramNode extends AstNode {

    public List<ClassDefinitionNode> classDefinitionList;
    public List<MethodDefinitionNode> methodDefinitionList;
    public List<DefinitionExpressionNode> variableDefinitionList;
    public List<AstNode> childrenList;

    public ProgramNode() {
        classDefinitionList = new LinkedList<ClassDefinitionNode>();
        methodDefinitionList = new LinkedList<MethodDefinitionNode>();
        variableDefinitionList = new LinkedList<DefinitionExpressionNode>();
        childrenList = new LinkedList<AstNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (AstNode item : childrenList)
            item.printInformation(tab + 1);
    }
}
