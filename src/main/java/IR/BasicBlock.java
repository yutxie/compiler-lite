package IR;

import IRCode.*;
import IRCode.Operand.Variable;

import java.util.*;

public class BasicBlock {

    public String leadLabel;
    public LinkedList<IRCode> codeList = new LinkedList<IRCode>();
    public HashSet<BasicBlock> predecessorSet = new HashSet<BasicBlock>();
    public HashSet<BasicBlock> successorSet = new HashSet<BasicBlock>();
    public HashSet<Variable> def = new HashSet<Variable>();
    public HashSet<Variable> use = new HashSet<Variable>();
    public HashSet<Variable> liveIn = new HashSet<Variable>();
    public HashSet<Variable> liveOut = new HashSet<Variable>();

    public BasicBlock(String leadLabel) {
        this.leadLabel = leadLabel;
    }

    public void printInformation() {
        System.out.print("\t" + leadLabel + "\n");
        for (IRCode ins : codeList) {
            System.out.print("\t\t");
            ins.printInformation();
        }
    }
}
