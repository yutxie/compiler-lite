package AstNode;

public class IfStatementNode extends StatementNode {

    public ExpressionStatementNode condition;
    public BlockNode ifBlock;
    public BlockNode elseBlock;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        condition.printInformation(tab + 1);
        ifBlock.printInformation(tab + 1);
        if (elseBlock != null) elseBlock.printInformation(tab + 1);
    }
}
