package FrontEnd;

import AstNode.*;
import IR.*;
import IRCode.*;
import IRCode.Operand.*;

import static AstNode.BinaryExpressionNode.BinaryOp.*;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    IR ir;
    HashMap<String, Integer> labelMap = new HashMap<String, Integer>();
    LinkedList<IRCode> codeList;
    LinkedList<Integer> loopStack = new LinkedList<Integer>();

    int ifCnt = 0;
    int loopCnt = 0;
    int shortCutCnt = 0;

    public IR generateIR(ProgramNode prog) throws Exception {
        ir = new IR();
        visit(prog);
        return ir;
    }

    @Override
    void visit(ProgramNode node) throws Exception {
        int iter = 0;
        for (DefinitionExpressionNode item : node.variableDefinitionList) {
            MethodDefinitionNode main = node.scope.getMethod("main");
            main.block.childList.add(iter++, item);
        }
        for (ClassDefinitionNode item : node.classDefinitionList) visit(item);
        for (MethodDefinitionNode item : node.methodDefinitionList) {
            if (!item.methodName.equals("main")) continue;
            visit(item);
        }
        for (MethodDefinitionNode item : node.methodDefinitionList) {
            if (item.methodName.equals("main")) continue;
            visit(item);
        }
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
            String className = ((ClassDefinitionNode) node.parent).className;
            methodEntity.methodName = className + "_" + node.methodName;
        } else methodEntity.methodName = node.methodName;
        ir.methodList.addLast(methodEntity);
        codeList = methodEntity.codeList;
        labelMap.clear();

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
            int id = ir.stringConstList.size();
            ir.stringConstList.addLast(node.constantStr);
            Address addr = new Address();
            addr.label = "str_const_" + id;
            node.value = addr;
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
        if (node.parent instanceof ProgramNode) {
            var.name = "_global_" + var.name;
            var.global = true;
            ir.globalVarList.addLast(var);
        }
        if (node.initValue != null) {
            visit(node.initValue);
            Move ins = new Move();
            ins.dst = var;
            ins.src = node.initValue.value;
            codeList.addLast(ins);
        }
        node.value = var;
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        if (node.member instanceof MethodCallExpressionNode) {
            ReferenceNode memberCaller =
                ((MethodCallExpressionNode) node.member).caller;
            if (memberCaller.referenceName.equals("_array_size")) {
                IndexVariable indexAcces = new IndexVariable();
                indexAcces.array = node.caller.value;
                indexAcces.index = new Immediate(-1);
                Move move = new Move();
                move.dst = node.value = new Variable();
                move.src = indexAcces;
                codeList.addLast(move);
                return;
            }
            visit(node.member);
            MethodCall ins = (MethodCall) codeList.get(codeList.size() - 1);
            node.value = new Variable();
            ins.dst = node.value;
            ins.caller = node.caller.value;
            ins.methodName = node.caller.exprType.getTypeName() + "_" + memberCaller.referenceName;
            ins.actualParaVarList.addFirst(node.caller.value);
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
        String methodName = node.caller.referenceName;
        MethodDefinitionNode methodDef = node.scope.getMethod(methodName);
        if (methodDef != null && methodDef.parent instanceof ClassDefinitionNode)
            methodName = ((ClassDefinitionNode) methodDef.parent).className + "_" + methodName;
        ins.methodName = methodName;
        for (ExpressionStatementNode item : node.actualParameterList)
            ins.actualParaVarList.addLast(item.value);
        codeList.add(ins);
    }

    void rewriteNew(Operand res, TypeNode type,
                    LinkedList<ExpressionStatementNode> paraList) throws Exception {
        if (type instanceof ClassTypeNode) { // new class
            ClassDefinitionNode classDef = ((ClassTypeNode) type).referenceClass;
            Allocate allocate = new Allocate();
            allocate.dst = res;
            allocate.size = new Immediate(classDef.memberVariableList.size());
            codeList.addLast(allocate);
            if (!classDef.memberConstructionMethodList.isEmpty()) {
                Variable t = new Variable();
                MethodCall call = new MethodCall();
                call.dst = t;
                call.caller = res;
                for (ExpressionStatementNode para : paraList) {
                    visit(para);
                    call.actualParaVarList.addLast(para.value);
                }
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
            IndexVariable indexAcess = new IndexVariable();
            indexAcess.array = res;
            indexAcess.index = iter;
            rewriteNew(indexAcess, arrayType.innerTypeNode, null);
            Unary inc = new Unary();
            inc.dst = iter;
            inc.type = Unary.Type.INC;
            codeList.addLast(inc);
            labelMap.put("loop_cond_" + loopIndex, codeList.size());
            Compare cmp = new Compare();
            cmp.src0 = iter;
            cmp.src1 = size;
            codeList.addLast(cmp);
            jump = new Jump();
            jump.targetLabel = "loop_body_" + loopIndex;
            jump.type = Jump.Type.JL;
            codeList.addLast(jump);
            labelMap.put("loop_end_" + loopIndex, codeList.size());
            codeList.addLast(new Nop());
        } else throw new Exception();
    }

    @Override
    void visit(NewExpressionNode node) throws Exception {
        node.value = new Variable();
        rewriteNew(node.value, node.variableType, node.actualParameterList);
    }

    void logicCalculate(ExpressionStatementNode node) throws Exception {
        int shortCutIndex = shortCutCnt++;
        conditionJump(node, "short_true_" + shortCutIndex,
                "short_false_" + shortCutIndex);
        node.value = new Variable();
        labelMap.put("short_true_" + shortCutIndex, codeList.size());
        Move move = new Move();
        move.dst = node.value;
        move.src = new Immediate(1);
        codeList.addLast(move);
        Jump jump = new Jump();
        jump.targetLabel = "short_end_" + shortCutIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);
        labelMap.put("short_false_" + shortCutIndex, codeList.size());
        move = new Move();
        move.dst = node.value;
        move.src = new Immediate(0);
        codeList.addLast(move);
        labelMap.put("short_end_" + shortCutIndex, codeList.size());
        codeList.addLast(new Nop());
        return;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        if (node.exprType.isPrimitiveType(BOOL)) {
            logicCalculate(node);
            return;
        }
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
        if (node.exprType.isPrimitiveType(BOOL) &&
            node.op != ASSIGN &&
            !node.lhs.exprType.getTypeName().equals("string")) {
            logicCalculate(node);
            return;
        }
        super.visit(node);
        if (node.lhs.exprType.getTypeName().equals("string")
            && node.op != ASSIGN) { // addString__
            MethodCall call = new MethodCall();
            call.dst = node.value = new Variable();
            switch (node.op) {
                case ADD: call.methodName = "addString__"; break;
                case EQUAL: call.methodName = "string_eq"; break;
                case LT: call.methodName = "string_s"; break;
                case GT: call.methodName = "string_g"; break;
                case LE: call.methodName = "string_le"; break;
                case GE: call.methodName = "string_ge"; break;
                default: throw new Exception();
            }
            call.actualParaVarList.addLast(node.lhs.value);
            call.actualParaVarList.addLast(node.rhs.value);
            codeList.addLast(call);
            return;
        }
        Move move;
        switch (node.op) {
            case ASSIGN:
                move = new Move();
                move.dst = node.value = node.lhs.value;
                move.src = node.rhs.value;
                codeList.add(move);
                return;
            case LT: case GT: case LE: case GE: case EQUAL: case NOTEQUAL:
//                throw new Exception();
                Compare cmp = new Compare();
                cmp.src0 = node.lhs.value;
                cmp.src1 = node.rhs.value;
                codeList.addLast(cmp);
                node.value = new Variable();
                move = new Move();
                move.dst = node.value;
                move.src = new Immediate(0);
                codeList.addLast(move);
                Variable tmp = new Variable();
                move.dst = tmp;
                move.src = new Immediate(1);
                codeList.addLast(move);
                Cmove cmove = new Cmove();
                cmove.dst = node.value;
                cmove.src = tmp;
                switch (node.op) {
                    case LT: cmove.type = Cmove.Type.CMOVL; break;
                    case GT: cmove.type = Cmove.Type.CMOVG; break;
                    case LE: cmove.type = Cmove.Type.CMOVLE; break;
                    case GE: cmove.type = Cmove.Type.CMOVGE; break;
                    case EQUAL: cmove.type = Cmove.Type.CMOVE; break;
                    case NOTEQUAL: cmove.type = Cmove.Type.CMOVNE; break;
                }
                codeList.addLast(cmove);
                return;
            case DIV: case MOD:
                Idiv idiv = new Idiv();
                idiv.dst = node.value = new Variable();
                idiv.src0 = node.lhs.value;
                idiv.src1 = node.rhs.value;
                if (node.op == DIV) idiv.type = Idiv.Type.IDIV;
                else idiv.type = Idiv.Type.IMOD;
                codeList.addLast(idiv);
                return;
            default:
                move = new Move();
                move.dst = node.value = new Variable();
                move.src = node.lhs.value;
                codeList.add(move);
                Binary bin = new Binary();
                bin.dst = node.value;
                bin.src = node.rhs.value;
                switch (node.op) {
                case LSHIFT: bin.type = Binary.Type.SAL; break;
                case RSHIFT: bin.type = Binary.Type.SAR; break;
                    case ADD: bin.type = Binary.Type.ADD; break;
                    case SUB: bin.type = Binary.Type.SUB; break;
                    case MUL: bin.type = Binary.Type.IMUL; break;
                    case XOR: bin.type = Binary.Type.XOR; break;
                    case AND: bin.type = Binary.Type.AND; break;
                    case OR: bin.type = Binary.Type.OR; break;
                    case LOR: bin.type = Binary.Type.OR; break;
                    case LAND: bin.type = Binary.Type.AND; break;
                    default: throw new Exception();
                }
                codeList.add(bin);
                return;
        }
    }

    ////////////////////////////// control flow /////////////////////////////

    void conditionJump(ExpressionStatementNode node,
                       String trueLabel, String falseLabel) throws Exception {
        if (node == null) {
            Jump jump = new Jump();
            jump.targetLabel = trueLabel;
            jump.type = Jump.Type.JMP;
            codeList.addLast(jump);
            return;
        }
        if (node instanceof BinaryExpressionNode) 
            conditionJump((BinaryExpressionNode)node, trueLabel, falseLabel);
        else if (node instanceof UnaryExpressionNode) 
            conditionJump((UnaryExpressionNode) node, trueLabel, falseLabel);
        else trivialConditionJump(node, trueLabel, falseLabel);
    }

    void trivialConditionJump(ExpressionStatementNode node,
                              String trueLabel, String falseLabel) throws Exception {
        visit(node);
        Compare cmp = new Compare();
        cmp.src0 = node.value;
        cmp.src1 = new Immediate(0);
        codeList.addLast(cmp);
        Jump jump;
        if (trueLabel != null) {
            jump = new Jump();
            jump.targetLabel = trueLabel;
            jump.type = Jump.Type.JNZ;
            codeList.addLast(jump);
        }
        if (falseLabel != null) {
            jump = new Jump();
            jump.targetLabel = falseLabel;
            jump.type = Jump.Type.JZ;
            codeList.addLast(jump);
        }
    }

    void conditionJump(BinaryExpressionNode node,
                       String trueLabel, String falseLabel) throws Exception {
        if (node.lhs.exprType.getTypeName().equals("string")) {
            trivialConditionJump(node, trueLabel, falseLabel);
            return;
        }
        if (node.op == LAND) {
            conditionJump(node.lhs, null, falseLabel);
            conditionJump(node.rhs, trueLabel, falseLabel);
            return;
        }
        if (node.op == LOR) {
            conditionJump(node.lhs, trueLabel, null);
            conditionJump(node.rhs, trueLabel, falseLabel);
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
                Jump jump;
                if (trueLabel != null) {
                    jump = new Jump();
                    jump.targetLabel = trueLabel;
                    switch (node.op) {
                        case LT: jump.type = Jump.Type.JL; break;
                        case GT: jump.type = Jump.Type.JG; break;
                        case LE: jump.type = Jump.Type.JLE; break;
                        case GE: jump.type = Jump.Type.JGE; break;
                        case EQUAL: jump.type = Jump.Type.JE; break;
                        case NOTEQUAL: jump.type = Jump.Type.JNE; break;
                    }
                    codeList.addLast(jump);
                }
                if (falseLabel != null) {
                    jump = new Jump();
                    jump.targetLabel = falseLabel;
                    switch (node.op) {
                        case LT: jump.type = Jump.Type.JGE; break;
                        case GT: jump.type = Jump.Type.JLE; break;
                        case LE: jump.type = Jump.Type.JG; break;
                        case GE: jump.type = Jump.Type.JL; break;
                        case EQUAL: jump.type = Jump.Type.JNE; break;
                        case NOTEQUAL: jump.type = Jump.Type.JE; break;
                    }
                    codeList.addLast(jump);
                }
                break;
            default: trivialConditionJump(node, trueLabel, falseLabel); break;
        }
    }

    void conditionJump(UnaryExpressionNode node,
                       String trueLabel, String falseLabel) throws Exception {
        switch (node.op) {
            case LNOT: case NOT:
                conditionJump(node.inner, falseLabel, trueLabel); break;
            default: trivialConditionJump(node, trueLabel, falseLabel); break;
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

        conditionJump(node.condition, "if_true_" + ifIndex, "if_false_" + ifIndex);

        labelMap.put("if_true_" + ifIndex, codeList.size());
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
        loopStack.addLast(loopIndex);

        Jump jump = new Jump();
        jump.targetLabel = "loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        if (node.block != null) visit(node.block);
        if (node.afterBlock != null) visit(node.afterBlock);

        labelMap.put("loop_cond_" + loopIndex, codeList.size());
        conditionJump(node.condition, "loop_body_" + loopIndex, "loop_end_" + loopIndex);

        labelMap.put("loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        loopStack.removeLast();
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
        loopStack.addLast(loopIndex);

        Jump jump = new Jump();
        jump.targetLabel = "loop_cond_" + loopIndex;
        jump.type = Jump.Type.JMP;
        codeList.addLast(jump);

        labelMap.put("loop_body_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        visit(node.block);

        labelMap.put("loop_cond_" + loopIndex, codeList.size());
        conditionJump(node.condition, "loop_body_" + loopIndex, "loop_end_" + loopIndex);

        labelMap.put("loop_end_" + loopIndex, codeList.size());
        codeList.addLast(new Nop());
        loopStack.removeLast();
    }

    @Override
    void visit(BreakStatementNode node) {
        Jump ins = new Jump();
        ins.targetLabel = "loop_end_" + loopStack.getLast();
        ins.type = Jump.Type.JMP;
        codeList.add(ins);
    }

    @Override
    void visit(ContinueStatementNode node) {
        Jump ins = new Jump();
        int loopIndex = loopCnt - 1;
        ins.targetLabel = "loop_cond_" + loopStack.getLast();
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
