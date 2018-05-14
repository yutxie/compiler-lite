package AstNode;

public class WhileStatementNode extends LoopStatementNode {
    
    public ExpressionStatementNode condition;
    public BlockNode block;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        condition.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
