package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

import java.util.*;

public class TrivialRegisterAllocator {

    RegisterConfig registerConfig;

    public void allocateRegister(IR ir, RegisterConfig registerConfig) {
        this.registerConfig = registerConfig;
        for (MethodEntity methodName : ir.methodList)
            allocateRegister(methodName);
    }

    HashMap<Variable, Address> varToAddrMap;
    int rbpOffset;
    void allocateRegister(MethodEntity methodName) {
        varToAddrMap = new HashMap<Variable, Address>();
        rbpOffset = -8; // reserve space for old rbp
        assignAddressToVariable(methodName);
        rewriteCodeList(methodName);
    }

    void assignAddressToVariable(MethodEntity methodName) {
        for (Variable var : methodName.formalParaVarList)
            assignAddressToVariable(var);
        for (IRCode ins : methodName.codeList) {
            HashSet<Variable> varSet = ins.allVariable;
            for (Variable var : varSet)
                assignAddressToVariable(var);
        }
    }

    void assignAddressToVariable(Variable var) {
        if (varToAddrMap.get(var) != null) return;
        Address addr = new Address();
        addr.base = registerConfig.get("rbp");
        addr.offsetNumber = rbpOffset;
        varToAddrMap.put(var, addr);
        rbpOffset -= 8;
    }

    void rewriteCodeList(MethodEntity methodName) {
//        System.out.println("######################### " + methodName.methodNameName);
        LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
        LinkedList<IRCode> codeList = methodName.codeList;
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
        push.src = registerConfig.get("rbp");
        codeList.add(0, push);
        Move move = new Move();
        move.dst = registerConfig.get("rbp");
        move.src = registerConfig.get("rsp");
        codeList.add(1, move);
        Binary sub = new Binary();
        sub.dst = registerConfig.get("rsp");
        sub.src = new Immediate(varToAddrMap.size() * 8);
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
        if (ins.dst instanceof Variable) ins.dst = varToAddrMap.get(ins.dst);
        if (ins.src instanceof Variable) ins.src = varToAddrMap.get(ins.src);
        Operand dst;
        if (ins.dst instanceof Address) {
            dst = registerConfig.get("r0");
            Move move = new Move();
            move.dst = dst;
            move.src = ins.dst;
            res.addLast(move);
        } else dst = ins.dst;
        Operand src;
        if (ins.src instanceof Address) {
            src = registerConfig.get("r1");
            Move move = new Move();
            move.dst = src;
            move.src = ins.src;
            res.addLast(move);
        } else src = ins.src;
        Binary bin = new Binary();
        bin.dst = dst;
        bin.src = src;
        bin.type = ins.type;
        res.addLast(bin);
        if (ins.dst instanceof Address) {
            Move move = new Move();
            move.dst = ins.dst;
            move.src = dst;
            res.addLast(move);
        }
        return res;
    }

    LinkedList<IRCode> rewrite(MethodCall ins) {
        // ATTENTION: assume no caller
        /*  call t = methodName(paraList) -->
            mov r0 para_i
            mov [rsp -8 -8*i] r0
            call methodName
            mov t rax             */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int offset = -8;
        for (Operand para : ins.actualParaVarList) {
            Operand src;
            if (para instanceof Variable) para = varToAddrMap.get(para);
            if (para instanceof Address) {
                src = registerConfig.get("r0");
                Move move = new Move();
                move.dst = src;
                move.src = para;
                res.addLast(move);
            } else src = para;
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offsetNumber = offset;
            Move move = new Move();
            move.dst = addr;
            move.src = src;
            res.addLast(move);
        }
        MethodCall call = new MethodCall();
        call.methodName = ins.methodName;
        res.addLast(call);
        Move move = new Move();
        move.dst = ins.dst;
        move.src = registerConfig.get("rax");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> rewrite(Move ins) {
        /*  mov a, b -->
            mov r1, b
            mov a, r1 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.dst instanceof Variable) ins.dst = varToAddrMap.get(ins.dst);
        if (ins.src instanceof Variable) ins.src = varToAddrMap.get(ins.src);
        if (ins.src instanceof Address && ins.dst instanceof Address) {
            Register r1 = registerConfig.get("r1");
            Move move = new Move();
            move.dst = r1;
            move.src = ins.src;
            res.addLast(move);
            move = new Move();
            move.dst = ins.dst;
            move.src = r1;
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
        if (ins.src != null) {
            Move move = new Move();
            move.dst = registerConfig.get("rax");
            move.src = ins.src;
            res.addLast(move);
        }
        Move move = new Move();
        move.dst = registerConfig.get("rsp");
        move.src = registerConfig.get("rbp");
        res.addLast(move);
        Pop pop = new Pop();
        pop.dst = registerConfig.get("rbp");
        res.addLast(pop);
        res.addLast(new Return());
        return res;
    }
}
