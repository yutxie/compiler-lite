import AstNode.*;
import AstBuilder.*;
import AstVisitor.*;
import IRCode.IRCode;
import IRVisitor.CFG.*;
import Scope.*;

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

        ArrayList<IRCode> irCodeList = irGenerator.generateIR(ast);
        LinkedList<String>[] label = irGenerator.label;
        irGenerator.printIRList();
        CFG cfg = cfgGenerator.generateCFG(irCodeList, label);
//        cfg.printInformation();
    }
}