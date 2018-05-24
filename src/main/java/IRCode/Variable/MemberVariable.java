package IRCode.Variable;

import AstNode.*;

public class MemberVariable extends Variable {

    public Variable object;
    public DefinitionExpressionNode memberVar;

    public MemberVariable(String name) {
        super(name);
    }

    public MemberVariable() {
        super();
    }

    @Override
    public String id() {
        return object.id() + "." + memberVar.variableName;
    }
}
