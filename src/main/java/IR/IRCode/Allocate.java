package IR.IRCode;

import AstNode.*;
import IR.IRCode.Operand.*;

public class Allocate extends IRCode {

    public Operand lhs;
    public VariableTypeNode variableType;

    @Override
    public void printInformation() {
        System.out.println("allocate " + lhs.getName() + " " + variableType.getTypeName());
    }
}
