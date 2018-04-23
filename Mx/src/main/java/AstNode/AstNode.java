package AstNode;

import Scope.Scope;
import static Tool.PrintTool.*;

public abstract class AstNode {

    public Scope scope;

    public void printInformation(int tab) {
        printDashAndStr(tab, this.getClass().getName());
    }
}

