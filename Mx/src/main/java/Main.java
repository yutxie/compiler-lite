import AstNode.*;
import AstBuilder.AstBuilder;;
import AstVisitor.*;
import Scope.*;
import Symbol.*;
import Tool.*;

import java.io.IOException;

public class Main {

    public static void main(String args[]) throws Exception {

        String path = "code/2.txt";
        AstBuilder astBuilder = new AstBuilder();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();

        ProgramNode ast = astBuilder.buildAst(path);
        ast.printInformation(0);
//        ToplevelScope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
//        toplevelScope.printInformation(0);
    }
}