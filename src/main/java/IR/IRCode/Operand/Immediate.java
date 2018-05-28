package IR.IRCode.Operand;

import AstNode.*;

import java.util.*;

import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

public class Immediate extends Operand {

    int value;

    public Immediate(ConstantNode node) {
        if (node.exprType.isPrimitiveType(BOOL)) {
            if (node.constantStr.equals("true")) value = 1;
            else value = 0;
        } else value = Integer.parseInt(node.constantStr);
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
