package IRCode;

import AstNode.*;

public class Allocate extends IRCode {

    public Register lhs;
    public VariableTypeNode variableType;

    @Override
    public void printInformation() {
        System.out.println("allocate " + lhs.id() + " " + variableType.getTypeName());
    }
}
