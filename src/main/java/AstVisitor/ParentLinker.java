package AstVisitor;

import AstNode.*;
import ErrorHandler.SemanticException;

import java.util.*;

public class ParentLinker extends AstVisitor {

    LinkedList<AstNode> stack;

    public ParentLinker() {
        stack = new LinkedList<AstNode>();
    }

    public void linkParent(ProgramNode prog) throws Exception {
        visit(prog);
    }

    @Override void visit(ProgramNode node) throws Exception {
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ClassDefinitionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
        for (MethodDefinitionNode item : node.memberConstructionMethodList)
            if (!item.methodName.equals(node.className))
                throw new SemanticException(node.line,
                    "construction method name must be the same as class");
    }

    @Override void visit(MethodDefinitionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(BlockNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ReferenceNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ConstantNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ThisNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(DefinitionExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(MemberAccessExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(IndexAccessExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(MethodCallExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(NewExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(UnaryExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(BinaryExpressionNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(IfStatementNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ForStatementNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(WhileStatementNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ReturnStatementNode node) throws Exception {
        node.parent = stack.getLast();
        AstNode ancestor = node.parent;
        while (!(ancestor instanceof MethodDefinitionNode)) {
            if (ancestor instanceof ProgramNode)
                throw new SemanticException(node.line, "return must be in a method definition");
            ancestor = ancestor.parent;
        }
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(BreakStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        AstNode ancestor = node.parent;
        while (!(ancestor instanceof ForStatementNode) &&
               !(ancestor instanceof WhileStatementNode)) {
            if (ancestor instanceof ProgramNode)
                throw new SemanticException(node.line, "break must be in a loop");
            ancestor = ancestor.parent;
        }
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ContinueStatementNode node) throws SemanticException {
        node.parent = stack.getLast();
        AstNode ancestor = node.parent;
        while (!(ancestor instanceof ForStatementNode) &&
                !(ancestor instanceof WhileStatementNode)) {
            if (ancestor instanceof ProgramNode)
                throw new SemanticException(node.line, "continue must be in a loop");
            ancestor = ancestor.parent;
        }
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(EmptyStatementNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(MethodTypeNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(PrimitiveTypeNode node) {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ClassTypeNode node) throws SemanticException {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }

    @Override void visit(ArrayTypeNode node) throws Exception {
        node.parent = stack.getLast();
        stack.addLast(node);
        super.visit(node);
        stack.removeLast();
    }
}
