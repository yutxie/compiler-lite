package AstNode;

import FrontEnd.Scope;
import static Tool.PrintTool.*;

public abstract class AstNode {

    public int line;
    public AstNode parent;
    public Scope scope;

    public void printInformation(int tab) {
        printDashAndStr(tab, this.getClass().getName());
    }
}

