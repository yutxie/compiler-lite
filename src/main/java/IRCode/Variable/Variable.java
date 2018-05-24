package IRCode.Variable;

import AstNode.*;

public class Variable {

    public boolean global = false;
    public ConstantNode initValue;
    public String name;

    static int tmpCnt = 0;

    public Variable(String name) {
        this.name = name;
    }

    public Variable() {
        this.name = String.valueOf(tmpCnt++);
    }

    public String id() {
        return name;
    }
}
