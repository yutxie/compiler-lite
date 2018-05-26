package FrontEnd;

import AstNode.*;
import Error.*;

public class ClassTypeResolver extends AstVisitor{

    Scope toplevelScope;

    public void resolveClassType(ProgramNode prog) throws Exception {
        toplevelScope = prog.scope;
        visit(prog);
    }

    @Override
    void visit(ClassTypeNode node) throws SemanticException {
        String className = node.referenceClassName;
        ClassDefinitionNode classDefinition =
            toplevelScope.classDefinitionMap.get(className);
        if (classDefinition == null)
            throw new SemanticException(node.line, "no such class");
        node.referenceClass = classDefinition;
    }
}
