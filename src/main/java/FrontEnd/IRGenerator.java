package FrontEnd;

import AstNode.*;
import IR.*;
import IR.IRCode.*;
import IR.IRCode.Operand.*;
import IR.IRCode.Set;

import static AstNode.BinaryExpressionNode.BinaryOp.*;

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
//        labelMap.put("%" + methodEntity.methodName + "_entry", 0);

        super.visit(node);
        for (DefinitionExpressionNode para : node.formalArgumentList)
            methodEntity.formalParaVarList.addLast((Variable) para.value);
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
            MemberVariable value = new MemberVariable();
            value.object = node.scope.getReg("this");
            ClassDefinitionNode classNode =
                (ClassDefinitionNode) node.definitionNode.parent;
            value.memberVar =
                (DefinitionExpressionNode) classNode.scope.get(node.referenceName);
            node.value = value;
        }
        else node.value = node.scope.getReg(node.referenceName);
    }

    @Override
    void visit(ConstantNode node) {
        if (node.exprType.getTypeName().equals("string")) {
            node.value = new Variable();
            Allocate ins = new Allocate();
            ins.lhs = node.value;
            ins.variableType = node.exprType;
            codeList.addLast(ins);
        } else node.value = new Immediate(node);
    }

    @Override
    void visit(ThisNode node) throws Exception {
        node.value = node.scope.getReg("this");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        Variable var = new Variable(node.variableName);
        node.scope.define(node.variableName, var);
        if (node.parent instanceof ProgramNode) var.global = true;
        if (node.initValue != null) {
            visit(node.initValue);
            Move ins = new Move();
            ins.lhs = var;
            ins.rhs = node.initValue.value;
            if (node.parent instanceof ProgramNode)
                ir.global.codeList.addLast(ins);
            else codeList.add(ins);
        }
        node.value = var;
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        if (node.member instanceof MethodCallExpressionNode) {
            visit(node.member);
            ReferenceNode memberCaller =
                (ReferenceNode) ((MethodCallExpressionNode) node.member).caller;
            MethodCall ins = (MethodCall) codeList.get(codeList.size() - 1);
            node.value = new Variable();
            ins.lhs = node.value;
            ins.caller = node.caller.value;
            ins.method = (MethodDefinitionNode) memberCaller.definitionNode;
        } else if (node.member instanceof ReferenceNode) {
            MemberVariable value = new MemberVariable();
            value.object = node.caller.value;
            ReferenceNode member = (ReferenceNode) node.member;
            value.memberVar = (DefinitionExpressionNode) member.definitionNode;
            node.value = value;
        } else throw new Exception("member error");
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
        super.visit(node);
        IndexVariable value = new IndexVariable();
        value.array = node.caller.value;
        value.index = node.index.value;
        node.value = value;
    }

    @Override
    void visit(MethodCallExpressionNode node) throws Exception {
        super.visit(node);
        node.value = new Variable();
        MethodCall ins = new MethodCall();
        ins.lhs = node.value;
        ins.method = node.scope.getMethod(node.caller.referenceName);
        for (ExpressionStatementNode item : node.actualParameterList)
            ins.actualParaVarList.addLast(item.value);
        codeList.add(ins);
    }

    @Override
    void visit(NewExpressionNode node) {
        node.value = new Variable();
        Allocate ins = new Allocate();
        ins.lhs = node.value;
        ins.variableType = node.variableType;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        Unary cl = new Unary();
        Move mv = new Move();
        switch (node.op) {
            case NOT: case LNOT: case NEGATE:
                mv.lhs = node.value = new Variable();
                mv.rhs = node.inner.value;
                codeList.add(mv);

                cl.lhs = node.value;
                switch (node.op) {
                    case NOT: case LNOT: cl.type = Unary.Type.NOT; break;
                    case NEGATE: cl.type = Unary.Type.NEG; break;
                }
                codeList.add(cl);
                break;
            case PREFIX_DEC: case PREFIX_INC:
                cl.lhs = node.value = node.inner.value;
                if (node.op == UnaryExpressionNode.UnaryOp.PREFIX_DEC)
                    cl.type = Unary.Type.DEC;
                else cl.type = Unary.Type.INC;
                codeList.add(cl);
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                mv.lhs = node.value = new Variable();
                mv.rhs = node.inner.value;
                codeList.add(mv);

                cl.lhs = node.inner.value;
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
            ins.lhs = node.value = node.lhs.value;
            ins.rhs = node.rhs.value;
            codeList.add(ins);
            return;
        }
        switch (node.op) {
            case LT: case GT: case LE: case GE: case EQUAL: case NOTEQUAL:
                Compare cmp = new Compare();
                cmp.rhs0 = node.lhs.value;
                cmp.rhs1 = node.rhs.value;
                codeList.addLast(cmp);
                Set set = new Set();
                set.lhs = node.value = new Variable();
                switch (node.op) {
                    case LT: set.type = Set.Type.SETL; break;
                    case GT: set.type = Set.Type.SETG; break;
                    case LE: set.type = Set.Type.SETLE; break;
                    case GE: set.type = Set.Type.SETGE; break;
                    case EQUAL: set.type = Set.Type.SETE; break;
                    case NOTEQUAL: set.type = Set.Type.SETNE; break;
                }
                codeList.addLast(set);
                return;
        }
        Move mv = new Move();
        mv.lhs = node.value = new Variable();
        mv.rhs = node.lhs.value;
        codeList.add(mv);
        Binary ins = new Binary();
        ins.lhs = node.value;
        ins.rhs = node.rhs.value;
        switch (node.op) {
//            case LSHIFT: ins.type = Binary.Type.LSHIFT; break;
//            case RSHIFT: ins.type = Binary.Type.RSHIFT; break;
//            case MUL: ins.type = Binary.Type.MUL; break;
//            case DIV: ins.type = Binary.Type.DIV; break;
//            case MOD: ins.type = Binary.Type.MOD; break;
            case ADD: ins.type = Binary.Type.ADD; break;
            case SUB: ins.type = Binary.Type.SUB; break;
            case XOR: ins.type = Binary.Type.XOR; break;
            case AND: ins.type = Binary.Type.AND; break;
            case OR: ins.type = Binary.Type.OR; break;
            case LOR: ins.type = Binary.Type.OR; break;
            case LAND: ins.type = Binary.Type.AND; break;
        }
        codeList.add(ins);
    }

    ////////////////////////////// control flow /////////////////////////////

    @Override
    void visit(IfStatementNode node) throws Exception {
        /*              ... condition ...
                        cmp cond, 0
                        jz  #if_false
                        ... if block ...
                        jmp #if_end
            #if_false:  nop
                        ... else block ...
            #if_end:    nop
                        ...
        */
        int ifIndex = ifCnt++;

        visit(node.condition);
        Compare cmp = new Compare();
        cmp.rhs0 = node.condition.value;
        cmp.rhs1 = new Immediate(0);
        codeList.addLast(cmp);
        Jump jump = new Jump();
        jump.targetLabel = "#if_false_" + ifIndex;
        jump.type = Jump.Type.JZ;
        codeList.addLast(jump);

        visit(node.ifBlock);
        jump = new Jump();
        jump.targetLabel = "#if_end_" + ifIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("#if_false_" + ifIndex, codeList.size());
        codeList.addLast(new Nop());
        if (node.elseBlock != null) visit(node.elseBlock);

        labelMap.put("#if_end_" + ifIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        /*              ... init ...
                        jmp #loop_cond
            #loop_body: nop
                        ... block ...
                        ... after block ...
            #loop_cond: ... condition ...
                        cmp cond, 0
                        jnz #loop_body
            #loop_end:  nop
                        ...
         */
        visit(node.init);
        int loopIndex = loopCnt++;

        Jump jump = new Jump();
        jump.targetLabel = "#loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("#loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        visit(node.block);
        visit(node.afterBlock);

        labelMap.put("#loop_cond_" + loopIndex, codeList.size());
        visit(node.condition);
        Compare cmp = new Compare();
        cmp.rhs0 = node.condition.value;
        cmp.rhs1 = new Immediate(0);
        codeList.addLast(cmp);
        jump = new Jump();
        jump.targetLabel = "#loop_body_" + loopIndex;
        jump.type = Jump.Type.JNZ;
        codeList.add(jump);

        labelMap.put("#loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        /*              jmp #loop_cond
            #loop_body: nop
                        ... block ...
            #loop_cond: ... condition ...
                        cmp cond, 0
                        jnz #loop_body
            #loop_end:  nop
                        ...
         */
        int loopIndex = loopCnt++;

        Jump jump = new Jump();
        jump.targetLabel = "#loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("#loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        visit(node.block);

        labelMap.put("#loop_cond_" + loopIndex, codeList.size());
        visit(node.condition);
        Compare cmp = new Compare();
        cmp.rhs0 = node.condition.value;
        cmp.rhs1 = new Immediate(0);
        codeList.addLast(cmp);
        jump = new Jump();
        jump.targetLabel = "#loop_body_" + loopIndex;
        jump.type = Jump.Type.JNZ;
        codeList.add(jump);

        labelMap.put("#loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "#loop_end_" + loopIndex;
        ins.type = Jump.Type.JMP;
        codeList.add(ins);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "#loop_cond_" + loopIndex;
        ins.type = Jump.Type.JMP;
        codeList.add(ins);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        Return ins = new Return();
        if (node.returnValue != null) {
            visit(node.returnValue);
            ins.returnValue = node.returnValue.value;
        }
        codeList.add(ins);
    }
}
