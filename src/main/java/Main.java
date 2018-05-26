import AstNode.*;
import AstBuilder.*;
import BackEnd.*;
import FrontEnd.*;
import IR.*;

import java.util.*;

public class Main {

    public static void main(String args[]) throws Exception {

//        String path = "code/program.txt";
        String path = "code/1.txt";
        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();
        IRGenerator irGenerator = new IRGenerator();
        CFGGenerator cfgGenerator = new CFGGenerator();

        ProgramNode ast = astBuilder.buildAst(path);
        parentLinker.linkParent(ast);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
        typeDefinitionChecker.checkTypeDefinition(ast);
        staticTypeChecker.checkStaticType(ast);
        classTypeResolver.resolveClassType(ast);
//        ast.printInformation(0);

        IR ir = irGenerator.generateIR(ast);
        cfgGenerator.generateCFG(ir);
        ir.printInformation();
    }
}