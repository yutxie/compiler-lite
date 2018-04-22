package AstVisitor;

import AstNode.*;
import Scope.*;
import Symbol.*;
import ErrorHandler.*;

import java.util.*;

public class ScopeTreeBuilder extends AstVisitor {

    public LinkedList<Scope> scopeStack;
    public ConstantTable constantTable;

    public ScopeTreeBuilder() {
        this.scopeStack = new LinkedList<Scope>();
        this.constantTable = new ConstantTable();
    }

    public ToplevelScope buildScopeTree(ProgramNode prog) throws Exception {
        visit(prog);
        if (scopeStack.size() != 1) throw new Exception("size of scopeStack is not 1");
        return (ToplevelScope)scopeStack.getFirst();
    }

    public Scope currentScope() {
        return scopeStack.getLast();
    }

    public void pushScope(LocalScope scope) throws SemanticException {
        scope.parent = currentScope();
        scope.parent.childrenList.add(scope);
        scopeStack.addLast(scope);
    }

    public LocalScope popScope() {
        return (LocalScope)scopeStack.removeLast();
    }

    @Override public void visit(ProgramNode node) throws SemanticException {
        ToplevelScope toplevelScope = new ToplevelScope();
        for (ClassDefinitionNode item : node.classDefinitionList)
            toplevelScope.define(item);
        for (MethodDefinitionNode item : node.methodDefinitionList)
            toplevelScope.define(item);
        for (DefinitionExpressionNode item : node.variableDefinitionList)
            toplevelScope.define(item);
        toplevelScope.astNode = node;
        scopeStack.addLast(toplevelScope);
        super.visit(node);
        node.scope = toplevelScope;
    }

    @Override public void visit(ClassDefinitionNode node) throws SemanticException {
        LocalScope scope = new LocalScope();
        for (DefinitionExpressionNode item : node.memberVariableList)
            scope.define(item);
        for (MethodDefinitionNode item : node.memberMethodList)
            scope.define(item);
        for (MethodDefinitionNode item : node.memberConstructionMethodList)
            scope.define(item);
        scope.astNode = node;
        pushScope(scope);
        super.visit(node);
        node.scope = popScope();
    }

    @Override public void visit(MethodDefinitionNode node) throws SemanticException {
        LocalScope scope = new LocalScope();
        for (DefinitionExpressionNode item : node.formalArgumentList)
            scope.define(item);
        scope.astNode = node;
        pushScope(scope);
        super.visit(node);
        node.scope = popScope();
    }

    @Override public void visit(BlockNode node) throws SemanticException {
        LocalScope scope = new LocalScope();
        for (StatementNode item : node.statementList)
            if (item instanceof DefinitionExpressionNode)
                scope.define((DefinitionExpressionNode)item);
        scope.astNode = node;
        pushScope(scope);
        super.visit(node);
        node.scope = popScope();
    }
}