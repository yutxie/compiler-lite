package AstNode;

public class IndexAccessExpressionNode extends ExpressionStatementNode {

    public ExpressionStatementNode caller;
    public ExpressionStatementNode index;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        index.printInformation(tab + 1);
    }
}
