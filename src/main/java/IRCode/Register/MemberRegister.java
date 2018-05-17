package IRCode.Register;

import AstNode.*;

public class MemberRegister extends Register {

    public Register object;
    public DefinitionExpressionNode memberVar;

    @Override
    public String id() {
        return String.valueOf(object.hashCode()) + "." + memberVar.variableName;
    }
}
