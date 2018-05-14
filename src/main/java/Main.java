import AstNode.*;
import AstBuilder.*;
import AstVisitor.*;
import Scope.*;

public class Main {

    public static void main(String args[]) throws Exception {

        String path = "code/program.txt";
//        String path = "code/639.txt";
        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();

        ProgramNode prog = astBuilder.buildAst(path);
        parentLinker.linkParent(prog);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(prog);
        typeDefinitionChecker.checkTypeDefinition(prog);
        staticTypeChecker.checkStaticType(prog);
        classTypeResolver.resolveClassType(prog);
//        prog.printInformation(0);
    }
}