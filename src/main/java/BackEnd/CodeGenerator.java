package BackEnd;

import IR.*;
import IRCode.*;
import IRCode.Operand.Operand;
import IRCode.Operand.Variable;

import java.io.*;

public class CodeGenerator {

    BuiltinPrinter builtinPrinter = new BuiltinPrinter();

    public void generateCode(IR ir) throws Exception {
        System.out.println("default rel");
        System.out.println();

        for (MethodEntity method : ir.methodList)
            System.out.println("global " + method.methodName);
        System.out.println();

        for (Variable var : ir.globalVarList)
            System.out.println("global " + var.name);
        System.out.println();

        builtinPrinter.printBuiltin("extern");
        System.out.println();

        System.out.println("SECTION .text\n");
        builtinPrinter.printBuiltin("method");
        for (MethodEntity method : ir.methodList) {
            String methodName = method.methodName;
            if (methodName.equals("string_length") ||
                methodName.equals("string_ord") ||
                methodName.equals("string_parseInt") ||
                methodName.equals("string_substring") ||
                methodName.equals("getInt") ||
                methodName.equals("getString") ||
                methodName.equals("print") ||
                methodName.equals("println") ||
                methodName.equals("toString") ||
                methodName.equals("addString__")) continue;
            System.out.println(methodName + ":");
            for (BasicBlock bb : method.basicBlockList) {
                System.out.println(bb.leadLabel + ":");
                for (IRCode ins : bb.codeList)
                    generateCode(ins);
            }
            System.out.println();
        }

        System.out.println("SECTION .data\talign=8\n");
        for (Variable var : ir.globalVarList) {
            System.out.println(var.name + ":");
            System.out.println("\t\tdq 000000000000000AH");
        }
        System.out.println();

        System.out.println("SECTION .bss\n");
        System.out.println("stringbuffer:\n\t\tresb\t256\n");

        System.out.println("SECTION .rodata\n");
        int strConstCnt = 0;
        for (String strConst : ir.stringConstList) {
            System.out.println("str_const_" + strConstCnt++ + ":");
            System.out.println("\t\tdb " + strConst + ", 00H");
        }
        builtinPrinter.printBuiltin("const_str");
        System.out.println();
    }

    void generateCode(IRCode ins) throws Exception {
        if (ins instanceof Binary) generateCode((Binary)ins);
        else if (ins instanceof Compare) generateCode((Compare)ins);
        else if (ins instanceof Idiv) generateCode((Idiv)ins);
        else if (ins instanceof Jump) generateCode((Jump)ins);
        else if (ins instanceof MethodCall) generateCode((MethodCall)ins);
        else if (ins instanceof Move) generateCode((Move)ins);
        else if (ins instanceof Nop) generateCode((Nop)ins);
        else if (ins instanceof Pop) generateCode((Pop)ins);
        else if (ins instanceof Push) generateCode((Push)ins);
        else if (ins instanceof Return) generateCode((Return)ins);
        else if (ins instanceof Cmove) generateCode((Cmove) ins);
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

    void generateCode(Idiv ins) throws IOException {
        write("idiv", ins.src1, null);
    }

    void generateCode(Jump ins) {
        System.out.println("\t\t" +
            ins.type.toString().toLowerCase() + "\t\t" + ins.targetLabel);
    }

    void generateCode(MethodCall ins) throws IOException {
        System.out.println("\t\tcall\t" + ins.methodName);
    }

    void generateCode(Move ins) throws IOException {
        write("mov", ins.dst, ins.src);
    }

    void generateCode(Nop ins) throws IOException {
        if (ins.realName == null) write("nop", null, null);
        else write(ins.realName, null, null);
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

    void generateCode(Cmove ins) throws IOException {
        write(ins.type.toString().toLowerCase(), ins.dst, ins.src);
    }

    void generateCode(Unary ins) throws IOException {
        write(ins.type.toString().toLowerCase(), ins.dst, null);
    }
}
