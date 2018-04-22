package AstNode;

import AstVisitor.*;
import Tool.*;

public abstract class AstNode {

    public void printInformation(int tab) {
        PrintTool.printDashAndStr(tab, this.getClass().getName());
    }
}

