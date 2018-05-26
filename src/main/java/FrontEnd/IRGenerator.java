package FrontEnd;

import AstNode.*;
import IR.*;
import IR.IRCode.*;
import IR.IRCode.Variable.*;

import static AstNode.BinaryExpressionNode.BinaryOp.*;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    IR ir;
    HashMap<String, Integer> labelMap = new HashMap<String, Integer>();
    LinkedList<IRCode> codeList;

    int ifCnt = 0;
    int loopCnt = 0;

    public IR generateIR(ProgramNode prog) throws Exception {
        ir = new IR();
        visit(prog);
        return ir;
    }

    @Override
    void visit(ProgramNode node) throws Exception {
        codeList = ir.global.codeList;
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
        MethodEntity methodEntity = new MethodEntity();
        if (node.parent instanceof ClassDefinitionNode) {
            node.scope.define("this", new Variable("this"));
            String className = ((ClassDefinitionNode) node.parent).className;
            methodEntity.methodName = className + "_" + node.methodName;
        } else methodEntity.methodName = node.methodName;
        ir.methodList.addLast(methodEntity);
        codeList = methodEntity.codeList;
        labelMap.clear();
        labelMap.put("%" + methodEntity.methodName + "_entry", 0);

        super.visit(node);
        for (DefinitionExpressionNode para : node.formalArgumentList)
            methodEntity.formalParaVarList.addLast(para.var);
        codeList.addLast(new Return());
        int n = codeList.size();
        for (String key : labelMap.keySet())
            codeList.get(labelMap.get(key)).label = key;
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
        node.var = new Variable();
        node.var.initValue = node;
    }

    @Override
    void visit(ThisNode node) throws Exception {
        node.var = node.scope.getReg("this");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        node.var = new Variable(node.variableName);
        node.scope.define(node.variableName, node.var);
        if (node.parent instanceof ProgramNode) node.var.global = true;
        if (node.initValue != null) {
            visit(node.initValue);
            Move ins = new Move();
            ins.lhs = node.var;
            ins.rhs = node.initValue.var;
            if (node.parent instanceof ProgramNode)
                ir.global.codeList.addLast(ins);
            else codeList.add(ins);
        }
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        if (node.member instanceof MethodCallExpressionNode) {
            visit(node.member);
            ReferenceNode memberCaller =
                (ReferenceNode) ((MethodCallExpressionNode) node.member).caller;
            MethodCall ins = (MethodCall) codeList.get(codeList.size() - 1);
            node.var = new Variable();
            ins.lhs = node.var;
            ins.caller = node.caller.var;
            ins.method = (MethodDefinitionNode) memberCaller.definitionNode;
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
        MethodCall ins = new MethodCall();
        ins.lhs = node.var;
        ins.method = node.scope.getMethod(node.caller.referenceName);
        for (ExpressionStatementNode item : node.actualParameterList)
            ins.actualParaVarList.addLast(item.var);
        codeList.add(ins);
    }

    @Override
    void visit(NewExpressionNode node) {
        node.var = new Variable();
        Allocate ins = new Allocate();
        ins.lhs = node.var;
        ins.variableType = node.variableType;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        Unary cl = new Unary();
        Move mv = new Move();
        switch (node.op) {
            case NOT: case LNOT: case NEGATE:
                mv.lhs = node.var = new Variable();
                mv.rhs = node.inner.var;
                codeList.add(mv);

                cl.lhs = node.var;
                switch (node.op) {
                    case NOT: case LNOT: cl.type = Unary.Type.NOT; break;
                    case NEGATE: cl.type = Unary.Type.NEG; break;
                }
                codeList.add(cl);
                break;
            case PREFIX_DEC: case PREFIX_INC:
                cl.lhs = node.var = node.inner.var;
                if (node.op == UnaryExpressionNode.UnaryOp.PREFIX_DEC)
                    cl.type = Unary.Type.DEC;
                else cl.type = Unary.Type.INC;
                codeList.add(cl);
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                mv.lhs = node.var = new Variable();
                mv.rhs = node.inner.var;
                codeList.add(mv);

                cl.lhs = node.inner.var;
                if (node.op == UnaryExpressionNode.UnaryOp.POSTFIX_DEC)
                    cl.type = Unary.Type.DEC;
                else cl.type = Unary.Type.INC;
                codeList.add(cl);
                break;
        }

    }

    @Override
    void visit(BinaryExpressionNode node) throws Exception {
        super.visit(node);
        if (node.op == ASSIGN) {
            Move ins = new Move();
            ins.lhs = node.var = node.lhs.var;
            ins.rhs = node.rhs.var;
            codeList.add(ins);
            return;
        }
        Move mv = new Move();
        mv.lhs = node.var = new Variable();
        mv.rhs = node.lhs.var;
        codeList.add(mv);
        Binary ins = new Binary();
        ins.lhs = node.var;
        ins.rhs = node.rhs.var;
        switch (node.op) {
            case LSHIFT: ins.type = Binary.Type.LSHIFT; break;
            case RSHIFT: ins.type = Binary.Type.RSHIFT; break;
            case MUL: ins.type = Binary.Type.MUL; break;
            case DIV: ins.type = Binary.Type.DIV; break;
            case MOD: ins.type = Binary.Type.MOD; break;
            case ADD: ins.type = Binary.Type.ADD; break;
            case SUB: ins.type = Binary.Type.SUB; break;
            case XOR: ins.type = Binary.Type.XOR; break;
            case AND: ins.type = Binary.Type.AND; break;
            case OR: ins.type = Binary.Type.OR; break;
            case LT: ins.type = Binary.Type.LT; break;
            case GT: ins.type = Binary.Type.GT; break;
            case LE: ins.type = Binary.Type.LE; break;
            case GE: ins.type = Binary.Type.GE; break;
            case LOR: ins.type = Binary.Type.OR; break;
            case LAND: ins.type = Binary.Type.AND; break;
            case EQUAL: ins.type = Binary.Type.EQUAL; break;
            case NOTEQUAL: ins.type = Binary.Type.NOTEQUAL; break;
        }
        codeList.add(ins);
    }

    ////////////////////////////// control flow /////////////////////////////

    @Override
    void visit(IfStatementNode node) throws Exception {
        int ifIndex = ifCnt++;

        Jump ins = new Jump();
        visit(node.condition);
        ins.condition = node.condition.var;
        ins.targetLabel = "#if_false_" + ifIndex;
        ins.type = Jump.Type.FALSE;
        codeList.add(ins);

        labelMap.put("#if_true_" + ifIndex, codeList.size());
        visit(node.ifBlock);

        if (node.elseBlock != null) {
            labelMap.put("#if_false_" + ifIndex, codeList.size());
            visit(node.elseBlock);
        }

        labelMap.put("#if_end_" + ifIndex, codeList.size());
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        visit(node.init);
        int loopIndex = loopCnt++;

        labelMap.put("#loop_cond_" + loopIndex, codeList.size());
        Jump ins = new Jump();
        visit(node.condition);
        ins.condition = node.condition.var;
        ins.targetLabel = "#loop_end_" + loopIndex;
        ins.type = Jump.Type.FALSE;
        codeList.add(ins);

        labelMap.put("#loop_body_" + loopIndex, codeList.size());
        visit(node.block);
        visit(node.afterBlock);
        ins = new Jump();
        ins.targetLabel = "#loop_cond_" + loopIndex;
        codeList.add(ins);

        labelMap.put("#loop_end_" + loopIndex, codeList.size());
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        int loopIndex = loopCnt++;

        labelMap.put("#loop_cond_" + loopIndex, codeList.size());
        Jump ins = new Jump();
        visit(node.condition);
        ins.condition = node.condition.var;
        ins.targetLabel = "#loop_end_" + loopIndex;
        ins.type = Jump.Type.FALSE;
        codeList.add(ins);

        labelMap.put("#loop_body_" + loopIndex, codeList.size());
        visit(node.block);
        ins = new Jump();
        ins.targetLabel = "#loop_cond_" + loopIndex;
        codeList.add(ins);

        labelMap.put("#loop_end_" + loopIndex, codeList.size());
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "#loop_end_" + loopIndex;
        codeList.add(ins);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "#loop_cond_" + loopIndex;
        codeList.add(ins);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        Return ins = new Return();
        if (node.returnValue != null) {
            visit(node.returnValue);
            ins.returnValue = node.returnValue.var;
        }
        codeList.add(ins);
    }
}