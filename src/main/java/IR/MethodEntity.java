package IR;

import IR.IRCode.*;
import IR.IRCode.Variable.*;

import java.util.*;

public class MethodEntity {

    public String methodName;
    public LinkedList<Variable> formalParaVarList = new LinkedList<Variable>();
    public LinkedList<IRCode> codeList = new LinkedList<IRCode>();
    public LinkedList<BasicBlock> basicBlockList = new LinkedList<BasicBlock>();

    public void printInformation() {
        System.out.print(methodName + " ");
        for (Variable para : formalParaVarList)
            System.out.print(para.id() + " ");
        System.out.print("{\n");
        if (!basicBlockList.isEmpty())
            for (BasicBlock bb : basicBlockList) {
                System.out.print("\t" + bb.leadLabel + "\n");
                for (IRCode ins : bb.codeList) {
                    System.out.print("\t\t");
                    ins.printInformation();
                }
            }
        else for (IRCode ins : codeList) {
            if (ins.label != null) System.out.print("\t" + ins.label + "\n");
            System.out.print("\t\t");
            ins.printInformation();
        }
        System.out.print("}\n");
    }
}