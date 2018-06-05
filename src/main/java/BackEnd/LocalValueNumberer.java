package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.*;

import java.util.*;

public class LocalValueNumberer {

    int valueCnt = 0;
    class Value {
        int valueIndex;
        Value() {
            valueIndex = valueCnt++;
        }
    }

    enum InstType {
        ADD, SUB, IMUL,
        XOR, OR, AND,
        SAL, SAR,
        IDIV, IMOD,
        INC, DEC, NEG, NOT
    }
    class Pair {

        InstType type;
        Value src0;
        Value src1;

        public Pair(InstType type, Value src0, Value src1) {
            switch (type) {
                case ADD: case IMUL: case OR: case AND: case XOR:
                    if (src0.valueIndex > src1.valueIndex) {
                        Value t = src1;
                        src1 = src0;
                        src0 = t;
                    }
            }
            this.type = type;
            this.src0 = src0;
            this.src1 = src1;
        }

        @Override
        public int hashCode() {
            int src1ValueIndex = src1 == null ? 999 : src1.valueIndex;
            return type.ordinal() * 1000000 + src0.valueIndex * 1000 + src1ValueIndex;
        }

        @Override
        public boolean equals(Object other) {
            if(other instanceof Pair) {
                Pair a = this;
                Pair b = (Pair) other;
                if (a.type.ordinal() != b.type.ordinal()) return false;
                if (a.src0.valueIndex != b.src0.valueIndex) return false;
                if (a.src1 == null) return b.src1 == null;
                if (b.src1 == null) return false;
                return a.src1.valueIndex == b.src1.valueIndex;
            }
            else return false;
        }
    }

    HashMap<Operand, Value> varToValueMap = new HashMap<Operand, Value>();
    HashMap<Integer, Value> immToValueMap = new HashMap<Integer, Value>();
    HashMap<Pair, Value> pairToValueMap = new HashMap<Pair, Value>();
    HashMap<Value, HashSet<Variable>> valueToVarMap = new HashMap<Value, HashSet<Variable>>();
    HashMap<Value, Integer> valueToImmMap = new HashMap<Value, Integer>();

    public void numberLocalValue(IR ir) throws Exception {
        for (MethodEntity method : ir.methodList)
            if (method.methodName.equals("main")) // ATTENTION
            for (BasicBlock bb : method.basicBlockList)
                numberLocalValue(bb);
    }

    LinkedList<IRCode> codeList;
    void numberLocalValue(BasicBlock bb) throws Exception {
        valueCnt = 0;
        varToValueMap.clear();
        pairToValueMap.clear();
        immToValueMap.clear();
        valueToVarMap.clear();
        valueToImmMap.clear();
        codeList = new LinkedList<IRCode>();
        for (IRCode ins : bb.codeList)
            numberLocalValue(ins);
        bb.codeList = codeList;
    }

    void numberLocalValue(IRCode ins) throws Exception {
        if (ins instanceof Allocate) numberLocalValue((Allocate)ins);
        else if (ins instanceof Binary) numberLocalValue((Binary)ins);
        else if (ins instanceof Cmove) numberLocalValue((Cmove)ins);
        else if (ins instanceof Compare) numberLocalValue((Compare)ins);
        else if (ins instanceof Idiv) numberLocalValue((Idiv)ins);
        else if (ins instanceof Jump) codeList.addLast(ins);
        else if (ins instanceof MethodCall) numberLocalValue((MethodCall)ins);
        else if (ins instanceof Move) numberLocalValue((Move)ins);
        else if (ins instanceof Nop) codeList.addLast(ins);
        else if (ins instanceof Return) numberLocalValue((Return)ins);
        else if (ins instanceof Unary) numberLocalValue((Unary)ins);
        else throw new Exception();
    }

    Value getValue(Pair pair) {
        Value value = pairToValueMap.get(pair);
        if (value == null) value = defineNewValue(pair);
        return value;
    }

    Value getValue(Immediate imm) {
        Value value = immToValueMap.get(imm.value);
        if (value == null) value = defineNewValue(imm);
        return value;
    }

    Value getValue(Operand operand) {
        if (operand instanceof Immediate) return getValue((Immediate)operand);
        Value value = varToValueMap.get(operand);
        if (value == null) value = defineNewValue(operand);
        return value;
    }

    Immediate getImm(Value value) {
        Integer imm = valueToImmMap.get(value);
        if (imm == null) return null;
        else return new Immediate(imm);
    }

    Operand getVar(Value value) {
        Immediate imm = getImm(value);
        if (imm != null) return imm;
        HashSet<Variable> varSet = valueToVarMap.get(value);
        if (varSet.isEmpty()) return null;
        else return varSet.iterator().next();
    }

    Operand getVar(Operand operand) {
        Value value = getValue(operand);
        Operand res = getVar(value);
        if (res == null) return operand;
        else return res;
    }

