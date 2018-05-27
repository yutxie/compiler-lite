package IR.IRCode.Operand;

import AstNode.*;

import java.util.*;

public class Variable extends Operand {

    public boolean global;
    public String name;

    static int tmpCnt = 0;

    public Variable(String name) {
        this.name = name;
    }

    public Variable() {
        this.name = "t" + tmpCnt++;
    }

    @Override
    public HashSet<Variable> colorable() {
        HashSet<Variable> res = new HashSet<Variable>();
        if (!global) res.add(this);
        return res;
    }

    @Override
    public String getName() {
        return "$" + name;
    }
}
