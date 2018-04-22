package Scope;

import AstNode.*;
import ErrorHandler.*;
import Tool.*;

import java.util.*;

public abstract class Scope {

    public AstNode astNode;
    public Map<String, ClassDefinitionNode> classDefinitionMap;
    public Map<String, MethodDefinitionNode> methodDefinitionMap;
    public Map<String, DefinitionExpressionNode> variableDefinitionMap;
    public List<LocalScope> childrenList;

    public Scope() {
        classDefinitionMap = new HashMap<String, ClassDefinitionNode>();
        methodDefinitionMap = new HashMap<String, MethodDefinitionNode>();
        variableDefinitionMap = new HashMap<String, DefinitionExpressionNode>();
        childrenList = new LinkedList<LocalScope>();
    }

    public void define(ClassDefinitionNode node) throws SemanticException {
        if (classDefinitionMap.get(node.className) == null)
            classDefinitionMap.put(node.className, node);
        else throw new SemanticException("duplicated class definition");
    }

    public void define(MethodDefinitionNode node) throws SemanticException {
        if (methodDefinitionMap.get(node.methodName) == null)
            methodDefinitionMap.put(node.methodName, node);
        else throw new SemanticException("duplicated method definition");
    }

    public void define(DefinitionExpressionNode node) throws SemanticException {
        if (variableDefinitionMap.get(node.variableName) == null)
            variableDefinitionMap.put(node.variableName, node);
        else throw new SemanticException("duplicated variable definition");
    }

    public void printInformation(int tab) {
        String name = astNode.getClass().getName();
        if (astNode instanceof ProgramNode) name = "PROGRAM";
        else if (astNode instanceof ClassDefinitionNode) name = "CLASS: " + ((ClassDefinitionNode) astNode).className;
        else if (astNode instanceof MethodDefinitionNode) name = "METHOD: " + ((MethodDefinitionNode) astNode).methodName;
        else if (astNode instanceof BlockNode) name = "BLOCK";
        PrintTool.printDashAndStr(tab, name);
        PrintTool.printSpaceAndStr(tab, "=class definition:");
        for (String key : classDefinitionMap.keySet())
            PrintTool.printSpaceAndStr(tab, " =" + classDefinitionMap.get(key).className);
        PrintTool.printSpaceAndStr(tab, "=method definition:");
        for (String key : methodDefinitionMap.keySet())
            PrintTool.printSpaceAndStr(tab, " =" + methodDefinitionMap.get(key).methodName);
        PrintTool.printSpaceAndStr(tab, "=variable definition:");
        for (String key : variableDefinitionMap.keySet())
            PrintTool.printSpaceAndStr(tab, " =" + variableDefinitionMap.get(key).variableName);
        for (LocalScope item : childrenList)
            item.printInformation(tab + 1);
    }
}