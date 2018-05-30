package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.Operand;

import java.io.*;

public class CodeGenerator {

    public void generateCode(IR ir) throws Exception {
        System.out.print("default rel\n\n");
        for (MethodEntity method : ir.methodList)
            System.out.print("global " + method.methodName + "\n");
        System.out.print("\n");

        System.out.print("extern malloc\n");
        System.out.print("\n");

        System.out.print("SECTION .text\n\n");
        for (MethodEntity method : ir.methodList) {
            System.out.print(method.methodName + ":\n");
            for (BasicBlock bb : method.basicBlockList) {
                System.out.print(bb.leadLabel + ":\n");
                for (IRCode ins : bb.codeList)
                    generateCode(ins);
            }
            System.out.print("\n");
        }

        System.out.print("SECTION .data\n\n");

        System.out.print("SECTION .bbs\n\n");
    }

    void generateCode(IRCode ins) throws Exception {
        if (ins instanceof Binary) generateCode((Binary)ins);
        else if (ins instanceof Compare) generateCode((Compare)ins);
        else if (ins instanceof Jump) generateCode((Jump)ins);
        else if (ins instanceof MethodCall) generateCode((MethodCall)ins);
        else if (ins instanceof Move) generateCode((Move)ins);
        else if (ins instanceof Nop) generateCode((Nop)ins);
        else if (ins instanceof Pop) generateCode((Pop)ins);
        else if (ins instanceof Push) generateCode((Push)ins);
        else if (ins instanceof Return) generateCode((Return)ins);
        else if (ins instanceof Set) generateCode((Set)ins);
        else if (ins instanceof Unary) generateCode((Unary)ins);
        else throw new Exception();
    }

    void write(String opt, Operand opr0, Operand opr1) throws IOException {
        System.out.print("\t\t" + opt);
        if (opr0 != null)
            System.out.print("\t\t" + opr0.getName());
        if (opr1 != null)
            System.out.print(", " + opr1.getName());
        System.out.print("\n");
    }

    void generateCode(Binary ins) throws IOException {
        write(ins.type.toString().toLowerCase(), ins.dst, ins.src);
    }

    void generateCode(Compare ins) throws IOException {
        write("cmp", ins.src0, ins.src1);
    }

    void generateCode(Jump ins) {
        System.out.print("\t\t" +
            ins.type.toString().toLowerCase() + "\t\t" + ins.targetLabel + "\n");
    }

    void generateCode(MethodCall ins) throws IOException {
        System.out.print("\t\tcall\t" + ins.method.methodName + "\n");
    }

    void generateCode(Move ins) throws IOException {
        write("mov", ins.dst, ins.src);
    }

    void generateCode(Nop ins) throws IOException {
        write("nop", null, null);
    }

    void generateCode(Pop ins) throws IOException {
        write("pop", ins.dst, null);
    }

    void generateCode(Push ins) throws IOException {
        write("push", ins.src, null);
    }

    void generateCode(Return ins) throws IOException {
        write("ret", null, null);
    }

    void generateCode(Set ins) throws IOException {
        write(ins.type.toString().toLowerCase(), ins.dst, null);
    }

    void generateCode(Unary ins) throws IOException {
        write(ins.type.toString().toLowerCase(), ins.dst, null);
    }
}
