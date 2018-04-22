import AstNode.*;
import AstBuilder.AstBuilder;;
import AstVisitor.*;
import Symbol.*;
import Tool.*;

import java.io.IOException;

public class Main {

    public static void main(String args[]) throws IOException {
        String path = "code/694.txt";
         AstNode ast = AstBuilder.buildAst(path);
         ast.printInformation(0);
    }
}