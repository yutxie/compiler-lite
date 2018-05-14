package IRCode;

import AstNode.*;

public class MemberAcess extends IRCode {

    public Register lhs;
    public Register callerReg;
    public DefinitionExpressionNode memberVar;

    @Override
    public void printInformation() {
        System.out.println("member " + lhs.id() + " " +
            callerReg.id() + " " + memberVar.variableName);
    }
}
