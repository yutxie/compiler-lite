package AstVisitor;

import AstNode.*;
import IRCode.*;
import IRCode.Register.*;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    LinkedList<IRCode> irCodeList;
    HashMap<String, Integer> labelMap;
    LinkedList<String> ifStack;
    LinkedList<String> loopEndStack;
    int ifCnt;
    int loopBeginCnt;
    int loopEndCnt;

    public IRGenerator() {
        irCodeList = new LinkedList<IRCode>();
        labelMap = new HashMap<String, Integer>();
        ifStack = new LinkedList<String>();
        loopEndStack = new LinkedList<String>();
        ifCnt = 0;
        loopBeginCnt = 0;
        loopEndCnt = 0;
    }

    public LinkedList<IRCode> generateIR(ProgramNode prog) throws Exception {
        visit(prog);
        return irCodeList;
    }

    public void printIRList() {
        int n = irCodeList.size();
        String[] label = new String[n + 1];
        for (String key : labelMap.keySet())
            label[labelMap.get(key)] = key;
        for (int i = 0; i < n; ++i) {
            if (label[i] != null) System.out.print(label[i] + ":\t");
            else System.out.print("\t\t");
            irCodeList.get(i).printInformation();
        }
        if (label[n] != null) System.out.println(label[n] + ":");
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
//        System.out.println(node.methodName + ": " + irCodeList.size());
        if (node.parent instanceof ClassDefinitionNode) {
            node.scope.define("this", new Register());
            String className = ((ClassDefinitionNode) node.parent).className;
            labelMap.put(className + "_" + node.methodName, irCodeList.size());
        } else labelMap.put(node.methodName, irCodeList.size());
        super.visit(node);
        Return ir = new Return();
        if (!node.returnType.isPrimitiveType(VOID))
            ir.returnValue = new Register();
        irCodeList.addLast(ir);
    }

    ///////////////////// expression //////////////////////////////

    @Override
    void visit(ReferenceNode node) throws Exception {
        if (node.referenceType != ReferenceNode.ReferenceType.VARIABLE) return;
        if (node.definitionNode.parent instanceof ClassDefinitionNode) {
            MemberRegister reg = new MemberRegister();
            reg.object = node.scope.getReg("this");
            ClassDefinitionNode classNode =
                (ClassDefinitionNode) node.definitionNode.parent;
            reg.memberVar =
                (DefinitionExpressionNode) classNode.scope.get(node.referenceName);
            node.reg = reg;
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
            ir.rhs0 = var;
            ir.rhs1 = node.initValue.reg;
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
        } else if (node.member instanceof ReferenceNode) {
            MemberRegister reg = new MemberRegister();
            reg.object = node.caller.reg;
            ReferenceNode member = (ReferenceNode) node.member;
            reg.memberVar = (DefinitionExpressionNode) member.definitionNode;
            node.reg = reg;
        } else throw new Exception("member error");
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
        super.visit(node);
        IndexRegister reg = new IndexRegister();
        reg.array = node.caller.reg;
        reg.index = node.index.reg;
        node.reg = reg;
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
        Calculate ir;
        switch (node.op) {
            case NOT: case LNOT: case NEGATE:
                ir = new Calculate();
                ir.lhs = node.reg = new Register();
                ir.rhs0 = node.inner.reg;
                switch (node.op) {
                    case NOT: ir.type = Calculate.Type.NOT; break;
                    case LNOT: ir.type = Calculate.Type.LNOT; break;
                    case NEGATE: ir.type = Calculate.Type.NEGATE; break;
                }
                irCodeList.addLast(ir);
                break;
            case PREFIX_DEC: case PREFIX_INC:
                ir = new Calculate();
                ir.lhs = node.reg = node.inner.reg;
                ir.rhs0 = node.inner.reg;
                if (node.op == UnaryExpressionNode.UnaryOp.PREFIX_DEC)
                    ir.type = Calculate.Type.DEC;
                else ir.type = Calculate.Type.INC;
                irCodeList.addLast(ir);
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                ir = new Calculate();
                ir.lhs = node.reg = new Register();
                ir.rhs0 = ir.lhs;
                ir.rhs1 = node.inner.reg;
                ir.type = Calculate.Type.ASSIGN;
                irCodeList.addLast(ir);

                ir = new Calculate();
                ir.lhs = node.inner.reg;
                ir.rhs0 = node.inner.reg;
                if (node.op == UnaryExpressionNode.UnaryOp.POSTFIX_DEC)
                    ir.type = Calculate.Type.DEC;
                else ir.type = Calculate.Type.INC;
                irCodeList.addLast(ir);
                break;
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
        irCodeList.addLast(ir);
    }

    ////////////////////////////// control flow /////////////////////////////

    @Override
    void visit(IfStatementNode node) throws Exception {
        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.reg;
        ir.targetLabel = "if_" + ++ifCnt;
        ifStack.addLast(ir.targetLabel);
        irCodeList.addLast(ir);
        visit(node.ifBlock);

        labelMap.put(ifStack.getLast(), irCodeList.size());
        ifStack.removeLast();
        if (node.elseBlock != null) visit(node.elseBlock);
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        visit(node.init);

        labelMap.put("loop_beg_" + ++loopBeginCnt, irCodeList.size());
        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.reg;
        ir.targetLabel = "loop_end_" + ++loopEndCnt;
        loopEndStack.addLast(ir.targetLabel);
        irCodeList.addLast(ir);

        visit(node.block);
        visit(node.afterBlock);

        labelMap.put(loopEndStack.getLast(), irCodeList.size());
        loopEndStack.removeLast();
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        labelMap.put("loop_beg_" + ++loopBeginCnt, irCodeList.size());
        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.reg;
        ir.targetLabel = "loop_end_" + ++loopEndCnt;
        loopEndStack.addLast(ir.targetLabel);
        irCodeList.addLast(ir);

        visit(node.block);

        labelMap.put(loopEndStack.getLast(), irCodeList.size());
        loopEndStack.removeLast();
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ir = new Jump();
        ir.targetLabel = loopEndStack.getLast();
        irCodeList.addLast(ir);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ir = new Jump();
        ir.targetLabel = "loop_beg_" + loopBeginCnt;
        irCodeList.addLast(ir);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        Return ir = new Return();
        if (node.returnValue != null) {
            visit(node.returnValue);
            ir.returnValue = node.returnValue.reg;
        }
        irCodeList.addLast(ir);
    }
}
