package FrontEnd;

import AstNode.*;

public class ThisAppender extends AstVisitor {

    public void appendThis(ProgramNode prog) throws Exception {
        visit(prog);
    }

    @Override
    void visit(MethodDefinitionNode node) {
        if (!(node.parent instanceof ClassTypeNode)) return;
        ClassDefinitionNode classNode = (ClassDefinitionNode) node.parent;
        DefinitionExpressionNode thisVar = new DefinitionExpressionNode();
        thisVar.parent = node;
        thisVar.variableName = "this";
        thisVar.scope = node.scope;
        thisVar.variableType = new ClassTypeNode(classNode.className);
        node.formalArgumentList.add(0, thisVar);
    }
}
