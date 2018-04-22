package AstVisitor;

import AstNode.*;
import Symbol.*;
import ErrorHandler.*;

import java.util.*;

public class LocalResolver implements AstVisitor {

    public LinkedList<Scope> scopeStack;
    public ConstantTable constantTable;
    public ErrorHandler errorHandler;

    public LocalResolver(ErrorHandler h) {
        this.scopeStack = new LinkedList<Scope>();
        this.constantTable = new ConstantTable();
        this.errorHandler = h;
    }

    public void resolve(AstNode ast) throws SemanticException {
        ToplevelScope toplevelScope = new ToplevelScope();
        scopeStack.add(toplevelScope);

//        for (Entity def : ast.definitions())
    }

    @Override
    public void visit(BinaryExpressionNode node) {
        
    }

    @Override
    public void visit(BlockNode node) {

    }

    @Override
    public void visit(BreakStatementNode node) {

    }

    @Override
    public void visit(ClassDefinitionNode node) {

    }

    @Override
    public void visit(ConstantExpressionNode node) {

    }

    @Override
    public void visit(ContinueStatementNode node) {

    }

    @Override
    public void visit(DefinitionExpressionNode node) {

    }

    @Override
    public void visit(EmptyStatementNode node) {

    }

    @Override
    public void visit(ForStatementNode node) {

    }

    @Override
    public void visit(IdentifierExpressionNode node) {

    }

    @Override
    public void visit(IfStatementNode node) {

    }

    @Override
    public void visit(IndexAccessExpressionNode node) {

    }

    @Override
    public void visit(MemberAccessExpressionNode node) {

    }

    @Override
    public void visit(MethodCallExpressionNode node) {

    }

    @Override
    public void visit(MethodDefinitionNode node) {

    }

    @Override
    public void visit(NewExpressionNode node) {

    }

    @Override
    public void visit(ProgramNode node) {

    }

    @Override
    public void visit(ReturnStatementNode node) {

    }

    @Override
    public void visit(ThisExpressionNode node) {

    }

    @Override
    public void visit(UnaryExpressionNode node) {

    }

    @Override
    public void visit(WhileStatementNode node) {

    }
}