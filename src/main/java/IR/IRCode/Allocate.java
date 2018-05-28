package IR.IRCode;

import AstNode.*;
import IR.IRCode.Operand.*;

public class Allocate extends IRCode {

    public Operand dst;
    public VariableTypeNode variableType;

    @Override
    public void printInformation() {
        System.out.println("allocate\t" + dst.getName() + " " + variableType.getTypeName());
    }
}
