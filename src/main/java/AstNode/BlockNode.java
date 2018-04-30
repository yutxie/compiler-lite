package AstNode;

import java.util.LinkedList;
import java.util.List;

public class BlockNode extends AstNode {

    public List<StatementNode> statementList;
    
    public BlockNode() {
        statementList = new LinkedList<StatementNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (StatementNode item : statementList)
            item.printInformation(tab + 1);
    }
}
