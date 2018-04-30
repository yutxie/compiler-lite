package AstNode;

public class ReturnStatementNode extends StatementNode {

    public ExpressionStatementNode returnValue;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (returnValue != null)
        returnValue.printInformation(tab + 1);
    }
}
