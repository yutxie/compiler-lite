package AstVisitor;

import AstNode.*;
import IRCode.*;
import IRCode.Variable.*;

import static AstNode.BinaryExpressionNode.BinaryOp.*;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    ArrayList<IRCode> irCodeList;
    HashMap<String, Integer> labelMap;
    public LinkedList<String>[] label;
    int ifCnt = 0;
    int loopCnt = 0;

    public IRGenerator() {
        irCodeList = new ArrayList<IRCode>();
        labelMap = new HashMap<String, Integer>();
    }

    public ArrayList<IRCode> generateIR(ProgramNode prog) throws Exception {
        visit(prog);
        int n = irCodeList.size();
        label = new LinkedList[n + 1];
        for (int i = 0; i <= n; ++i)
            label[i] = new LinkedList<String>();
        for (String key : labelMap.keySet())
            label[labelMap.get(key)].addLast(key);
        return irCodeList;
    }

    public void printIRList() throws Exception {
        int n = irCodeList.size();
        for (int i = 0; i < n; ++i) {
            for (String item : label[i])
                System.out.println(item + ":");
            System.out.print("\t\t\t\t");
            irCodeList.get(i).printInformation();
        }
        if (!label[n].isEmpty()) throw new Exception("end with empty label");
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
            node.scope.define("this", new Variable());
            String className = ((ClassDefinitionNode) node.parent).className;
            labelMap.put(className + "_" + node.methodName, irCodeList.size());
        } else labelMap.put(node.methodName, irCodeList.size());
        super.visit(node);
        Return ir = new Return();
        if (!node.returnType.isPrimitiveType(VOID))
            ir.returnValue = new Variable();
        irCodeList.add(ir);
    }

    ///////////////////// expression //////////////////////////////

    @Override
    void visit(ReferenceNode node) throws Exception {
        if (node.referenceType != ReferenceNode.ReferenceType.VARIABLE) return;
        if (node.definitionNode.parent instanceof ClassDefinitionNode) {
            MemberVariable var = new MemberVariable();
            var.object = node.scope.getReg("this");
            ClassDefinitionNode classNode =
                (ClassDefinitionNode) node.definitionNode.parent;
            var.memberVar =
                (DefinitionExpressionNode) classNode.scope.get(node.referenceName);
            node.var = var;
        }
        else node.var = node.scope.getReg(node.referenceName);
    }

    @Override
    void visit(ConstantNode node) {
        node.var = new Variable(node.constantStr + "(const)");
        node.var.initValue = node;
    }

    @Override
    void visit(ThisNode node) throws Exception {
        node.var = node.scope.getReg("this");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        Variable var = new Variable(node.variableName);
        node.scope.define(node.variableName, var);
        if (node.parent instanceof ProgramNode) var.global = true;
        if (node.initValue != null) {
            visit(node.initValue);
            Move ir = new Move();
            ir.lhs = var;
            ir.rhs = node.initValue.var;
            irCodeList.add(ir);
        }
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        if (node.member instanceof MethodCallExpressionNode) {
            visit(node.member);
            ReferenceNode memberCaller =
                (ReferenceNode) ((MethodCallExpressionNode) node.member).caller;
            MethodCall ir = (MethodCall) irCodeList.get(irCodeList.size() - 1);
            node.var = new Variable();
            ir.lhs = node.var;
            // ATTENTION: void
            ir.caller = node.caller.var;
            ir.method = (MethodDefinitionNode) memberCaller.definitionNode;
        } else if (node.member instanceof ReferenceNode) {
            MemberVariable var = new MemberVariable();
            var.object = node.caller.var;
            ReferenceNode member = (ReferenceNode) node.member;
            var.memberVar = (DefinitionExpressionNode) member.definitionNode;
            node.var = var;
        } else throw new Exception("member error");
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
        super.visit(node);
        IndexVariable var = new IndexVariable();
        var.array = node.caller.var;
        var.index = node.index.var;
        node.var = var;
    }

    @Override
    void visit(MethodCallExpressionNode node) throws Exception {
        super.visit(node);
        node.var = new Variable();
        MethodCall ir = new MethodCall();
        ir.lhs = node.var;
        ir.method = node.scope.getMethod(node.caller.referenceName);
        for (ExpressionStatementNode item : node.actualParameterList)
            ir.actualParaVarList.addLast(item.var);
        irCodeList.add(ir);
    }

    @Override
    void visit(NewExpressionNode node) {
        node.var = new Variable();
        Allocate ir = new Allocate();
        ir.lhs = node.var;
        ir.variableType = node.variableType;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        Calculate cl = new Calculate();
        switch (node.op) {
            case NOT: case LNOT: case NEGATE:
                cl.lhs = node.var = new Variable();
                cl.rhs = node.inner.var;
                switch (node.op) {
                    case NOT: case LNOT: cl.type = Calculate.Type.NOT; break;
                    case NEGATE: cl.type = Calculate.Type.NEG; break;
                }
                irCodeList.add(cl);
                break;
            case PREFIX_DEC: case PREFIX_INC:
                cl.lhs = node.var = node.inner.var;
                cl.rhs = node.inner.var;
                if (node.op == UnaryExpressionNode.UnaryOp.PREFIX_DEC)
                    cl.type = Calculate.Type.DEC;
                else cl.type = Calculate.Type.INC;
                irCodeList.add(cl);
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                Move mv = new Move();
                mv.lhs = node.var = new Variable();
                mv.rhs = node.inner.var;
                irCodeList.add(mv);

                cl.lhs = node.inner.var;
                cl.rhs = node.inner.var;
                if (node.op == UnaryExpressionNode.UnaryOp.POSTFIX_DEC)
                    cl.type = Calculate.Type.DEC;
                else cl.type = Calculate.Type.INC;
                irCodeList.add(cl);
                break;
        }

    }

    @Override
    void visit(BinaryExpressionNode node) throws Exception {
        super.visit(node);
        if (node.op == ASSIGN) {
            Move ir = new Move();
            ir.lhs = node.var = node.lhs.var;
            ir.rhs = node.rhs.var;
            irCodeList.add(ir);
            return;
        }
        Move mv = new Move();
        mv.lhs = node.var = new Variable();
        mv.rhs = node.lhs.var;
        irCodeList.add(mv);
        Calculate ir = new Calculate();
        ir.lhs = node.var;
        ir.rhs = node.rhs.var;
        switch (node.op) {
            case LSHIFT: ir.type = Calculate.Type.LSHIFT; break;
            case RSHIFT: ir.type = Calculate.Type.RSHIFT; break;
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
            case LOR: ir.type = Calculate.Type.OR; break;
            case LAND: ir.type = Calculate.Type.AND; break;
            case EQUAL: ir.type = Calculate.Type.EQUAL; break;
            case NOTEQUAL: ir.type = Calculate.Type.NOTEQUAL; break;
        }
        irCodeList.add(ir);
    }

    ////////////////////////////// control flow /////////////////////////////

    @Override
    void visit(IfStatementNode node) throws Exception {
        int ifIndex = ifCnt++;

        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.var;
        ir.targetLabel = "#if_false_" + ifIndex;
        ir.type = Jump.Type.FALSE;
        irCodeList.add(ir);

        labelMap.put("#if_true_" + ifIndex, irCodeList.size());
        visit(node.ifBlock);

        if (node.elseBlock != null) {
            labelMap.put("#if_false_" + ifIndex, irCodeList.size());
            visit(node.elseBlock);
        }

        labelMap.put("#if_end_" + ifIndex, irCodeList.size());
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        visit(node.init);
        int loopIndex = loopCnt++;

        labelMap.put("#loop_cond_" + loopIndex, irCodeList.size());
        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.var;
        ir.targetLabel = "#loop_end_" + loopIndex;
        ir.type = Jump.Type.FALSE;
        irCodeList.add(ir);

        labelMap.put("#loop_body_" + loopIndex, irCodeList.size());
        visit(node.block);
        visit(node.afterBlock);
        ir = new Jump();
        ir.targetLabel = "#loop_cond_" + loopIndex;
        irCodeList.add(ir);

        labelMap.put("#loop_end_" + loopIndex, irCodeList.size());
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        int loopIndex = loopCnt++;

        labelMap.put("#loop_cond_" + loopIndex, irCodeList.size());
        Jump ir = new Jump();
        visit(node.condition);
        ir.condition = node.condition.var;
        ir.targetLabel = "#loop_end_" + loopIndex;
        ir.type = Jump.Type.FALSE;
        irCodeList.add(ir);

        labelMap.put("#loop_body_" + loopIndex, irCodeList.size());
        visit(node.block);
        ir = new Jump();
        ir.targetLabel = "#loop_cond_" + loopIndex;
        irCodeList.add(ir);

        labelMap.put("#loop_end_" + loopIndex, irCodeList.size());
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ir = new Jump();
        int loopIndex = loopCnt - 1;
        ir.targetLabel = "#loop_end_" + loopIndex;
        irCodeList.add(ir);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ir = new Jump();
        int loopIndex = loopCnt - 1;
        ir.targetLabel = "#loop_cond_" + loopIndex;
        irCodeList.add(ir);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        Return ir = new Return();
        if (node.returnValue != null) {
            visit(node.returnValue);
            ir.returnValue = node.returnValue.var;
        }
        irCodeList.add(ir);
    }
}
