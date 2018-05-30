package FrontEnd;

import AstNode.*;
import Error.*;

import java.util.*;

public class ScopeTreeBuilder extends AstVisitor {

    LinkedList<Scope> scopeStack;

    public ScopeTreeBuilder() {
        this.scopeStack = new LinkedList<Scope>();
    }

    public Scope buildScopeTree(ProgramNode prog) throws Exception {
        visit(prog);
        if (scopeStack.size() != 1) throw new Exception("size of scopeStack is not 1");
        return scopeStack.getFirst();
    }

    Scope currentScope() {
        return scopeStack.getLast();
    }

    void pushScope(Scope scope) throws SemanticException {
        scope.parent = currentScope();
        scope.parent.childrenList.add(scope);
        scopeStack.addLast(scope);
    }

    void popScope() {
        scopeStack.removeLast();
    }

    @Override void visit(ProgramNode node) throws Exception {
        Scope toplevelScope = new Scope();
        node.scope = toplevelScope;
        for (ClassDefinitionNode item : node.classDefinitionList)
            toplevelScope.define(item);
        for (MethodDefinitionNode item : node.methodDefinitionList)
            toplevelScope.define(item);
        MethodDefinitionNode main = toplevelScope.methodDefinitionMap.get("main");
        if (main == null)
            throw new SemanticException("no method name main");
        else if (!main.returnType.getTypeName().equals("int"))
            throw new SemanticException(main.line, "return type of main must be int");
        else if (!main.formalArgumentList.isEmpty())
            throw new SemanticException(main.line, "main can not have parameters");
        toplevelScope.astNode = node;
        scopeStack.addLast(toplevelScope);
        super.visit(node);
    }

    @Override void visit(ClassDefinitionNode node) throws Exception {
        Scope scope = new Scope();
        pushScope(scope);
        for (MethodDefinitionNode item : node.memberMethodList)
            scope.define(item);
        for (MethodDefinitionNode item : node.memberConstructionMethodList)
            scope.define(item);
        scope.astNode = node;
        node.scope = currentScope();
        super.visit(node);
        popScope();
    }

    @Override void visit(MethodDefinitionNode node) throws Exception {
        Scope scope = new Scope();
        pushScope(scope);
        scope.astNode = node;
        node.scope = currentScope();
        super.visit(node);
        popScope();
    }

    @Override void visit(BlockNode node) throws Exception {
        Scope scope = new Scope();
        pushScope(scope);
        scope.astNode = node;
        node.scope = currentScope();
        super.visit(node);
        popScope();
    }

    @Override void visit(ForStatementNode node) throws Exception {
        Scope scope = new Scope();
        pushScope(scope);
        scope.astNode = node;
        node.scope = currentScope();
        super.visit(node);
        popScope();
    }

    @Override void visit(StatementNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(ExpressionStatementNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(PrimaryExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(ReferenceNode node) throws SemanticException {
        node.scope = node.parent.scope;
        AstNode definitionNode;
        try {
            definitionNode = currentScope().get(node.referenceName);
        } catch (SemanticException exception) {
            throw new SemanticException(node.line, exception.getMessage());
        }
        if (definitionNode instanceof ClassDefinitionNode)
            node.referenceType = ReferenceNode.ReferenceType.CLASS;
        else if (definitionNode instanceof MethodDefinitionNode)
            node.referenceType = ReferenceNode.ReferenceType.METHOD;
        else if (definitionNode instanceof DefinitionExpressionNode)
            node.referenceType = ReferenceNode.ReferenceType.VARIABLE;
        node.definitionNode = definitionNode;
    }

    @Override void visit(ConstantNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(ThisNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(DefinitionExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
        currentScope().define(node);
    }

    @Override void visit(MemberAccessExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        visit(node.caller);
        try {
            visit(node.member);
        } catch (SemanticException exception) {}
    }

    @Override void visit(IndexAccessExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }
    @Override void visit(MethodCallExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(NewExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(UnaryExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(BinaryExpressionNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(TypeNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(NonArrayTypeNode node) throws SemanticException {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(PrimitiveTypeNode node) {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(ClassTypeNode node) throws SemanticException {
        node.scope = node.parent.scope;
        super.visit(node);
    }

    @Override void visit(ArrayTypeNode node) throws Exception {
        node.scope = node.parent.scope;
        super.visit(node);
    }
}