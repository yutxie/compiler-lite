import AstNode.*;
import AstBuilder.*;;
import AstVisitor.*;
import Scope.*;

public class Main {

    public static void main(String args[]) throws Exception {

        String path = "code/6.txt";
        AstBuilder astBuilder = new AstBuilder();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();

        ProgramNode prog = astBuilder.buildAst(path);
        ToplevelScope toplevelScope = scopeTreeBuilder.buildScopeTree(prog);
        typeDefinitionChecker.checkTypeDefinition(prog);

        prog.printInformation(0);
//        toplevelScope.printInformation(0);
    }
}