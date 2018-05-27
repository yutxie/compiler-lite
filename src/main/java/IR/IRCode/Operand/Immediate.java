package IR.IRCode.Operand;

import AstNode.*;

import java.util.*;

public class Immediate extends Operand {

    int value;

    public Immediate(ConstantNode node) {
        value = Integer.parseInt(node.constantStr);
    }

    public Immediate(int value) {
        this.value = value;
    }

    @Override
    public HashSet<Variable> colorable() {
        return new HashSet<Variable>();
    }

    @Override
    public String getName() {
        return String.valueOf(value);
    }
}
