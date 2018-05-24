package IRCode;

import AstNode.*;
import IRCode.Variable.*;

public class Allocate extends IRCode {

    public Variable lhs;
    public VariableTypeNode variableType;

    @Override
    public void printInformation() {
        System.out.println("allocate " + lhs.id() + " " + variableType.getTypeName());
    }
}
