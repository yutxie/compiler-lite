package BackEnd;

import AstNode.DefinitionExpressionNode;
import IR.*;
import IRCode.*;
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
        else if (ins instanceof Idiv) return rewriteMultiIndexandMember((Idiv)ins);
        else if (ins instanceof Jump) return dontRewrite(ins);
        else if (ins instanceof MethodCall) return rewriteMultiIndexandMember((MethodCall)ins);
        else if (ins instanceof Move) return rewriteMultiIndexandMember((Move)ins);
        else if (ins instanceof Nop) return dontRewrite(ins);
        else if (ins instanceof Return) return rewriteMultiIndexandMember((Return)ins);
        else if (ins instanceof Cmove) return rewriteMultiIndexandMember((Cmove) ins);
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
        if ((ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) &&
            (ins.size instanceof IndexVariable || ins.size instanceof MemberVariable)) {
            Variable t = new Variable();
            Move move = new Move();
            move.dst = t;
            move.src = rewriteMultiIndexandMember(ins.size, res, true);
            res.addLast(move);
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.size = t;
            res.addLast(ins);
            return res;
        }
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.size = rewriteMultiIndexandMember(ins.size, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Binary ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if ((ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) &&
            (ins.src instanceof IndexVariable || ins.src instanceof MemberVariable)) {
            Variable t = new Variable();
            Move move = new Move();
            move.dst = t;
            move.src = rewriteMultiIndexandMember(ins.src, res, true);
            res.addLast(move);
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.src = t;
            res.addLast(ins);
            return res;
        }
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.src = rewriteMultiIndexandMember(ins.src, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Compare ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if ((ins.src0 instanceof IndexVariable || ins.src0 instanceof MemberVariable) &&
            (ins.src1 instanceof IndexVariable || ins.src1 instanceof MemberVariable)) {
            Variable t = new Variable();
            Move move = new Move();
            move.dst = t;
            move.src = rewriteMultiIndexandMember(ins.src1, res, true);
            res.addLast(move);
            ins.src0 = rewriteMultiIndexandMember(ins.src0, res, true);
            ins.src1 = t;
            res.addLast(ins);
            return res;
        }
        ins.src0 = rewriteMultiIndexandMember(ins.src0, res, true);
        ins.src1 = rewriteMultiIndexandMember(ins.src1, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(Idiv ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int cnt = 0;
        if (ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) ++cnt;
        if (ins.src0 instanceof IndexVariable || ins.src0 instanceof MemberVariable) ++cnt;
        if (ins.src1 instanceof IndexVariable || ins.src1 instanceof MemberVariable) ++cnt;
        if (cnt > 1) {
            Variable t0 = new Variable();
            Move move = new Move();
            move.dst = t0;
            move.src = rewriteMultiIndexandMember(ins.src0, res, true);
            res.addLast(move);
            Variable t1 = new Variable();
            move = new Move();
            move.dst = t1;
            move.src = rewriteMultiIndexandMember(ins.src1, res, true);
            res.addLast(move);
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.src0 = t0;
            ins.src1 = t1;
            res.addLast(ins);
            return res;
        }
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.src0 = rewriteMultiIndexandMember(ins.src0, res, true);
        ins.src1 = rewriteMultiIndexandMember(ins.src1, res, true);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteMultiIndexandMember(MethodCall ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int cnt = 0;
        if (ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) ++cnt;
        for (Operand para : ins.actualParaVarList)
            if (para instanceof IndexVariable || para instanceof MemberVariable) ++cnt;
        if (cnt > 1) {
            int n = ins.actualParaVarList.size();
            ArrayList<Variable> tList = new ArrayList<Variable>();
            for (int i = 0; i < n; ++i) tList.add(i, new Variable());
            int i = 0;
            for (Operand para : ins.actualParaVarList) {
                Move move = new Move();
                move.dst = tList.get(i++);
                move.src = rewriteMultiIndexandMember(para, res, true);
                res.addLast(move);
            }
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.actualParaVarList.clear();
            for (i = 0; i < n; ++i) ins.actualParaVarList.addLast(tList.get(i));
            res.addLast(ins);
            return res;
        }
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
        if ((ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) &&
                (ins.src instanceof IndexVariable || ins.src instanceof MemberVariable)) {
            Variable t = new Variable();
            Move move = new Move();
            move.dst = t;
            move.src = rewriteMultiIndexandMember(ins.src, res, true);
            res.addLast(move);
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.src = t;
            res.addLast(ins);
            return res;
        }
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

    LinkedList<IRCode> rewriteMultiIndexandMember(Cmove ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if ((ins.dst instanceof IndexVariable || ins.dst instanceof MemberVariable) &&
                (ins.src instanceof IndexVariable || ins.src instanceof MemberVariable)) {
            Variable t = new Variable();
            Move move = new Move();
            move.dst = t;
            move.src = rewriteMultiIndexandMember(ins.src, res, true);
            res.addLast(move);
            ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
            ins.src = t;
            res.addLast(ins);
            return res;
        }
        ins.dst = rewriteMultiIndexandMember(ins.dst, res, true);
        ins.src = rewriteMultiIndexandMember(ins.src, res, true);
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
