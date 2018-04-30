package AstNode;

public class MemberAccessExpressionNode extends ExpressionStatementNode {
    
    public ExpressionStatementNode caller;
    public ExpressionStatementNode member;

    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        member.printInformation(tab + 1);
    }
}
