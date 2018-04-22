package AstVisitor;

import AstNode.*;

public interface AstVisitor {
    public void visit(BinaryExpressionNode node);
    public void visit(BlockNode node);
    public void visit(BreakStatementNode node);
    public void visit(ClassDefinitionNode node);
    public void visit(ConstantExpressionNode node);
    public void visit(ContinueStatementNode node);
    public void visit(DefinitionExpressionNode node);
    public void visit(EmptyStatementNode node);
    public void visit(ForStatementNode node);
    public void visit(IdentifierExpressionNode node);
    public void visit(IfStatementNode node);
    public void visit(IndexAccessExpressionNode node);
    public void visit(MemberAccessExpressionNode node);
    public void visit(MethodCallExpressionNode node);
    public void visit(MethodDefinitionNode node);
    public void visit(NewExpressionNode node);
    public void visit(ProgramNode node);
    public void visit(ReturnStatementNode node);
    public void visit(ThisExpressionNode node);
    public void visit(UnaryExpressionNode node);
    public void visit(WhileStatementNode node);
}