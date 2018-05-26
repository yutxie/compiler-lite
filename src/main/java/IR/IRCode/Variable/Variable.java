package IR.IRCode.Variable;

import AstNode.*;

import java.util.HashSet;

public class Variable {

    public boolean global = false;
    public ConstantNode initValue;
    public String name;

    static int tmpCnt = 0;

    public Variable(String name) {
        this.name = name;
    }

    public HashSet<Variable> colorable() {
        HashSet<Variable> res = new HashSet<Variable>();
        if (!global) res.add(this);
        return res;
    }

    public Variable() {
        this.name = "t" + tmpCnt++;
    }

    public String id() {
        if (initValue == null) return "$" + name;
        else return "($" + name + "=" + initValue.constantStr + ")";
    }
}
