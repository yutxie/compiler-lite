package IR;

import IR.IRCode.*;
import IR.IRCode.Operand.Variable;

import java.util.*;

public class BasicBlock {

    public String leadLabel;
    public LinkedList<IRCode> codeList = new LinkedList<IRCode>();
    public LinkedList<BasicBlock> predecessorList = new LinkedList<BasicBlock>();
    public LinkedList<BasicBlock> successorList = new LinkedList<BasicBlock>();
    public HashSet<Variable> def = new HashSet<Variable>();
    public HashSet<Variable> use = new HashSet<Variable>();
    public HashSet<Variable> liveIn = new HashSet<Variable>();
    public HashSet<Variable> liveOut = new HashSet<Variable>();

    public BasicBlock(String leadLabel) {
        this.leadLabel = leadLabel;
    }
}
