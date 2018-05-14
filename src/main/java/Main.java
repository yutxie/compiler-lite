import AstNode.*;
import AstBuilder.*;
import AstVisitor.*;
import Scope.*;

public class Main {

    public static void main(String args[]) throws Exception {

        String path = "code/astram.txt";
//        String path = "code/639.txt";
        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();

        ProgramNode ast = astBuilder.buildAst(path);
        parentLinker.linkParent(ast);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
        typeDefinitionChecker.checkTypeDefinition(ast);
        staticTypeChecker.checkStaticType(ast);
        classTypeResolver.resolveClassType(ast);
//        ast.printInformation(0);
    }
}