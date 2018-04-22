package AstVisitor;

import AstNode.*;
import ErrorHandler.SemanticException;

public abstract class AstVisitor {

    public void visit(BinaryExpressionNode node) {
        visit(node.lhs);
        visit(node.rhs);
    }

    public void visit(BlockNode node) throws SemanticException {
        for (StatementNode item : node.statementList) visit(item);
    }

    public void visit(BreakStatementNode node) {}

    public void visit(ClassDefinitionNode node) throws SemanticException {
        for (DefinitionExpressionNode item : node.memberVariableList) visit(item);
        for (MethodDefinitionNode item : node.memberMethodList) visit(item);
        for (MethodDefinitionNode item : node.memberConstructionMethodList) visit(item);
    }

    public void visit(ConstantNode node) {}

    public void visit(ContinueStatementNode node) {}

    public void visit(DefinitionExpressionNode node) {
        visit(node.variableType);
        if (node.initValue != null) visit(node.initValue);
    }

    public void visit(EmptyStatementNode node) {}

    public void visit(ExpressionStatementNode node) {
        if (node instanceof PrimaryExpressionNode) visit((PrimaryExpressionNode)node);
        if (node instanceof DefinitionExpressionNode) visit((DefinitionExpressionNode)node);
        if (node instanceof MemberAccessExpressionNode) visit((MemberAccessExpressionNode)node);
        if (node instanceof IndexAccessExpressionNode) visit((IndexAccessExpressionNode)node);
        if (node instanceof MethodCallExpressionNode) visit((MethodCallExpressionNode)node);
        if (node instanceof NewExpressionNode) visit((NewExpressionNode)node);
        if (node instanceof UnaryExpressionNode) visit((UnaryExpressionNode)node);
        if (node instanceof BinaryExpressionNode) visit((BinaryExpressionNode)node);
        if (node instanceof TypeNode) visit((TypeNode)node);
    }

    public void visit(ForStatementNode node) throws SemanticException {
        if (node.init != null) visit(node.init);
        if (node.condition != null) visit(node.condition);
        if (node.afterBlock != null) visit(node.afterBlock);
        visit(node.block);
    }

    public void visit(IfStatementNode node) throws SemanticException {
        visit(node.condition);
        visit(node.ifBlock);
        if (node.elseBlock != null) visit(node.elseBlock);
    }

    public void visit(IndexAccessExpressionNode node) {
        visit(node.caller);
        visit(node.index);
    }

    public void visit(MemberAccessExpressionNode node) {
        visit(node.caller);
        visit(node.member);
    }

    public void visit(MethodCallExpressionNode node) {
        visit(node.caller);
        for (ExpressionStatementNode item : node.actualParameterList) visit(item);
    }

    public void visit(MethodDefinitionNode node) throws SemanticException {
        visit(node.returnType);
        for (DefinitionExpressionNode item : node.formalArgumentList) visit(item);
        visit(node.block);
    }

    public void visit(NewExpressionNode node) {
        visit(node.variableType);
        for (ExpressionStatementNode item : node.actualParameterList) visit(item);
    }

    public void visit(PrimaryExpressionNode node) {
        if (node instanceof VariableNode) visit((VariableNode)node);
        if (node instanceof ConstantNode) visit((ConstantNode)node);
        if (node instanceof ThisNode) visit((ThisNode)node);
    }

    public void visit(ProgramNode node) throws SemanticException {
        for (ClassDefinitionNode item : node.classDefinitionList) visit(item);
        for (MethodDefinitionNode item : node.methodDefinitionList) visit(item);
        for (DefinitionExpressionNode item : node.variableDefinitionList) visit(item);
    }

    public void visit(ReturnStatementNode node) {
        if (node.returnValue != null) visit(node.returnValue);
    }

    public void visit(StatementNode node) throws SemanticException {
        if (node instanceof ExpressionStatementNode) visit((ExpressionStatementNode)node);
        if (node instanceof IfStatementNode) visit((IfStatementNode)node);
        if (node instanceof ForStatementNode) visit((ForStatementNode)node);
        if (node instanceof WhileStatementNode) visit((WhileStatementNode)node);
        if (node instanceof ReturnStatementNode) visit((ReturnStatementNode)node);
        if (node instanceof BreakStatementNode) visit((BreakStatementNode) node);
        if (node instanceof ContinueStatementNode) visit((ContinueStatementNode)node);
        // if (node instanceof EmptyStatementNode) visit((EmptyStatementNode)node);
    }

    public void visit(ThisNode node) {}

    public void visit(TypeNode node) {}

    public void visit(UnaryExpressionNode node) {
        visit(node.inner);
    }

    public void visit(VariableNode node) {}

    public void visit(WhileStatementNode node) throws SemanticException {
        visit(node.condition);
        visit(node.block);
    }
}