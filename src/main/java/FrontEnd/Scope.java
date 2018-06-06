package FrontEnd;

import AstNode.*;
import Error.*;
import IRCode.Operand.*;

import static Tool.PrintTool.*;

import java.util.*;

public class Scope {

    public Scope parent;
    public AstNode astNode;
    public HashMap<String, ClassDefinitionNode> classDefinitionMap;
    public HashMap<String, MethodDefinitionNode> methodDefinitionMap;
    public HashMap<String, DefinitionExpressionNode> variableDefinitionMap;
    public HashSet<String> nameSet;
    public LinkedList<Scope> childrenList;
    public HashMap<String, Variable> varMap;

    public Scope() {
        classDefinitionMap = new HashMap<String, ClassDefinitionNode>();
        methodDefinitionMap = new HashMap<String, MethodDefinitionNode>();
        variableDefinitionMap = new HashMap<String, DefinitionExpressionNode>();
        nameSet = new HashSet<String>();
        childrenList = new LinkedList<Scope>();
        varMap = new HashMap<String, Variable>();
    }

    public void define(String varName, Variable var) throws Exception {
        varMap.put(varName, var);
//        if (varMap.get(varName) != null)
//            return;
////            throw new Exception("var " + varName + " dupllicated");
//        else varMap.put(varName, var);
    }

    public Variable getReg(String varName) throws Exception {
        Variable var = varMap.get(varName);
        if (var != null) return var;
        else if (parent != null) return parent.getReg(varName);
        else throw new Exception("no such var named " + varName);
    }

    public void define(ClassDefinitionNode node) throws SemanticException {
        if (nameSet.contains(node.className))
            throw new SemanticException(node.line, "duplicated name");
        else nameSet.add(node.className);
        if (classDefinitionMap.get(node.className) == null)
            classDefinitionMap.put(node.className, node);
        else throw new SemanticException(node.line, "duplicated class definition");
    }

    public void define(MethodDefinitionNode node) throws SemanticException {
        if (nameSet.contains(node.methodName))
            throw new SemanticException(node.line, "duplicated name");
        else nameSet.add(node.methodName);
        if (methodDefinitionMap.get(node.methodName) == null)
            methodDefinitionMap.put(node.methodName, node);
        else throw new SemanticException(node.line, "duplicated method definition");
    }

    public void define(DefinitionExpressionNode node) throws SemanticException {
        if (nameSet.contains(node.variableName))
            throw new SemanticException(node.line, "duplicated name");
        else nameSet.add(node.variableName);
        if (variableDefinitionMap.get(node.variableName) == null)
            variableDefinitionMap.put(node.variableName, node);
        else throw new SemanticException(node.line, "duplicated variable definition");
    }

    public ClassDefinitionNode getClass(String name) {
        ClassDefinitionNode res = classDefinitionMap.get(name);
        if (res != null) return res;
        else if (parent != null) return parent.getClass(name);
        else return null;
    }

    public MethodDefinitionNode getMethod(String name) {
        MethodDefinitionNode res = methodDefinitionMap.get(name);
        if (res != null) return res;
        else if (parent != null) return parent.getMethod(name);
        else return null;
    }

    public DefinitionExpressionNode getVar(String name) {
        DefinitionExpressionNode res = variableDefinitionMap.get(name);
        if (res != null) return res;
        else if (parent != null) return parent.getVar(name);
        else return null;
    }

    public AstNode get(String name) throws SemanticException {
        ClassDefinitionNode classDefinitionNode = classDefinitionMap.get(name);
        MethodDefinitionNode methodDefinitionNode = methodDefinitionMap.get(name);
        DefinitionExpressionNode variableDefinitionNode = variableDefinitionMap.get(name);
        if (classDefinitionNode != null) return classDefinitionNode;
        if (methodDefinitionNode != null) return methodDefinitionNode;
        if (variableDefinitionNode != null) return variableDefinitionNode;
        if (parent != null) return parent.get(name);
        throw new SemanticException("no such entity named \"" + name + "\"");
    }

    public void printInformation(int tab) {
        String name = astNode.getClass().getName();
        if (astNode instanceof ProgramNode) name = "PROGRAM";
        else if (astNode instanceof ClassDefinitionNode) name = "CLASS: " + ((ClassDefinitionNode) astNode).className;
        else if (astNode instanceof MethodDefinitionNode) name = "METHOD: " + ((MethodDefinitionNode) astNode).methodName;
        else if (astNode instanceof BlockNode) name = "BLOCK";
        printDashAndStr(tab, name);
        printSpaceAndStr(tab, "=class definition:");
        for (String key : classDefinitionMap.keySet())
            printSpaceAndStr(tab, " =" + classDefinitionMap.get(key).className);
        printSpaceAndStr(tab, "=method definition:");
        for (String key : methodDefinitionMap.keySet())
            printSpaceAndStr(tab, " =" + methodDefinitionMap.get(key).methodName);
        printSpaceAndStr(tab, "=variable definition:");
        for (String key : variableDefinitionMap.keySet())
            printSpaceAndStr(tab, " =" + variableDefinitionMap.get(key).variableName);
        for (Scope item : childrenList)
            item.printInformation(tab + 1);
    }
}