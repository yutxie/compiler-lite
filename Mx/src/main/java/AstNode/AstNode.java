package AstNode;

import AstVisitor.*;
import Scope.Scope;
import Tool.*;

public abstract class AstNode {

    public Scope scope;

    public void printInformation(int tab) {
        PrintTool.printDashAndStr(tab, this.getClass().getName());
    }
}

