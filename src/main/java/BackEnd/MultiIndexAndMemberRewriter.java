package BackEnd;

import AstNode.DefinitionExpressionNode;
import IR.*;
import IRCode.*;
import IRCode.Set;
import IRCode.Operand.*;

import java.util.*;

public class MultiIndexAndMemberRewriter {

    public void rewriteMultiIndexandMember(IR ir) throws Exception {
        for (MethodEntity method : ir.methodList)
            rewriteMultiIndexandMember(method);
    }

    void rewriteMultiIndexandMember(MethodEntity method) throws Exception {
        for (BasicBlock bb : method.basicBlockList) {
            LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
            LinkedList<IRCode> codeList = bb.codeList;
            for (ListIterator<IRCode> it = codeList.listIterator(); it.hasNext();) {
                IRCode ins = it.next();
                codeListList.addLast(rewriteMultiIndexandMember(ins));
            }
            codeList.clear();
            for (ListIterator<LinkedList<IRCode>> it = codeListList.listIterator(); it.hasNext();) {
                codeList.addAll(codeList.size(), it.next());
            }
        }
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(IRCode ins) throws Exception {
        if (ins instanceof Allocate) return rewriteMultiIndexandMember((Allocate)ins);
        else if (ins instanceof Binary) return rewriteMultiIndexandMember((Binary)ins);
        else if (ins instanceof Compare) return rewriteMultiIndexandMember((Compare)ins);
        else if (ins instanceof Jump) return dontRewrite(ins);
        else if (ins instanceof MethodCall) return rewriteMultiIndexandMember((MethodCall)ins);
        else if (ins instanceof Move) return rewriteMultiIndexandMember((Move)ins);
        else if (ins instanceof Nop) return dontRewrite(ins);
        else if (ins instanceof Return) return rewriteMultiIndexandMember((Return)ins);
        else if (ins instanceof Set) return rewriteMultiIndexandMember((Return)ins);
        else if (ins instanceof Unary) return rewriteMultiIndexandMember((Unary)ins);
        throw new Exception();
    }

    LinkedList<IRCode> dontRewrite(IRCode ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        res.addLast(ins);
        return res;
    }

    Operand rewriteMultiIndexandMember(Operand oprand, LinkedList<IRCode> codeList, boolean outest) {
        if (oprand instanceof IndexVariable) {
            IndexVariable indexAccess = (IndexVariable) oprand;
            Operand array = rewriteMultiIndexandMember(indexAccess.array, codeList, false);
            Operand index = rewriteMultiIndexandMember(indexAccess.index, codeList, false);
            indexAccess = new IndexVariable();
            indexAccess.array = array;
            indexAccess.index = index;
            if (outest) return indexAccess;
            else {
                Variable tmp = new Variable();
                Move move = new Move();
                move.dst = tmp;
                move.src = indexAccess;
                codeList.addLast(move);
                return tmp;
            }
        } else if (oprand instanceof MemberVariable) {
            MemberVariable memberAccess = (MemberVariable) oprand;
            Operand object = rewriteMultiIndexandMember(memberAccess.object, codeList, false);
            DefinitionExpressionNode memberVar = memberAccess.memberVar;
            memberAccess = new MemberVariable();
            memberAccess.object = object;
            memberAccess.memberVar = memberVar;
            if (outest) return memberAccess;
            else {
                Variable tmp = new Variable();
                Move move = new Move();
                move.dst = tmp;
                move.src = memberAccess;
                codeList.addLast(move);
                return tmp;
            }
        } else return oprand;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Allocate ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.size = rewriteMultiIndexandMember(ins.size, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Binary ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.src = rewriteMultiIndexandMember(ins.src, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Compare ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.src0 = rewriteMultiIndexandMember(ins.src0, res, true);
        ins.src1 = rewriteMultiIndexandMember(ins.src1, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(MethodCall ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        LinkedList<Operand> newActualParaVarList = new LinkedList<Operand>();
        for (Operand para : ins.actualParaVarList)
            newActualParaVarList.addLast(rewriteMultiIndexandMember(para, res, true));
        ins.actualParaVarList = newActualParaVarList;
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Move ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.src = rewriteMultiIndexandMember(ins.src, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Return ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.src = rewriteMultiIndexandMember(ins.src, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Set ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Unary ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        res.addLast(ins);
        return res;
    }
}
