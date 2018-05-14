package IRCode;

import AstNode.*;

public class MemberAcess extends IRCode {

    public Register lhs;
    public Register callerReg;
    public DefinitionExpressionNode memberVar;
}
