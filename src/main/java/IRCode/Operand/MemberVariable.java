package IRCode.Operand;

import AstNode.*;

import java.util.HashSet;

public class MemberVariable extends Operand {

    public Operand object;
    public DefinitionExpressionNode memberVar;

    @Override
    public HashSet<Variable> colorable() {
        return new HashSet<Variable>();
    }

    @Override
    public String getName() {
        return object.getName() + "." + memberVar.variableName;
    }
}
