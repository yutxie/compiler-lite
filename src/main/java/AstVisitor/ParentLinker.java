package AstVisitor;

import AstNode.*;
import ErrorHandler.SemanticException;

import java.util.*;

public class ParentLinker extends AstVisitor {

    LinkedList<AstNode> stack;

    public ParentLinker() {
        stack = new LinkedList<AstNode>();
    }

    public void linkParent(ProgramNode prog) throws SemanticException {
        visit(prog);
    }

    @Override public void visit(ProgramNode node) throws SemanticException {
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ClassDefinitionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(MethodDefinitionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(BlockNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ReferenceNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ConstantNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ThisNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(DefinitionExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(MemberAccessExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(IndexAccessExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(MethodCallExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(NewExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(UnaryExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(BinaryExpressionNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(IfStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ForStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(WhileStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ReturnStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(BreakStatementNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ContinueStatementNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(EmptyStatementNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(MethodTypeNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(PrimitiveTypeNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ClassTypeNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override public void visit(ArrayTypeNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }
}
