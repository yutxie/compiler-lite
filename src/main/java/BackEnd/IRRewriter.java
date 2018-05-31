package BackEnd;

import AstNode.ClassDefinitionNode;
import AstNode.DefinitionExpressionNode;
import AstNode.MethodDefinitionNode;
import IR.*;
import IRCode.*;
import IRCode.Operand.*;

import java.util.*;

public class IRRewriter {

    HashMap<Variable, Register> assignedMap;
    RegisterConfig registerConfig;

    void rewriteIR(MethodEntity method,
                   HashMap<Variable, Register> assignedMap,
                   RegisterConfig registerConfig) throws Exception {
        this.assignedMap = assignedMap;
        this.registerConfig = registerConfig;
//        method.printInformation();
        rewriteIndexAndMember(method);
//        method.printInformation();
        assignRegister(method);
//        method.printInformation();
        assignAddress(method);
//        method.printInformation();
        spillCode(method);
    }

    //////////////////// rewrite index and member /////////////
    void rewriteIndexAndMember(MethodEntity method) throws Exception {
        for (BasicBlock bb : method.basicBlockList) {
            LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
            LinkedList<IRCode> codeList = bb.codeList;
            for (ListIterator<IRCode> it = codeList.listIterator(); it.hasNext();) {
                IRCode ins = it.next();
                codeListList.addLast(rewriteIndexAndMember(ins));
            }
            codeList.clear();
            for (ListIterator<LinkedList<IRCode>> it = codeListList.listIterator(); it.hasNext();) {
                codeList.addAll(codeList.size(), it.next());
            }
        }
    }

    LinkedList<IRCode> rewriteIndexAndMember(IRCode ins) throws Exception {
        if (ins instanceof Allocate) return rewriteIndexAndMember((Allocate)ins);
        else if (ins instanceof Binary) return rewriteIndexAndMember((Binary)ins);
        else if (ins instanceof Compare) return rewriteIndexAndMember((Compare)ins);
        else if (ins instanceof Idiv) return rewriteIndexAndMember((Idiv)ins);
        else if (ins instanceof Jump) return dontSpillCode(ins); // the same as spill code
        else if (ins instanceof MethodCall) return rewriteIndexAndMember((MethodCall)ins);
        else if (ins instanceof Move) return rewriteIndexAndMember((Move)ins);
        else if (ins instanceof Nop) return dontSpillCode(ins);
        else if (ins instanceof Return) return rewriteIndexAndMember((Return)ins);
        else if (ins instanceof Cmove) return rewriteIndexAndMember((Cmove) ins);
        else if (ins instanceof Unary) return rewriteIndexAndMember((Unary)ins);
        throw new Exception();
    }

