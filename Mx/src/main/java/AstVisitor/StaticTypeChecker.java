package AstVisitor;

import AstNode.*;
import ErrorHandler.*;
import Scope.*;
import AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword;

import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.BOOL;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.INT;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.NULL;

public class StaticTypeChecker extends AstVisitor {

    ToplevelScope toplevelScope;

    public void checkStaticType(ProgramNode prog) throws SemanticException {
        toplevelScope = (ToplevelScope)(prog.scope);
        visit(prog);
    }

    @Override
    public void visit(ReferenceNode node) {
        if (node.referenceType == ReferenceNode.ReferenceType.VARIABLE) {
            node.exprType = ((DefinitionExpressionNode)node.definitionNode).variableType;
            node.leftValue = true;
        }
    }

    @Override
    public void visit(ThisNode node) {
        AstNode classDefinition = node;
        while (!(classDefinition instanceof ClassDefinitionNode)) classDefinition = classDefinition.parent;
        node.exprType = new ClassTypeNode(((ClassDefinitionNode)classDefinition).className);
    }

    @Override
    public void visit(MemberAccessExpressionNode node) throws SemanticException {
        try {
            super.visit(node);
        } catch (SemanticException excpetion) {}
        ClassDefinitionNode classDefinitionNode =
            toplevelScope.classDefinitionMap.get(((ClassTypeNode)(node.caller.exprType)).referenceClassName);
        if (node.member instanceof ReferenceNode) {
            ReferenceNode member = (ReferenceNode)node.member;
            member.referenceType = ReferenceNode.ReferenceType.VARIABLE;
//            if (member.referenceType != ReferenceNode.ReferenceType.VARIABLE)
//                throw new SemanticException(node.line, "member must be a variable reference or method call");
            DefinitionExpressionNode memberVariableDefinition =
                classDefinitionNode.scope.variableDefinitionMap.get(member.referenceName);
            if (memberVariableDefinition == null)
                throw new SemanticException(node.line,
                    "class \"" + classDefinitionNode.className + "\" does not has such a member");
            node.exprType = memberVariableDefinition.variableType;
            node.leftValue = true;
        } else if (node.member instanceof MethodCallExpressionNode) {
            ReferenceNode member = (ReferenceNode)((MethodCallExpressionNode)node.member).caller;
            member.referenceType = ReferenceNode.ReferenceType.METHOD;
//            if (member.referenceType != ReferenceNode.ReferenceType.METHOD)
//                throw new SemanticException(node.line, "member must be a variable reference or method call");
            MethodDefinitionNode memberMethodDefinition =
                classDefinitionNode.scope.methodDefinitionMap.get(member.referenceName);
            if (memberMethodDefinition == null)
                throw new SemanticException(node.line,
                    "class \"" + classDefinitionNode.className + "\" does not has such a member");
            node.exprType = memberMethodDefinition.returnType;
        } else throw new SemanticException(node.line, "member must be a variable reference or method call");
    }

    @Override
    public void visit(IndexAccessExpressionNode node) throws SemanticException {
        super.visit(node);
        if (!(node.caller.exprType instanceof ArrayTypeNode))
            throw new SemanticException(node.line, "the index access caller must be an array");
        if (!(node.index.exprType instanceof PrimitiveTypeNode))
            throw new SemanticException(node.line, "the index must be int");
        if (((PrimitiveTypeNode)(node.index.exprType)).type != INT)
            throw new SemanticException(node.line, "the index must be int");
        node.exprType = ((ArrayTypeNode)node.caller.exprType).innerTypeNode;
        node.leftValue = true;
    }

    @Override
    public void visit(MethodCallExpressionNode node) throws SemanticException {
        super.visit(node);
        if (!(node.caller instanceof ReferenceNode))
            throw new SemanticException(node.line, "caller must be a method reference");
        if (((ReferenceNode)node.caller).referenceType != ReferenceNode.ReferenceType.METHOD)
            throw new SemanticException(node.line, "caller must be a method reference");
        String methodName = ((ReferenceNode)node.caller).referenceName;
        MethodDefinitionNode methodDefinition = toplevelScope.methodDefinitionMap.get(methodName);
        if (methodDefinition == null) throw new SemanticException(node.line, "no such method");
        node.exprType = methodDefinition.returnType;
    }

    @Override
    public void visit(NewExpressionNode node) throws SemanticException {
        super.visit(node);
        node.exprType = node.variableType;
    }

    @Override
    public void visit(UnaryExpressionNode node) throws SemanticException {
        super.visit(node);
        switch (node.op) {
            case PREFIX_DEC: case PREFIX_INC:
                if (!node.inner.leftValue)
                    throw new SemanticException(node.line, "++x must operate on leftValue");
                node.leftValue = true;
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                if (!node.inner.leftValue)
                    throw new SemanticException(node.line, "++x must operate on leftValue");
                break;
        }
        node.exprType = node.inner.exprType;
    }

    @Override
    public void visit(BinaryExpressionNode node) throws SemanticException {
        super.visit(node);
        ExpressionStatementNode lhs = node.lhs;
        ExpressionStatementNode rhs = node.rhs;
        switch (node.op) {
            case ASSIGN:
                if (!lhs.leftValue)
                    throw new SemanticException(node.line, "value must be assign to a leftValue");
                if (lhs.exprType instanceof ArrayTypeNode
                        && rhs.exprType instanceof ArrayTypeNode)
                    if (((ArrayTypeNode)lhs.exprType).contain((ArrayTypeNode)rhs.exprType))
                        lhs.exprType = rhs.exprType;
                node.exprType = lhs.exprType;
                break;
            case EQUAL: case NOTEQUAL:
                if (!lhs.exprType.isPrimitiveType(NULL)
                    && !rhs.exprType.isPrimitiveType(NULL))
                    if (!lhs.exprType.getTypeName().equals(rhs.exprType.getTypeName()))
                        throw new SemanticException(node.line,
                            "binary operator must operate on the same type");
                node.exprType = new PrimitiveTypeNode("bool");
                break;
            case LAND: case LOR:
                if ((!lhs.exprType.isPrimitiveType(BOOL) &&
                     !lhs.exprType.isPrimitiveType(INT)) ||
                    (!rhs.exprType.isPrimitiveType(BOOL) &&
                     !rhs.exprType.isPrimitiveType(INT)))
                    throw new SemanticException(node.line, "lhs and rhs must be int or bool");
                node.exprType = new PrimitiveTypeNode("bool");
                break;
            case GE: case LE: case GT: case LT:
                if (!lhs.exprType.isPrimitiveType(INT) ||
                    !rhs.exprType.isPrimitiveType(INT))
                    throw new SemanticException(node.line, "lhs and rhs must be int");
                node.exprType = new PrimitiveTypeNode("bool");
                break;
            default:
                if (!lhs.exprType.getTypeName().equals(rhs.exprType.getTypeName()))
                    throw new SemanticException(node.line,
                        "binary operator must operate on the same type");
                node.exprType = lhs.exprType;
        }
    }
}