    void linkVarAndValue(Operand operand, Value value) {
        if (operand instanceof Immediate) {
            Immediate imm = (Immediate) operand;
            immToValueMap.put(imm.value, value);
            valueToImmMap.put(value, imm.value);
        } else if (operand instanceof Variable) {
            Variable var = (Variable) operand;
            Value oldValue = varToValueMap.get(var);
            if (oldValue != null) {
                HashSet<Variable> oldVarSet = valueToVarMap.get(oldValue);
                oldVarSet.remove(var);
            }
            valueToVarMap.get(value).add(var);
            varToValueMap.put(var, value);
        } else varToValueMap.put(operand, value);
    }

    Value defineNewValue(Pair pair) {
        Value value = new Value();
        valueToVarMap.put(value, new HashSet<Variable>());
        pairToValueMap.put(pair, value);
        return value;
    }

    Value defineNewValue(Operand operand) {
        Value value = new Value();
        valueToVarMap.put(value, new HashSet<Variable>());
        linkVarAndValue(operand, value);
        return value;
    }

    void numberLocalValue(Allocate ins) {
        ins.size = getVar(ins.size);
        defineNewValue(ins.dst);
        codeList.addLast(ins);
    }

    InstType getInstType(Binary ins) throws Exception {
        switch (ins.type) {
            case ADD: return InstType.ADD;
            case SUB: return InstType.SUB;
            case XOR: return InstType.XOR;
            case AND: return InstType.AND;
            case OR: return InstType.OR;
            case IMUL: return InstType.IMUL;
            case SAL: return InstType.SAL;
            case SAR: return InstType.SAR;
            default: throw new Exception();
        }
    }

    void numberLocalValue(Binary ins) throws Exception {
        ins.src = getVar(ins.src);
        Pair pair = new Pair(getInstType(ins), getValue(ins.dst), getValue(ins.src));
        Value value = getValue(pair);
        Operand operand = getVar(value);
        if (operand != null) {
            Move move = new Move();
            move.dst = ins.dst;
            move.src = operand;
            codeList.addLast(move);
        } else codeList.addLast(ins);
        linkVarAndValue(ins.dst, value);
    }

    void numberLocalValue(Cmove ins) {
        ins.src = getVar(ins.src);
        defineNewValue(ins.dst); // special for conditional move
        codeList.addLast(ins);
    }

    void numberLocalValue(Compare ins) {
        ins.src0 = getVar(ins.src0);
        ins.src1 = getVar(ins.src1);
        codeList.addLast(ins);
    }

    InstType getInstType(Idiv ins) throws Exception {
        switch (ins.type) {
            case IDIV: return InstType.IDIV;
            case IMOD: return InstType.IMOD;
            default: throw new Exception();
        }
    }

    void numberLocalValue(Idiv ins) throws Exception {
        ins.src0 = getVar(ins.src0);
        ins.src1 = getVar(ins.src1);
        Pair pair = new Pair(getInstType(ins), getValue(ins.src0), getValue(ins.src1));
        Value value =  getValue(pair);
        Operand operand = getVar(value);
        if (operand != null) {
            Move move = new Move();
            move.dst = ins.dst;
            move.src = operand;
            codeList.addLast(move);
        } else codeList.addLast(ins);
        linkVarAndValue(ins.dst, value);
    }

    void numberLocalValue(MethodCall ins) {
        LinkedList<Operand> newParaList = new LinkedList<Operand>();
        for (Operand para : ins.actualParaVarList)
            newParaList.addLast(getVar(para));
        ins.actualParaVarList = newParaList;
        codeList.addLast(ins);
        defineNewValue(ins.dst); // ATTENTION: optimization
    }

    void numberLocalValue(Move ins) {
        ins.src = getVar(ins.src);
        codeList.addLast(ins);
        linkVarAndValue(ins.dst, getValue(ins.src));
    }

    void numberLocalValue(Return ins) {
        if (ins.src != null)
            ins.src = getVar(ins.src);
        codeList.addLast(ins);
    }

    InstType getInstType(Unary ins) throws Exception {
        switch (ins.type) {
            case NOT: return InstType.NOT;
            case INC: return InstType.INC;
            case DEC: return InstType.DEC;
            case NEG: return InstType.NEG;
            default: throw new Exception();
        }
    }

    void numberLocalValue(Unary ins) throws Exception {
        Pair pair = new Pair(getInstType(ins), getValue(ins.dst), null);
        Value value = getValue(pair);
        Operand operand = getVar(value);
        if (operand != null) {
            Move move = new Move();
            move.dst = ins.dst;
            move.src = operand;
            codeList.addLast(move);
        } else codeList.addLast(ins);
        linkVarAndValue(ins.dst, value);
    }
}