    Operand rewriteIndexAndMember(Operand oprand, LinkedList<IRCode> codeList) {
        if (oprand instanceof IndexVariable) {
            IndexVariable indexAccess = (IndexVariable) oprand;
            Register base = registerConfig.get("rbx"); // ATTENTION
            Register index = registerConfig.get("rcx");
            Move move = new Move();
            move.dst = base;
            move.src = indexAccess.array;
            codeList.addLast(move);
            move = new Move();
            move.dst = index;
            move.src = indexAccess.index;
            codeList.addLast(move);
            Address addr = new Address();
            addr.base = base;
            addr.offsetReg = index;
            return addr;
        } else if (oprand instanceof MemberVariable) {
            MemberVariable memberAccess = (MemberVariable) oprand;
            Register base = registerConfig.get("rbx"); // ATTENTION
            Move move = new Move();
            move.dst = base;
            move.src = memberAccess.object;
            codeList.addLast(move);
            int index = 0;
            ClassDefinitionNode classDef = (ClassDefinitionNode) memberAccess.memberVar.parent;
            for (DefinitionExpressionNode memberVarDef : classDef.memberVariableList)
                if (memberVarDef != memberAccess.memberVar) ++index;
                else break;
            Address addr = new Address();
            addr.base = base;
            addr.offsetNumber = index * 8;
            return addr;
        } else return oprand;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Allocate ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        ins.size = rewriteIndexAndMember(ins.size, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Binary ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        ins.src = rewriteIndexAndMember(ins.src, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Compare ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.src0 = rewriteIndexAndMember(ins.src0, res);
        ins.src1 = rewriteIndexAndMember(ins.src1, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Idiv ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        ins.src0 = rewriteIndexAndMember(ins.src0, res);
        ins.src1 = rewriteIndexAndMember(ins.src1, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(MethodCall ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        LinkedList<Operand> newActualParaVarList = new LinkedList<Operand>();
        for (Operand para : ins.actualParaVarList)
            newActualParaVarList.addLast(rewriteIndexAndMember(para, res));
        ins.actualParaVarList = newActualParaVarList;
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Move ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        ins.src = rewriteIndexAndMember(ins.src, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Return ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.src = rewriteIndexAndMember(ins.src, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Cmove ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        ins.src = rewriteIndexAndMember(ins.src, res);
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> rewriteIndexAndMember(Unary ins) {
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        ins.dst = rewriteIndexAndMember(ins.dst, res);
        res.addLast(ins);
        return res;
    }

    ///////////////////// assign reg //////////////////////////
    void assignRegister(MethodEntity method) throws Exception {
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList)
                assignRegister(ins);
    }

    Operand assignRegister(Operand var) {
        if (var instanceof Variable) {
            Register reg = assignedMap.get(var);
            if (reg == null) return var;
            else return reg;
        } else return var;
    }

    void assignRegister(IRCode ins) throws Exception {
        if (ins instanceof Allocate) assignRegister((Allocate)ins);
        else if (ins instanceof Binary) assignRegister((Binary)ins);
        else if (ins instanceof Compare) assignRegister((Compare)ins);
        else if (ins instanceof Idiv) assignRegister((Idiv)ins);
        else if (ins instanceof Jump) return;
        else if (ins instanceof MethodCall) assignRegister((MethodCall)ins);
        else if (ins instanceof Move) assignRegister((Move)ins);
        else if (ins instanceof Nop) return;
        else if (ins instanceof Return) assignRegister((Return)ins);
        else if (ins instanceof Cmove) assignRegister((Cmove) ins);
        else if (ins instanceof Unary) assignRegister((Unary)ins);
        else throw new Exception();
    }

    void assignRegister(Allocate ins) {
        ins.dst = assignRegister(ins.dst);
        ins.size = assignRegister(ins.size);
    }

    void assignRegister(Binary ins) {
        ins.dst = assignRegister(ins.dst);
        ins.src = assignRegister(ins.src);
    }

    void assignRegister(Compare ins) {
        ins.src0 = assignRegister(ins.src0);
        ins.src1 = assignRegister(ins.src1);
    }

    void assignRegister(Idiv ins) {
        ins.dst = assignRegister(ins.dst);
        ins.src0 = assignRegister(ins.src0);
        ins.src1 = assignRegister(ins.src1);
    }

    void assignRegister(MethodCall ins) {
        ins.dst = assignRegister(ins.dst);
        LinkedList<Operand> newActualParaVarList = new LinkedList<Operand>();
        for (Operand para : ins.actualParaVarList)
            newActualParaVarList.addLast(assignRegister(para));
        ins.actualParaVarList = newActualParaVarList;
    }

    void assignRegister(Move ins) {
        ins.dst = assignRegister(ins.dst);
        ins.src = assignRegister(ins.src);
    }

    void assignRegister(Return ins) {
        ins.src = assignRegister(ins.src);
    }

    void assignRegister(Cmove ins) {
        ins.dst = assignRegister(ins.dst);
        ins.src = assignRegister(ins.src);
    }

    void assignRegister(Unary ins) {
        ins.dst = assignRegister(ins.dst);
    }

    //////////////////// assign addr //////////////////////////
    HashMap<Variable, Address> varToAddrMap;
    int rbpOffset;
    void assignAddress(MethodEntity method) throws Exception {
        varToAddrMap = new HashMap<Variable, Address>();
        rbpOffset = -8; // reserve space for old rbp
        for (Variable var : method.formalParaVarList) {
            Address addr = new Address();
            addr.base = registerConfig.get("rbp");
            addr.offsetNumber = rbpOffset;
            rbpOffset -= 8;
            Operand para = assignedMap.get(var);
            if (para == null) para = getAddress(var);
            Move move = new Move();
            move.dst = para;
            move.src = addr;
            method.basicBlockList.getFirst().codeList.addFirst(move);
        }
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList) {
                HashSet<Variable> varSet = ins.allVariable;
                for (Variable var : varSet)
                    if (assignedMap.get(var) == null)
                        getAddress(var);
            }
        for (BasicBlock bb : method.basicBlockList)
            for (IRCode ins : bb.codeList)
                assignAddress(ins);
    }

    Address getAddress(Variable var) {
        Address addr = varToAddrMap.get(var);
        if (addr != null) return addr;
        addr = new Address();
        addr.base = registerConfig.get("rbp");
        addr.offsetNumber = rbpOffset;
        varToAddrMap.put(var, addr);
        rbpOffset -= 8;
//        System.out.println(var.getName() + " --> " + addr.getName());
        return addr;
    }

    Operand assignAddress(Operand var) throws Exception {
        if (var instanceof Variable) {
            Address addr = varToAddrMap.get(var);
            if (addr == null) throw new Exception("no address assigned to " + var.getName());
            else return addr;
        } else return var;
    }

    void assignAddress(IRCode ins) throws Exception {
        if (ins instanceof Allocate) assignAddress((Allocate)ins);
        else if (ins instanceof Binary) assignAddress((Binary)ins);
        else if (ins instanceof Compare) assignAddress((Compare)ins);
        else if (ins instanceof Idiv) assignAddress((Idiv)ins);
        else if (ins instanceof Jump) return;
        else if (ins instanceof MethodCall) assignAddress((MethodCall)ins);
        else if (ins instanceof Move) assignAddress((Move)ins);
        else if (ins instanceof Nop) return;
        else if (ins instanceof Return) assignAddress((Return)ins);
        else if (ins instanceof Cmove) assignAddress((Cmove) ins);
        else if (ins instanceof Unary) assignAddress((Unary)ins);
        else throw new Exception();
    }

    void assignAddress(Allocate ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        ins.size = assignAddress(ins.size);
    }

    void assignAddress(Binary ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        ins.src = assignAddress(ins.src);
    }

    void assignAddress(Compare ins) throws Exception {
        ins.src0 = assignAddress(ins.src0);
        ins.src1 = assignAddress(ins.src1);
    }

    void assignAddress(Idiv ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        ins.src0 = assignAddress(ins.src0);
        ins.src1 = assignAddress(ins.src1);
    }

    void assignAddress(MethodCall ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        LinkedList<Operand> newActualParaVarList = new LinkedList<Operand>();
        for (Operand para : ins.actualParaVarList)
            newActualParaVarList.addLast(assignAddress(para));
        ins.actualParaVarList = newActualParaVarList;
    }

    void assignAddress(Move ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        ins.src = assignAddress(ins.src);
    }

    void assignAddress(Return ins) throws Exception {
        ins.src = assignAddress(ins.src);
    }

    void assignAddress(Cmove ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
        ins.src = assignAddress(ins.src);
    }

    void assignAddress(Unary ins) throws Exception {
        ins.dst = assignAddress(ins.dst);
    }

    //////////////////// spill code //////////////////////////
    void spillCode(MethodEntity method) throws Exception {
        for (BasicBlock bb : method.basicBlockList)
            spillCode(bb);
        /*  push rbp     | == enter
            mov rbp, rsp |
            sub rsp, #var * 8
            ...
         */
        LinkedList<IRCode> codeList = method.basicBlockList.getFirst().codeList;
        Push push = new Push();
        push.src = registerConfig.get("rbp");
        codeList.add(0, push);
        Move move = new Move();
        move.dst = registerConfig.get("rbp");
        move.src = registerConfig.get("rsp");
        codeList.add(1, move);
        Binary sub = new Binary();
        sub.dst = registerConfig.get("rsp");
        sub.src = new Immediate((varToAddrMap.size() + method.formalParaVarList.size()) * 8 +
            registerConfig.numOfAll * 8);
        sub.type = Binary.Type.SUB;
        codeList.add(2, sub);
    }

    void spillCode(BasicBlock basicBlock) throws Exception {
        LinkedList<LinkedList<IRCode>> codeListList = new LinkedList<LinkedList<IRCode>>();
        LinkedList<IRCode> codeList = basicBlock.codeList;
        for (ListIterator<IRCode> it = codeList.listIterator(); it.hasNext();) {
            IRCode ins = it.next();
            codeListList.addLast(spillCode(ins));
        }
        codeList.clear();
        for (ListIterator<LinkedList<IRCode>> it = codeListList.listIterator(); it.hasNext();) {
            codeList.addAll(codeList.size(), it.next());
        }
    }

    LinkedList<IRCode> spillCode(IRCode ins) throws Exception {
        if (ins instanceof Allocate) return spillCode((Allocate)ins);
        else if (ins instanceof Binary) return spillCode((Binary)ins);
        else if (ins instanceof Cmove) return spillCode((Cmove)ins);
        else if (ins instanceof Compare) return spillCode((Compare)ins);
        else if (ins instanceof Idiv) return spillCode((Idiv)ins);
        else if (ins instanceof Jump) return dontSpillCode(ins);
        else if (ins instanceof MethodCall) return spillCode((MethodCall)ins);
        else if (ins instanceof Move) return spillCode((Move)ins);
        else if (ins instanceof Nop) return dontSpillCode(ins);
        else if (ins instanceof Return) return spillCode((Return)ins);
        else if (ins instanceof Unary) return dontSpillCode(ins); // support mem
        throw new Exception();
    }

    LinkedList<IRCode> dontSpillCode(IRCode ins) {
        LinkedList res = new LinkedList();
        res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> spillCode(Allocate ins) {
        /*  allocate dst size -->
            ... store regs ...
            mov     rdi, size
            call    malloc
            ... load regs ...
            mov     dst, rax */
        LinkedList<IRCode> res = new LinkedList<IRCode>();

        int offset = 0;
        for (int i = 8; i < registerConfig.numOfAll; ++i) {
            Register reg = registerConfig.get(i);
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offsetNumber = offset;
            offset += 8;
            Move move = new Move();
            move.dst = addr;
            move.src = reg;
            res.addLast(move);
        }

        Move move = new Move();
        move.dst = registerConfig.get("rdi");
        move.src = ins.size;
        res.addLast(move);
        MethodCall call = new MethodCall();
        call.method = new MethodDefinitionNode();
        call.method.methodName = "malloc";
        res.addLast(call);

        offset = 0;
        for (int i = 8; i < registerConfig.numOfAll; ++i) {
            Register reg = registerConfig.get(i);
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offsetNumber = offset;
            offset += 8;
            move = new Move();
            move.dst = reg;
            move.src = addr;
            res.addLast(move);
        }

        move = new Move();
        move.dst = ins.dst;
        move.src = registerConfig.get("rax");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> spillCode(Binary ins) {
        /*  bin a, b -->
            mov r8, a
            mov r9, b
            add r8, r9
            mov a, r8 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        Operand dst;
        if (ins.dst instanceof Address) {
            dst = registerConfig.get("r8");
            Move move = new Move();
            move.dst = dst;
            move.src = ins.dst;
            res.addLast(move);
        } else dst = ins.dst;
        Operand src;
        if (ins.src instanceof Address) {
            src = registerConfig.get("r9");
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

    LinkedList<IRCode> spillCode(Cmove ins) {
        /*  cmov    dst src -->
            mov     r8 dst
            cmov    r8 src
            mov     dst r8  */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.dst instanceof Address) {
            Operand dst = ins.dst;
            Register reg = registerConfig.get("r8");
            Move move = new Move();
            move.dst = reg;
            move.src = ins.dst;
            res.addLast(move);
            ins.dst = reg;
            res.addLast(ins);
            move = new Move();
            move.dst = dst;
            move.src = reg;
            res.addLast(move);
        } else res.addLast(ins);
        return res;
    }

    LinkedList<IRCode> spillCode(Compare ins) {
        /*  cmp a, b -->
            mov r8, b
            cmp a, r8   */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        Operand src1;
        if (ins.src1 instanceof Address) {
            Register reg = registerConfig.get("r8");
            Move move = new Move();
            move.dst = reg;
            move.src = ins.src1;
            res.addLast(move);
            src1 = reg;
        } else src1 = ins.src1;
        Compare cmp = new Compare();
        cmp.src0 = ins.src0;
        cmp.src1 = src1;
        res.addLast(cmp);
        return res;
    }

    LinkedList<IRCode> spillCode(Idiv ins) {
        /*  idiv    dst src0 src1 -->
            mov     rax src0
            mov     r9 src1
            cqo
            idiv    r9
            mov     dst rax/rdx     */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        Move move = new Move();
        move.dst = registerConfig.get("rax");
        move.src = ins.src0;
        res.addLast(move);
        Operand src1 = ins.src1;
        if (!(src1 instanceof Register) && !(src1 instanceof Address)) {
            Register reg = registerConfig.get("r9");
            move = new Move();
            move.dst = reg;
            move.src = src1;
            res.addLast(move);
            src1 = reg;
        }
        Nop cqo = new Nop();
        cqo.realName = "cqo";
        res.addLast(cqo);
        ins.src1 = src1;
        res.addLast(ins);
        move = new Move();
        move.dst = ins.dst;
        if (ins.type == Idiv.Type.IDIV) move.src = registerConfig.get("rax");
        else move.src = registerConfig.get("rdx");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> spillCode(MethodCall ins) {
        // ATTENTION: assume no caller
        /*  call t = method(paraList) -->
            store regs
            mov r8 para_i
            mov [rsp -8 -8*i] r8
            call method
            load regs
            mov t rax             */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        int offset;

        offset = 0;
        for (int i = 8; i < registerConfig.numOfAll; ++i) {
            Register reg = registerConfig.get(i);
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offsetNumber = offset;
            offset += 8;
            Move move = new Move();
            move.dst = addr;
            move.src = reg;
            res.addLast(move);
        }

        offset = -24;
        for (Operand para : ins.actualParaVarList) {
            Operand src;
            if (para instanceof Address) {
                src = registerConfig.get("r8");
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
        call.method = ins.method;
        res.addLast(call);

        offset = 0;
        for (int i = 8; i < registerConfig.numOfAll; ++i) {
            Register reg = registerConfig.get(i);
            Address addr = new Address();
            addr.base = registerConfig.get("rsp");
            addr.offsetNumber = offset;
            offset += 8;
            Move move = new Move();
            move.dst = reg;
            move.src = addr;
            res.addLast(move);
        }

        Move move = new Move();
        move.dst = ins.dst;
        move.src = registerConfig.get("rax");
        res.addLast(move);
        return res;
    }

    LinkedList<IRCode> spillCode(Move ins) {
        /*  mov a, b -->
            mov r9, b
            mov a, r9 */
        LinkedList<IRCode> res = new LinkedList<IRCode>();
        if (ins.dst == ins.src) return res;
        if (ins.src instanceof Address && ins.dst instanceof Address) {
            Register r9 = registerConfig.get("r9");
            Move move = new Move();
            move.dst = r9;
            move.src = ins.src;
            res.addLast(move);
            move = new Move();
            move.dst = ins.dst;
            move.src = r9;
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
