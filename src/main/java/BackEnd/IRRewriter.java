package BackEnd;

import IR.*;
import IR.IRCode.*;
import IR.IRCode.Operand.*;
import IR.IRCode.Set;

import java.util.*;

public class IRRewriter {

    HashMap<Variable, Register> assignedMap;
    RegisterConfig registerConfig;

    void rewriteIR(MethodEntity method,
                   HashMap<Variable, Register> assignedMap,
                   RegisterConfig registerConfig) throws Exception {
        this.assignedMap = assignedMap;
        this.registerConfig = registerConfig;
        assignRegister(method);
        assignAddress(method);
        spillCode(method);
    }

    ///////////////////// assign reg //////////////////////////
    void assignRegister(MethodEntity method) {
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList)
                assignRegister(ins);
    }

    void assignRegister(IRCode ins) {
        if (ins instanceof Binary) assignRegister((Binary)ins);
        else if (ins instanceof Compare) assignRegister((Compare)ins);
        else if (ins instanceof Move) assignRegister((Move)ins);
        else if (ins instanceof Return) assignRegister((Return)ins);
        else if (ins instanceof Set) assignRegister((Set)ins);
        else if (ins instanceof Unary) assignRegister((Unary)ins);
    }

    void assignRegister(Binary ins) {
        if (ins.dst instanceof Variable) {
            Register reg = assignedMap.get(ins.dst);
            if (reg != null) ins.dst = reg;
        }
        if (ins.src instanceof Variable) {
            Register reg = assignedMap.get(ins.src);
            if (reg != null) ins.src = reg;
        }
    }

    void assignRegister(Compare ins) {
        if (ins.src0 instanceof Variable) {
            Register reg = assignedMap.get(ins.src0);
            if (reg != null) ins.src0 = reg;
        }
        if (ins.src1 instanceof Variable) {
            Register reg = assignedMap.get(ins.src1);
            if (reg != null) ins.src1 = reg;
        }
    }

    void assignRegister(Move ins) {
        if (ins.dst instanceof Variable) {
            Register reg = assignedMap.get(ins.dst);
            if (reg != null) ins.dst = reg;
        }
        if (ins.src instanceof Variable) {
            Register reg = assignedMap.get(ins.src);
            if (reg != null) ins.src = reg;
        }
    }

    void assignRegister(Return ins) {
        if (ins.src instanceof Variable) {
            Register reg = assignedMap.get(ins.src);
            if (reg != null) ins.src = reg;
        }
    }

    void assignRegister(Set ins) {
        if (ins.dst instanceof Variable) {
            Register reg = assignedMap.get(ins.dst);
            if (reg != null) ins.dst = reg;
        }
    }

    void assignRegister(Unary ins) {
        if (ins.dst instanceof Variable) {
            Register reg = assignedMap.get(ins.dst);
            if (reg != null) ins.dst = reg;
        }
    }

    //////////////////// assign addr //////////////////////////
    HashMap<Variable, Address> varToAddrMap;
    int rbpOffset;
    void assignAddress(MethodEntity method) throws Exception {
        varToAddrMap = new HashMap<Variable, Address>();
        rbpOffset = -8; // reserve space for old rbp
        for (Variable var : method.formalParaVarList) // ATTENTION: para
            assignAddress(var);
        for (IRCode ins : method.codeList) {
            HashSet<Variable> varSet = ins.allVariable;
            for (Variable var : varSet)
                assignAddress(var);
        }
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList)
                assignAddress(ins);
    }

    void assignAddress(Variable var) {
        if (varToAddrMap.get(var) != null) return;
        Address addr = new Address();
        addr.base = registerConfig.get("rbp");
        addr.offestNumber = rbpOffset;
        varToAddrMap.put(var, addr);
        rbpOffset -= 8;
    }

    void assignAddress(IRCode ins) throws Exception {
        if (ins instanceof Binary) assignAddress((Binary)ins);
        else if (ins instanceof Compare) assignAddress((Compare)ins);
        else if (ins instanceof Move) assignAddress((Move)ins);
        else if (ins instanceof Return) assignAddress((Return)ins);
        else if (ins instanceof Set) assignAddress((Set)ins);
        else if (ins instanceof Unary) assignAddress((Unary)ins);
    }

    void assignAddress(Binary ins) throws Exception {
        if (ins.dst instanceof Variable) {
            Address addr = varToAddrMap.get(ins.dst);
            if (addr == null) throw new Exception("no address assigned to " + ins.dst.getName());
            else ins.dst = addr;
        }
        if (ins.src instanceof Variable) {
            Address addr = varToAddrMap.get(ins.src);
            if (addr == null) throw new Exception("no address assigned to " + ins.src.getName());
            else ins.src = addr;
        }
    }

    void assignAddress(Compare ins) throws Exception {
        if (ins.src0 instanceof Variable) {
            Address addr = varToAddrMap.get(ins.src0);
            if (addr == null) throw new Exception("no address assigned to " + ins.src0.getName());
            else ins.src0 = addr;
        }
        if (ins.src1 instanceof Variable) {
            Address addr = varToAddrMap.get(ins.src1);
            if (addr == null) throw new Exception("no address assigned to " + ins.src1.getName());
            else ins.src1 = addr;
        }
    }

    void assignAddress(Move ins) throws Exception {
        if (ins.dst instanceof Variable) {
            Address addr = varToAddrMap.get(ins.dst);
            if (addr == null) throw new Exception("no address assigned to " + ins.dst.getName());
            else ins.dst = addr;
        }
        if (ins.src instanceof Variable) {
            Address addr = varToAddrMap.get(ins.src);
            if (addr == null) throw new Exception("no address assigned to " + ins.src.getName());
            else ins.src = addr;
        }
    }

    void assignAddress(Return ins) throws Exception {
        if (ins.src instanceof Variable) {
            Address addr = varToAddrMap.get(ins.src);
            if (addr == null) throw new Exception("no address assigned to " + ins.src.getName());
            else ins.src = addr;
        }
    }

    void assignAddress(Set ins) throws Exception {
        if (ins.dst instanceof Variable) {
            Address addr = varToAddrMap.get(ins.dst);
            if (addr == null) throw new Exception("no address assigned to " + ins.dst.getName());
            else ins.dst = addr;
        }
    }

    void assignAddress(Unary ins) throws Exception {
        if (ins.dst instanceof Variable) {
            Address addr = varToAddrMap.get(ins.dst);
            if (addr == null) throw new Exception("no address assigned to " + ins.dst.getName());
            else ins.dst = addr;
        }
    }

    //////////////////// spill code //////////////////////////
    void spillCode(MethodEntity method) {
        for (BasicBlock bb : method.basicBlockList)
            spillCode(bb);
    }

    void spillCode(BasicBlock basicBlock) {
        LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
        LinkedList<IRCode> codeList = basicBlock.codeList;
        for (ListIterator<IRCode> it = codeList.listIterator(); it.hasNext();) {
            IRCode ins = it.next();
//            System.out.print("=========== ");
//            ins.printInformation();
            codeListList.addLast(spillCode(ins));
//            for (IRCode item : codeListList.getLast())
//                item.printInformation();
        }
        codeList.clear();
        for (ListIterator<LinkedList<IRCode>> it = codeListList.listIterator(); it.hasNext();) {
            codeList.addAll(codeList.size(), it.next());
        }
        if (!basicBlock.leadLabel.endsWith("_entry")) return;
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

    LinkedList<IRCode> spillCode(IRCode ins) {
        if (ins instanceof Binary) return spillCode((Binary)ins);
        else if (ins instanceof Compare) return spillCode((Compare)ins);
        else if (ins instanceof MethodCall) return spillCode((MethodCall)ins);
        else if (ins instanceof Move) return spillCode((Move)ins);
        else if (ins instanceof Return) return spillCode((Return)ins);
//        else if (ins instanceof Set) return spillCode((Set)ins); // support mem
//        else if (ins instanceof Unary) return spillCode((Unary)ins); // support mem
        LinkedList res = new LinkedList();
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> spillCode(Binary ins) {
        /*  bin a, b -->
            mov r0, a
            mov r1, b
            add r0, r1
            mov a, r0 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
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

    LinkedList<IRCode> spillCode(Compare ins) {
        /*  cmp a, b -->
            mov r0, b
            cmp a, r0   */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        Operand src1;
        if (ins.src1 instanceof Address) {
            Register reg = registerConfig.get("rdx");
            Move move = new Move();
            move.dst = reg;
            move.src = ins.src1;
            src1 = reg;
        } else src1 = ins.src1;
        Compare cmp = new Compare();
        cmp.src0 = ins.src0;
        cmp.src1 = src1;
        res.addLast(cmp);
        return res;
    }

    LinkedList<IRCode> spillCode(MethodCall ins) {
        // ATTENTION: assume no caller
        /*  call t = method(paraList) -->
            mov r0 para_i
            mov [rsp -8 -8*i] r0
            call method
            mov t rax             */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int offset = -8;
        for (Operand para : ins.actualParaVarList) {
            Operand src;
            if (para instanceof Address) {
                src = registerConfig.get("r0");
                Move move = new Move();
                move.dst = src;
                move.src = para;
                res.addLast(move);
            } else src = para;
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offestNumber = offset;
            Move move = new Move();
            move.dst = addr;
            move.src = src;
            res.addLast(move);
        }
        MethodCall call = new MethodCall();
        call.method = ins.method;
        res.addLast(call);
        Move move = new Move();
        move.dst = ins.dst;
        move.src = registerConfig.get("rax");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> spillCode(Move ins) {
        /*  mov a, b -->
            mov r1, b
            mov a, r1 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
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

    LinkedList<IRCode> spillCode(Return ins) {
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
