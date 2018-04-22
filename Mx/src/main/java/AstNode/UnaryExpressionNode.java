package AstNode;

public class UnaryExpressionNode extends ExpressionStatementNode {

    public enum UnaryOp {
        PREFIX_INC, PREFIX_DEC,
        NEGATE, NOT, LNOT,
        POSTFIX_INC, POSTFIX_DEC
    }

    public UnaryOp op;
    public ExpressionStatementNode inner;

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        inner.printInformation(tab + 1);
    }
}
