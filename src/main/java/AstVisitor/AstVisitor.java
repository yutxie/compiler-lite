package AstVisitor;

import AstNode.*;
import ErrorHandler.*;

public abstract class AstVisitor {

    void visit(AstNode node) throws Exception {
        if (node instanceof ProgramNode) visit((ProgramNode)node);
        else if (node instanceof ClassDefinitionNode) visit((ClassDefinitionNode)node);
        else if (node instanceof MethodDefinitionNode) visit((MethodDefinitionNode)node);
        else if (node instanceof BlockNode) visit((BlockNode)node);
        else if (node instanceof StatementNode) visit((StatementNode)node);
    }

    void visit(BinaryExpressionNode node) throws Exception {
        visit(node.lhs);
        visit(node.rhs);
    }

    void visit(BlockNode node) throws Exception {
        for (AstNode item : node.childList) visit(item);
    }

    void visit(BreakStatementNode node) throws SemanticException {}

    void visit(ClassDefinitionNode node) throws Exception {
        for (DefinitionExpressionNode item : node.memberVariableList) visit(item);
        for (MethodDefinitionNode item : node.memberMethodList) visit(item);
        for (MethodDefinitionNode item : node.memberConstructionMethodList) visit(item);
    }

    void visit(ConstantNode node) {}

    void visit(ContinueStatementNode node) throws SemanticException {}

    void visit(DefinitionExpressionNode node) throws Exception {
        visit(node.variableType);
        if (node.initValue != null) visit(node.initValue);
    }

    void visit(EmptyStatementNode node) {}

    void visit(ExpressionStatementNode node) throws Exception {
        if (node instanceof PrimaryExpressionNode) visit((PrimaryExpressionNode)node);
        else if (node instanceof DefinitionExpressionNode) visit((DefinitionExpressionNode)node);
        else if (node instanceof MemberAccessExpressionNode) visit((MemberAccessExpressionNode)node);
        else if (node instanceof IndexAccessExpressionNode) visit((IndexAccessExpressionNode)node);
        else if (node instanceof MethodCallExpressionNode) visit((MethodCallExpressionNode)node);
        else if (node instanceof NewExpressionNode) visit((NewExpressionNode)node);
        else if (node instanceof UnaryExpressionNode) visit((UnaryExpressionNode)node);
        else if (node instanceof BinaryExpressionNode) visit((BinaryExpressionNode)node);
        else if (node instanceof TypeNode) visit((TypeNode)node);
        if (node.exprType != null) visit((TypeNode) node.exprType);
    }

    void visit(ForStatementNode node) throws Exception {
        if (node.init != null) visit(node.init);
        if (node.condition != null) visit(node.condition);
        if (node.afterBlock != null) visit(node.afterBlock);
        visit(node.block);
    }

    void visit(IfStatementNode node) throws Exception {
        visit(node.condition);
        visit(node.ifBlock);
        if (node.elseBlock != null) visit(node.elseBlock);
    }

    void visit(IndexAccessExpressionNode node) throws Exception {
        visit(node.caller);
        visit(node.index);
    }

    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        visit(node.member);
    }

    void visit(MethodCallExpressionNode node) throws Exception {
        visit(node.caller);
        for (ExpressionStatementNode item : node.actualParameterList) visit(item);
    }

    void visit(MethodDefinitionNode node) throws Exception {
        visit(node.returnType);
        for (DefinitionExpressionNode item : node.formalArgumentList) visit(item);
        visit(node.block);
    }

    void visit(NewExpressionNode node) throws Exception {
        visit(node.variableType);
        for (ExpressionStatementNode item : node.actualParameterList) visit(item);
    }

    void visit(PrimaryExpressionNode node) throws Exception {
        if (node instanceof ReferenceNode) visit((ReferenceNode)node);
        if (node instanceof ConstantNode) visit((ConstantNode)node);
        if (node instanceof ThisNode) visit((ThisNode)node);
    }

    void visit(ProgramNode node) throws Exception {
        for (AstNode item : node.childrenList) {
            if (item instanceof ClassDefinitionNode) visit((ClassDefinitionNode)item);
            else if (item instanceof MethodDefinitionNode) visit((MethodDefinitionNode)item);
            else visit((DefinitionExpressionNode)item);
        }
    }

    void visit(ReferenceNode node) throws Exception {}

    void visit(ReturnStatementNode node) throws Exception {
        if (node.returnValue != null) visit(node.returnValue);
    }

    void visit(StatementNode node) throws Exception {
        if (node instanceof ExpressionStatementNode) visit((ExpressionStatementNode)node);
        else if (node instanceof IfStatementNode) visit((IfStatementNode)node);
        else if (node instanceof ForStatementNode) visit((ForStatementNode)node);
        else if (node instanceof WhileStatementNode) visit((WhileStatementNode)node);
        else if (node instanceof ReturnStatementNode) visit((ReturnStatementNode)node);
        else if (node instanceof BreakStatementNode) visit((BreakStatementNode) node);
        else if (node instanceof ContinueStatementNode) visit((ContinueStatementNode)node);
        else if (node instanceof EmptyStatementNode) visit((EmptyStatementNode)node);
    }

    void visit(ThisNode node) throws Exception {}

    void visit(UnaryExpressionNode node) throws Exception {
        visit(node.inner);
    }

    void visit(TypeNode node) throws Exception {
        if (node instanceof MethodTypeNode) visit((MethodTypeNode)node);
        else visit((VariableTypeNode)node);
    }

    void visit(MethodTypeNode node) {}

    void visit(VariableTypeNode node) throws Exception {
        if (node instanceof ArrayTypeNode) visit((ArrayTypeNode)node);
        else visit((NonArrayTypeNode)node);
    }

    void visit(ArrayTypeNode node) throws Exception {
        visit(node.innerTypeNode);
        if (node.size != null) visit(node.size);
    }

    void visit(NonArrayTypeNode node) throws SemanticException {
        if (node instanceof PrimitiveTypeNode) visit((PrimitiveTypeNode)node);
        else visit((ClassTypeNode)node);
    }

    void visit(PrimitiveTypeNode node) {}

    void visit(ClassTypeNode node) throws SemanticException {}

    void visit(WhileStatementNode node) throws Exception {
        visit(node.condition);
        visit(node.block);
    }
}