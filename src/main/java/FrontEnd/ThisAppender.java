package FrontEnd;

import AstNode.*;
import Error.*;

public class ThisAppender extends AstVisitor {

    public void appendThis(ProgramNode prog) throws Exception {
        visit(prog);
    }

    @Override
    void visit(MethodDefinitionNode node) throws SemanticException {
        if (!(node.parent instanceof ClassDefinitionNode)) return;
        ClassDefinitionNode classNode = (ClassDefinitionNode) node.parent;
        DefinitionExpressionNode thisVar = new DefinitionExpressionNode();
        thisVar.parent = node;
        thisVar.variableName = "this";
        thisVar.scope = node.scope;
        thisVar.scope.define(thisVar);
        thisVar.variableType = new ClassTypeNode(classNode.className);
        node.formalArgumentList.add(0, thisVar);
    }
}
