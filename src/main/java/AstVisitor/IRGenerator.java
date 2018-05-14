package AstVisitor;

import AstNode.*;
import ErrorHandler.*;
import IRCode.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    LinkedList<IRCode> irCodeList;

    public IRGenerator() {
        irCodeList = new LinkedList<IRCode>();
    }

    public LinkedList<IRCode> generateIR(ProgramNode prog) throws Exception {
        visit(prog);
        return irCodeList;
    }

    @Override
    void visit(ProgramNode node) throws Exception {
        for (DefinitionExpressionNode item : node.variableDefinitionList) visit(item);
        for (ClassDefinitionNode item : node.classDefinitionList) visit(item);
        for (MethodDefinitionNode item : node.methodDefinitionList) visit(item);
    }

    @Override
    void visit(ClassDefinitionNode node) throws Exception {
        for (MethodDefinitionNode item : node.memberConstructionMethodList) visit(item);
        for (MethodDefinitionNode item : node.memberMethodList) visit(item);
    }

    @Override
    void visit(MethodDefinitionNode node) throws Exception {
        super.visit(node);
        if (node.parent instanceof ClassDefinitionNode) {
            ClassTypeNode classTypeNode =
                new ClassTypeNode(((ClassDefinitionNode) node.parent).className);
            classTypeNode.referenceClass = (ClassDefinitionNode) node.parent;
            node.scope.define("this", new Register());
        }
        // ATTENTION: no return
    }

    ///////////////////// expression //////////////////////////////

    @Override
    void visit(ReferenceNode node) throws Exception {
        if (node.definitionNode.parent instanceof ClassDefinitionNode) {
            node.reg = new Register();
            MemberAcess ir = new MemberAcess();
            Register thisReg = node.scope.getReg("this");
            ir.lhs = node.reg;
            ir.callerReg = thisReg;
            ClassDefinitionNode classNode =
                (ClassDefinitionNode) node.definitionNode.parent;
            ir.memberVar =
                (DefinitionExpressionNode) classNode.scope.get(node.referenceName);
            irCodeList.addLast(ir);
        }
        else node.reg = node.scope.getReg(node.referenceName);
    }

    @Override
    void visit(ConstantNode node) {
        node.reg = new Register();
        node.reg.initValue = node;
    }

    @Override
    void visit(ThisNode node) throws Exception {
        node.reg = node.scope.getReg("this");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        Register var = new Register();
        node.scope.define(node.variableName, var);
        if (node.parent instanceof ProgramNode) var.global = true;
        if (node.initValue != null) {
            visit(node.initValue);
            Calculate ir = new Calculate();
            ir.type = Calculate.Type.ASSIGN;
            ir.lhs = var;
            ir.rhs0 = node.initValue.reg;
            irCodeList.addLast(ir);
        }
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        if (node.member instanceof MethodCallExpressionNode) {
            visit(node.member);
            ReferenceNode memberCaller =
                (ReferenceNode) ((MethodCallExpressionNode) node.member).caller;
            MethodCall ir = (MethodCall) irCodeList.getLast();
            node.reg = new Register();
            ir.lhs = node.reg;
            // ATTENTION: void
            ir.callerReg = node.caller.reg;
            ir.method = (MethodDefinitionNode) memberCaller.definitionNode;
            irCodeList.addLast(ir);
        } else if (node.member instanceof ReferenceNode) {
            ReferenceNode member = (ReferenceNode) node.member;
            MemberAcess ir = new MemberAcess();
            node.reg = new Register();
            ir.lhs = node.reg;
            ir.callerReg = node.caller.reg;
            ir.memberVar = (DefinitionExpressionNode) member.definitionNode;
            irCodeList.addLast(ir);
        } else throw new Exception("member error");
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
        super.visit(node);
        node.reg = new Register();
        IndexAcess ir = new IndexAcess();
        ir.lhs = node.reg;
        ir.callerReg = node.caller.reg;
        ir.indexReg = node.index.reg;
        irCodeList.addLast(ir);
    }

    @Override
    void visit(MethodCallExpressionNode node) throws Exception {
        super.visit(node);
        node.reg = new Register();
        MethodCall ir = new MethodCall();
        ir.lhs = node.reg;
        ir.method = node.scope.getMethod(node.caller.referenceName);
        for (ExpressionStatementNode item : node.actualParameterList)
            ir.actualParaRegList.addLast(item.reg);
        irCodeList.addLast(ir);
    }

    @Override
    void visit(NewExpressionNode node) {
        node.reg = new Register();
        Allocate ir = new Allocate();
        ir.lhs = node.reg;
        ir.variableType = node.variableType;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        switch (node.op) {
            case PREFIX_INC: case PREFIX_DEC: node.reg = node.inner.reg; break;
            default: node.reg = new Register(); break;
        }
        Calculate ir = new Calculate();
        ir.lhs = node.reg;
        ir.rhs0 = node.inner.reg;
        switch (node.op) {
            case NOT: ir.type = Calculate.Type.NOT; break;
            case LNOT: ir.type = Calculate.Type.LNOT; break;
            case NEGATE: ir.type = Calculate.Type.NEGATE; break;
            case PREFIX_DEC: case POSTFIX_DEC: ir.type = Calculate.Type.DEC; break;
            case PREFIX_INC: case POSTFIX_INC: ir.type = Calculate.Type.INC; break;
        }
    }

    @Override
    void visit(BinaryExpressionNode node) throws Exception {
        super.visit(node);
        switch (node.op) {
            case ASSIGN: node.reg = node.lhs.reg; break;
            default: node.reg = new Register(); break;
        }
        Calculate ir = new Calculate();
        ir.lhs = node.reg;
        ir.rhs0 = node.lhs.reg;
        ir.rhs1 = node.rhs.reg; // ATTENTION: assign
        switch (node.op) {
            case LSHIFT: ir.type = Calculate.Type.LSHIF; break;
            case RSHIFT: ir.type = Calculate.Type.RSHIF; break;
            case MUL: ir.type = Calculate.Type.MUL; break;
            case DIV: ir.type = Calculate.Type.DIV; break;
            case MOD: ir.type = Calculate.Type.MOD; break;
            case ADD: ir.type = Calculate.Type.ADD; break;
            case SUB: ir.type = Calculate.Type.SUB; break;
            case XOR: ir.type = Calculate.Type.XOR; break;
            case AND: ir.type = Calculate.Type.AND; break;
            case OR: ir.type = Calculate.Type.OR; break;
            case LT: ir.type = Calculate.Type.LT; break;
            case GT: ir.type = Calculate.Type.GT; break;
            case LE: ir.type = Calculate.Type.LE; break;
            case GE: ir.type = Calculate.Type.GE; break;
            case LOR: ir.type = Calculate.Type.LOR; break;
            case LAND: ir.type = Calculate.Type.LAND; break;
            case EQUAL: ir.type = Calculate.Type.EQUAL; break;
            case NOTEQUAL: ir.type = Calculate.Type.NOTEQUAL; break;
            case ASSIGN: ir.type = Calculate.Type.ASSIGN; break;
        }
    }

    ////////////////////////////// control flow /////////////////////////////

    @Override
    void visit(IfStatementNode node) {

    }

    @Override
    void visit(ForStatementNode node) {

    }

    @Override
    void visit(WhileStatementNode node) {


    }

    @Override
    void visit(ReturnStatementNode node) {
        Return ir = new Return();
        if (node.returnValue != null)
            ir.returnValue = node.returnValue.reg;
    }

    @Override
    void visit(BreakStatementNode node) {

    }

    @Override
    void visit(ContinueStatementNode node) {

    }
}
