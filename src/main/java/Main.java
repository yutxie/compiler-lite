import AstNode.*;
import AstBuilder.*;
import BackEnd.*;
import BackEnd.DefineAndUseCalculator;
import BackEnd.RegisterAllocator;
import BackEnd.RegisterConfig;
import FrontEnd.*;
import IR.*;

public class Main {

    public static void main(String args[]) throws Exception {

//        String path = "code/program.txt";
        String path = "code/2.txt";

        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();
        IRGenerator irGenerator = new IRGenerator();
        CFGGenerator cfgGenerator = new CFGGenerator();
        DefineAndUseCalculator defineAndUseCalculator = new DefineAndUseCalculator();
        AllVariableCalculator allVariableCalculator = new AllVariableCalculator();
        RegisterConfig registerConfig = new RegisterConfig();
        RegisterAllocator regisgerAllocator = new RegisterAllocator();
        TrivialRegisterAllocator trivialRegisterAllocator = new TrivialRegisterAllocator();

        ////////////////////// front end ////////////////////////////
        ProgramNode ast = astBuilder.buildAst(path);
        parentLinker.linkParent(ast);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
        typeDefinitionChecker.checkTypeDefinition(ast);
        staticTypeChecker.checkStaticType(ast);
        classTypeResolver.resolveClassType(ast);
        IR ir = irGenerator.generateIR(ast);
        ir.printInformation();

        ////////////////////// back end /////////////////////////////
        // non trivial
//        cfgGenerator.generateCFG(ir);
//        defineAndUseCalculator.calculateDefineAndUse(ir);
//        regisgerAllocator.allocateRegister(ir, registerConfig);
        // trivial
//        allVariableCalculator.calculateAllVariable(ir);
//        trivialRegisterAllocator.allocateRegister(ir, registerConfig);
//        ir.printInformation();
    }
}