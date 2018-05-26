package IR.IRCode;

import IR.IRCode.Variable.*;

import java.util.*;

public abstract class IRCode {

    public String label;
    public HashSet<Variable> def = new HashSet<Variable>();
    public HashSet<Variable> use = new HashSet<Variable>();
    public HashSet<Variable> liveIn;
    public HashSet<Variable> liveOut;

    public abstract void printInformation();
}
