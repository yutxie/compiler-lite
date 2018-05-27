package BackEnd;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Operand.*;

import java.util.*;

public class TrivialRegisterAllocator {

    RegisterConfig registerConfig;

    public void allocateRegister(IR ir, RegisterConfig registerConfig) {
        this.registerConfig = registerConfig;
        for (MethodEntity method : ir.methodList)
            allocateRegister(method);
    }

    HashMap<Variable, Address> varToAddrMap;
    int rbpOffset;
    void allocateRegister(MethodEntity method) {
        varToAddrMap = new HashMap<Variable, Address>();
        rbpOffset = -8; // reserve space for old rbp
        assignAddressToVariable(method);
        rewriteCodeList(method);
    }

    void assignAddressToVariable(MethodEntity method) {
        for (Variable var : method.formalParaVarList)
            assignAddressToVariable(var);
        for (IRCode ins : method.codeList) {
            HashSet<Variable> varSet = ins.allVariable;
            for (Variable var : varSet)
                assignAddressToVariable(var);
        }
    }

    void assignAddressToVariable(Variable var) {
        if (varToAddrMap.get(var) != null) return;
        Address addr = new Address();
        addr.base = registerConfig.get("rbp");
        addr.offestNumber = rbpOffset;
        varToAddrMap.put(var, addr);
        rbpOffset -= 8;
    }

    void rewriteCodeList(MethodEntity method) {
//        System.out.println("######################### " + method.methodName);
        LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
        LinkedList<IRCode> codeList = method.codeList;
        for (ListIterator<IRCode> it = codeList.listIterator(); it.hasNext();) {
            IRCode ins = it.next();
//            System.out.print("=========== ");
//            ins.printInformation();
            codeListList.addLast(rewrite(ins));
//            for (IRCode item : codeListList.getLast())
//                item.printInformation();
        }
        codeList.clear();
        for (ListIterator<LinkedList<IRCode>> it = codeListList.listIterator(); it.hasNext();) {
            codeList.addAll(codeList.size(), it.next());
        }
        /*  push rbp     | == enter
            mov rbp, rsp |
            sub rsp, #var * 8
            ...
         */
        Push push = new Push();
        push.rhs = registerConfig.get("rbp");
        codeList.add(0, push);
        Move move = new Move();
        move.lhs = registerConfig.get("rbp");
        move.rhs = registerConfig.get("rsp");
        codeList.add(1, move);
        Binary sub = new Binary();
        sub.lhs = registerConfig.get("rsp");
        sub.rhs = new Immediate(varToAddrMap.size() * 8);
        sub.type = Binary.Type.SUB;
        codeList.add(2, sub);
    }

    LinkedList<IRCode> rewrite(IRCode ins) {
        if (ins instanceof Binary) return rewrite((Binary)ins);
        else if (ins instanceof MethodCall) return rewrite((MethodCall)ins);
        else if (ins instanceof Move) return rewrite((Move)ins);
        else if (ins instanceof Return) return rewrite((Return)ins);
        LinkedList res = new LinkedList();
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewrite(Binary ins) {
        /*  bin a, b -->
            mov r0, a
            mov r1, b
            add r0, r1
            mov a, r0 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.lhs instanceof Variable) ins.lhs = varToAddrMap.get(ins.lhs);
        if (ins.rhs instanceof Variable) ins.rhs = varToAddrMap.get(ins.rhs);
        Operand lhs;
        if (ins.lhs instanceof Address) {
            lhs = registerConfig.get("r0");
            Move move = new Move();
            move.lhs = lhs;
            move.rhs = ins.lhs;
            res.addLast(move);
        } else lhs = ins.lhs;
        Operand rhs;
        if (ins.rhs instanceof Address) {
            rhs = registerConfig.get("r1");
            Move move = new Move();
            move.lhs = rhs;
            move.rhs = ins.rhs;
            res.addLast(move);
        } else rhs = ins.rhs;
        Binary bin = new Binary();
        bin.lhs = lhs;
        bin.rhs = rhs;
        bin.type = ins.type;
        res.addLast(bin);
        if (ins.lhs instanceof Address) {
            Move move = new Move();
            move.lhs = ins.lhs;
            move.rhs = lhs;
            res.addLast(move);
        }
        return res;
    }

    LinkedList<IRCode> rewrite(MethodCall ins) {
        // ATTENTION: assume no caller
        /*  call t = method(paraList) -->
            mov r0 para_i
            mov [rsp -8 -8*i] r0
            call method
            mov t rax             */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int offset = -8;
        for (Operand para : ins.actualParaVarList) {
            Operand rhs;
            if (para instanceof Variable) para = varToAddrMap.get(para);
            if (para instanceof Address) {
                rhs = registerConfig.get("r0");
                Move move = new Move();
                move.lhs = rhs;
                move.rhs = para;
                res.addLast(move);
            } else rhs = para;
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offestNumber = offset;
            Move move = new Move();
            move.lhs = addr;
            move.rhs = rhs;
            res.addLast(move);
        }
        MethodCall call = new MethodCall();
        call.method = ins.method;
        res.addLast(call);
        Move move = new Move();
        move.lhs = ins.lhs;
        move.rhs = registerConfig.get("rax");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> rewrite(Move ins) {
        /*  mov a, b -->
            mov r1, b
            mov a, r1 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.lhs instanceof Variable) ins.lhs = varToAddrMap.get(ins.lhs);
        if (ins.rhs instanceof Variable) ins.rhs = varToAddrMap.get(ins.rhs);
        if (ins.rhs instanceof Address && ins.lhs instanceof Address) {
            Register r1 = registerConfig.get("r1");
            Move move = new Move();
            move.lhs = r1;
            move.rhs = ins.rhs;
            res.addLast(move);
            move = new Move();
            move.lhs = ins.lhs;
            move.rhs = r1;
            res.addLast(move);
        } else res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewrite(Return ins) {
        /*  return x -->
            mov rax, x
            mov rsp, rbp  | == leave
            pop rbp       |
            ret        */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.returnValue != null) {
            Move move = new Move();
            move.lhs = registerConfig.get("rax");
            move.rhs = ins.returnValue;
            res.addLast(move);
        }
        Move move = new Move();
        move.lhs = registerConfig.get("rsp");
        move.rhs = registerConfig.get("rbp");
        res.addLast(move);
        Pop pop = new Pop();
        pop.rhs = registerConfig.get("rbp");
        res.addLast(pop);
        res.addLast(new Return());
        return res;
    }
}
