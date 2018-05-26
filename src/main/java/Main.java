import AstNode.*;
import AstBuilder.*;
import BackEnd.*;
import BackEnd.Reg.DefineAndUseCalculator;
import BackEnd.Reg.RegisterAllocator;
import BackEnd.Reg.RegisterConfig;
import FrontEnd.*;
import IR.*;

import java.util.*;

public class Main {

    public static void main(String args[]) throws Exception {

//        String path = "code/program.txt";
        String path = "code/3.txt";

        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();
        IRGenerator irGenerator = new IRGenerator();
        CFGGenerator cfgGenerator = new CFGGenerator();
        DefineAndUseCalculator defineAndUseCalculator = new DefineAndUseCalculator();
        RegisterConfig registerConfig = new RegisterConfig();
        RegisterAllocator regisgerAllocator = new RegisterAllocator();

        // front end
        ProgramNode ast = astBuilder.buildAst(path);
        parentLinker.linkParent(ast);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
        typeDefinitionChecker.checkTypeDefinition(ast);
        staticTypeChecker.checkStaticType(ast);
        classTypeResolver.resolveClassType(ast);
        IR ir = irGenerator.generateIR(ast);

        // back end
        cfgGenerator.generateCFG(ir);
        defineAndUseCalculator.calculateDefineAndUse(ir);
        regisgerAllocator.allocateRegister(ir, registerConfig);
    }
}