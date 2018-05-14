package AstNode;

public class ForStatementNode extends LoopStatementNode {

    public ExpressionStatementNode init;
    public ExpressionStatementNode condition;
    public ExpressionStatementNode afterBlock;
    public BlockNode block;
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (init != null) init.printInformation(tab + 1);
        if (condition != null) condition.printInformation(tab + 1);
        if (afterBlock != null) afterBlock.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
