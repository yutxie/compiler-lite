import AstNode.*;
import AstBuilder.*;
import BackEnd.*;
import FrontEnd.*;
import IR.*;

public class Main {

    public static void main(String args[]) throws Exception {

        String path = "code/program.txt";
//        String path = "code/0.txt";

        AstBuilder astBuilder = new AstBuilder();
        ParentLinker parentLinker = new ParentLinker();
        ScopeTreeBuilder scopeTreeBuilder = new ScopeTreeBuilder();
        TypeDefinitionChecker typeDefinitionChecker = new TypeDefinitionChecker();
        StaticTypeChecker staticTypeChecker = new StaticTypeChecker();
        ClassTypeResolver classTypeResolver = new ClassTypeResolver();
        ThisAppender thisAppender = new ThisAppender();
        IRGenerator irGenerator = new IRGenerator();
        CFGGenerator cfgGenerator = new CFGGenerator();
        MultiIndexAndMemberRewriter multiIndexAndMemberRewriter = new MultiIndexAndMemberRewriter();
        LocalValueNumberer localValueNumberer = new LocalValueNumberer();
        DefineAndUseCalculator defineAndUseCalculator = new DefineAndUseCalculator();
        AllVariableCalculator allVariableCalculator = new AllVariableCalculator();
        RegisterConfig registerConfig = new RegisterConfig();
        RegisterAllocator regisgerAllocator = new RegisterAllocator();
        CodeGenerator codeGenerator = new CodeGenerator();

        ////////////////////// front end ////////////////////////////
        ProgramNode ast = astBuilder.buildAst(path);
//        ast.printInformation(0);
        parentLinker.linkParent(ast);
        Scope toplevelScope = scopeTreeBuilder.buildScopeTree(ast);
        typeDefinitionChecker.checkTypeDefinition(ast);
        staticTypeChecker.checkStaticType(ast);
        classTypeResolver.resolveClassType(ast);
        thisAppender.appendThis(ast);
        IR ir = irGenerator.generateIR(ast);
//        ir.printInformation();

        ////////////////////// back end /////////////////////////////
        // non trivial
        cfgGenerator.generateCFG(ir);
        multiIndexAndMemberRewriter.rewriteMultiIndexandMember(ir);
        localValueNumberer.numberLocalValue(ir);
//        ir.printInformation();
        defineAndUseCalculator.calculateDefineAndUse(ir);
        allVariableCalculator.calculateAllVariable(ir);
        regisgerAllocator.allocateRegister(ir, registerConfig);
        codeGenerator.generateCode(ir);
    }
}