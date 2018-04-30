package AstNode;

import java.util.LinkedList;
import java.util.List;

public class BlockNode extends AstNode {

    public List<AstNode> childList;
    
    public BlockNode() {
        childList = new LinkedList<AstNode>();
    }
    
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (AstNode item : childList) {
            if (item instanceof StatementNode) ((StatementNode)item).printInformation(tab + 1);
            else ((BlockNode)item).printInformation(tab + 1);
        }
    }
}
