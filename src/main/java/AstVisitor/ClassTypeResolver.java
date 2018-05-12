package AstVisitor;

import AstNode.*;
import ErrorHandler.*;
import Scope.*;

public class ClassTypeResolver extends AstVisitor{

    ToplevelScope toplevelScope;

    public void resolveClassType(ProgramNode prog) throws SemanticException {
        toplevelScope = (ToplevelScope)(prog.scope);
        visit(prog);
    }

    @Override
    void visit(ClassTypeNode node) throws SemanticException {
        String className = node.referenceClassName;
        ClassDefinitionNode classDefinition = toplevelScope.classDefinitionMap.get(className);
        if (classDefinition == null) throw new SemanticException(node.line, "no such class");
        node.referenceClass = classDefinition;
    }
}
