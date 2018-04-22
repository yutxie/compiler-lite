package AstNode;

import AstVisitor.AstVisitor;

public class BinaryExpressionNode extends ExpressionStatementNode {

    public enum BinaryOp {
        MUL, DIV, MOD, ADD, SUB,
        LSHIFT, RSHIFT,
        LE, GE, LT, GT,
        EQUAL, NOTEQUAL,
        AND, XOR, OR, LAND, LOR,
        ASSIGN
    }

    public BinaryOp op;
    public ExpressionStatementNode lhs;
    public ExpressionStatementNode rhs;

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        lhs.printInformation(tab + 1);
        rhs.printInformation(tab + 1);
    }
}
