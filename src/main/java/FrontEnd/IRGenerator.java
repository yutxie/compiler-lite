package FrontEnd;

import AstNode.*;
import IR.*;
import IRCode.*;
import IRCode.Operand.*;
import IRCode.Set;

import static AstNode.BinaryExpressionNode.BinaryOp.*;
import static AstNode.UnaryExpressionNode.UnaryOp.*;

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
    void visit(ConstantNode node) throws Exception {
        if (node.exprType.getTypeName().equals("string")) {
//            node.value = new Variable();
//            Allocate ins = new Allocate();
//            ins.dst = node.value;
//            ins.variableType = node.exprType;
//            codeList.addLast(ins);
            throw new Exception();
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
            ins.dst = var;
            ins.src = node.initValue.value;
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
            ins.dst = node.value;
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
        ins.dst = node.value;
        ins.method = node.scope.getMethod(node.caller.referenceName);
        for (ExpressionStatementNode item : node.actualParameterList)
            ins.actualParaVarList.addLast(item.value);
        codeList.add(ins);
    }

    void rewriteNew(Operand res, TypeNode type) throws Exception {
        if (type instanceof ClassTypeNode) { // new class
            ClassDefinitionNode classDef = ((ClassTypeNode) type).referenceClass;
            if (classDef.memberConstructionMethodList.isEmpty()) {
                Allocate allocate = new Allocate();
                allocate.dst = res;
                allocate.size = new Immediate(classDef.memberVariableList.size());
                codeList.addLast(allocate);
            } else {
                // ATTENTION: call construction method
                throw new Exception();
            }
        } else if (type instanceof PrimitiveTypeNode) return;
        else if (type instanceof ArrayTypeNode) {
            ArrayTypeNode arrayType = (ArrayTypeNode) type;
            if (arrayType.size == null) return; // new int[]
            /*  res = new unit[size];
                i = 0;
                while (i < size)
                    res[i] = new unit;  */
            visit(arrayType.size);
            Operand size = arrayType.size.value;
            Allocate allocate = new Allocate();
            allocate.dst = res;
            allocate.size = size;
            codeList.addLast(allocate);
            Variable iter = new Variable();
            Move move = new Move();
            move.dst = iter;
            move.src = new Immediate(0);
            codeList.addLast(move);
            int loopIndex = loopCnt++;
            Jump jump = new Jump();
            jump.targetLabel = "loop_cond_" + loopIndex;
            jump.type = Jump.Type.JMP;
            codeList.addLast(jump);
            labelMap.put("loop_body_" + loopIndex, codeList.size());
            codeList.addLast(new Nop());
            IndexVariable indexAcess = new IndexVariable();
            indexAcess.array = res;
            indexAcess.index = iter;
            rewriteNew(indexAcess, arrayType.innerTypeNode);
            labelMap.put("loop_cond_" + loopIndex, codeList.size());
            Compare cmp = new Compare();
            cmp.src0 = iter;
            cmp.src1 = size;
            codeList.addLast(cmp);
            jump = new Jump();
            jump.targetLabel = "loop_body_" + loopIndex;
            jump.type = Jump.Type.JL;
            labelMap.put("loop_end_" + loopIndex, codeList.size());
            codeList.addLast(new Nop());
        } else throw new Exception();
    }

    @Override
    void visit(NewExpressionNode node) throws Exception {
        node.value = new Variable();
        rewriteNew(node.value, node.variableType);
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        Unary cl = new Unary();
        Move mv = new Move();
        switch (node.op) {
            case NOT: case LNOT: case NEGATE:
                mv.dst = node.value = new Variable();
                mv.src = node.inner.value;
                codeList.add(mv);

                cl.dst = node.value;
                switch (node.op) {
                    case NOT: case LNOT: cl.type = Unary.Type.NOT; break;
                    case NEGATE: cl.type = Unary.Type.NEG; break;
                }
                codeList.add(cl);
                break;
            case PREFIX_DEC: case PREFIX_INC:
                cl.dst = node.value = node.inner.value;
                if (node.op == UnaryExpressionNode.UnaryOp.PREFIX_DEC)
                    cl.type = Unary.Type.DEC;
                else cl.type = Unary.Type.INC;
                codeList.add(cl);
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                mv.dst = node.value = new Variable();
                mv.src = node.inner.value;
                codeList.add(mv);

                cl.dst = node.inner.value;
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
            ins.dst = node.value = node.lhs.value;
            ins.src = node.rhs.value;
            codeList.add(ins);
            return;
        }
        switch (node.op) {
            case LT: case GT: case LE: case GE: case EQUAL: case NOTEQUAL:
                throw new Exception();
//                Compare cmp = new Compare();
//                cmp.src0 = node.lhs.value;
//                cmp.src1 = node.rhs.value;
//                codeList.addLast(cmp);
//                Set set = new Set();
//                set.dst = node.value = new Variable();
//                switch (node.op) {
//                    case LT: set.type = Set.Type.SETL; break;
//                    case GT: set.type = Set.Type.SETG; break;
//                    case LE: set.type = Set.Type.SETLE; break;
//                    case GE: set.type = Set.Type.SETGE; break;
//                    case EQUAL: set.type = Set.Type.SETE; break;
//                    case NOTEQUAL: set.type = Set.Type.SETNE; break;
//                }
//                codeList.addLast(set);
//                return;
        }
        Move mv = new Move();
        mv.dst = node.value = new Variable();
        mv.src = node.lhs.value;
        codeList.add(mv);
        Binary ins = new Binary();
        ins.dst = node.value;
        ins.src = node.rhs.value;
        switch (node.op) {
//            case LSHIFT: ins.type = Binary.Type.LSHIFT; break;
//            case RSHIFT: ins.type = Binary.Type.RSHIFT; break;
//            case DIV: ins.type = Binary.Type.DIV; break;
//            case MOD: ins.type = Binary.Type.MOD; break;
            case ADD: ins.type = Binary.Type.ADD; break;
            case SUB: ins.type = Binary.Type.SUB; break;
            case MUL: ins.type = Binary.Type.IMUL; break;
            case XOR: ins.type = Binary.Type.XOR; break;
            case AND: ins.type = Binary.Type.AND; break;
            case OR: ins.type = Binary.Type.OR; break;
            case LOR: ins.type = Binary.Type.OR; break;
            case LAND: ins.type = Binary.Type.AND; break;
        }
        codeList.add(ins);
    }

    ////////////////////////////// control flow /////////////////////////////

    void conditionJump(ExpressionStatementNode node,
                       boolean when, String label) throws Exception {
        if (node instanceof BinaryExpressionNode) 
            conditionJump((BinaryExpressionNode)node, when, label);
        else if (node instanceof UnaryExpressionNode) 
            conditionJump((UnaryExpressionNode) node, when, label);
        else trivialConditionJump(node, when, label);
    }

    void trivialConditionJump(ExpressionStatementNode node,
                              boolean when, String label) throws Exception {
        visit(node);
        Compare cmp = new Compare();
        cmp.src0 = node.value;
        cmp.src1 = new Immediate(0);
        codeList.addLast(cmp);
        Jump jump = new Jump();
        jump.targetLabel = label;
        if (when) jump.type = Jump.Type.JNZ;
        else jump.type = Jump.Type.JZ;
        codeList.addLast(jump);
    }

    void conditionJump(BinaryExpressionNode node,
                       boolean when, String label) throws Exception {
        if (node.op == LAND && when == false) {
            conditionJump(node.lhs, when, label);
            conditionJump(node.rhs, when, label);
            return;
        }
        if (node.op == LOR && when == true) {
            conditionJump(node.lhs, when, label);
            conditionJump(node.rhs, when, label);
            return;
        }
        switch (node.op) {
            case EQUAL: case NOTEQUAL:
            case GE: case LE: case GT: case LT:
                visit(node.lhs);
                visit(node.rhs);
                Compare cmp = new Compare();
                cmp.src0 = node.lhs.value;
                cmp.src1 = node.rhs.value;
                codeList.addLast(cmp);
                Jump jump = new Jump();
                jump.targetLabel = label;
                switch (node.op) {
                    case LT:
                        if (when) jump.type = Jump.Type.JL;
                        else jump.type = Jump.Type.JGE;
                        break;
                    case GT:
                        if (when) jump.type = Jump.Type.JG;
                        else jump.type = Jump.Type.JLE;
                        break;
                    case LE:
                        if (when) jump.type = Jump.Type.JLE;
                        else jump.type = Jump.Type.JG;
                        break;
                    case GE:
                        if (when) jump.type = Jump.Type.JGE;
                        else jump.type = Jump.Type.JL;
                        break;
                    case EQUAL:
                        if (when) jump.type = Jump.Type.JE;
                        else jump.type = Jump.Type.JNE;
                        break;
                    case NOTEQUAL:
                        if (when) jump.type = Jump.Type.JNE;
                        else jump.type = Jump.Type.JE;
                        break;
                }
                codeList.addLast(jump);
                break;
            default: trivialConditionJump(node, when, label); break;
        }
    }

    void conditionJump(UnaryExpressionNode node,
                       boolean when, String label) throws Exception {
        switch (node.op) {
            case NEGATE: case LNOT: case NOT:
                visit(node.inner);
                Compare cmp = new Compare();
                cmp.src0 = node.inner.value;
                cmp.src1 = new Immediate(0);
                codeList.addLast(cmp);
                Jump jump = new Jump();
                jump.targetLabel = label;
                if (node.op == NEGATE) {
                    if (when) jump.type = Jump.Type.JNZ;
                    else jump.type = Jump.Type.JZ;
                } else {
                    if (when) jump.type = Jump.Type.JZ;
                    else jump.type = Jump.Type.JNZ;
                }
            default: trivialConditionJump(node, when, label); break;
        }
    }

    @Override
    void visit(IfStatementNode node) throws Exception {
        /*              ... conditional jump ...
                        ... if block ...
                        jmp if_end
            if_false:  nop
                        ... else block ...
            if_end:    nop
                        ...
        */
        int ifIndex = ifCnt++;

        conditionJump(node.condition, false, "if_false_" + ifIndex);

        visit(node.ifBlock);
        Jump jump = new Jump();
        jump.targetLabel = "if_end_" + ifIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("if_false_" + ifIndex, codeList.size());
        codeList.addLast(new Nop());
        if (node.elseBlock != null) visit(node.elseBlock);

        labelMap.put("if_end_" + ifIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        /*              ... init ...
                        jmp loop_cond
            loop_body: nop
                        ... block ...
                        ... after block ...
            loop_cond: ... conditional jump ...
            loop_end:  nop
                        ...
         */
        visit(node.init);
        int loopIndex = loopCnt++;

        Jump jump = new Jump();
        jump.targetLabel = "loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        visit(node.block);
        visit(node.afterBlock);

        labelMap.put("loop_cond_" + loopIndex, codeList.size());
        conditionJump(node.condition, true, "loop_body_" + loopIndex);

        labelMap.put("loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        /*              jmp loop_cond
            loop_body: nop
                        ... block ...
            loop_cond: ... conditional jump ...
            loop_end:  nop
                        ...
         */
        int loopIndex = loopCnt++;

        Jump jump = new Jump();
        jump.targetLabel = "loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        visit(node.block);

        labelMap.put("loop_cond_" + loopIndex, codeList.size());
        conditionJump(node.condition, true, "loop_body_" + loopIndex);

        labelMap.put("loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "loop_end_" + loopIndex;
        ins.type = Jump.Type.JMP;
        codeList.add(ins);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "loop_cond_" + loopIndex;
        ins.type = Jump.Type.JMP;
        codeList.add(ins);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        Return ins = new Return();
        if (node.returnValue != null) {
            visit(node.returnValue);
            ins.src = node.returnValue.value;
        }
        codeList.add(ins);
    }
}
