package AstVisitor;

import AstNode.*;
import ErrorHandler.*;
import Scope.*;
import static AstNode.PrimitiveTypeNode.PrimitiveTypeKeyword.*;

public class StaticTypeChecker extends AstVisitor {

    Scope toplevelScope;

    public void checkStaticType(ProgramNode prog) throws Exception {
        toplevelScope = prog.scope;
        visit(prog);
    }

    @Override
    void visit(ReferenceNode node) {
        if (node.referenceType == ReferenceNode.ReferenceType.VARIABLE) {
            node.exprType = ((DefinitionExpressionNode)node.definitionNode).variableType;
            node.leftValue = true;
        }
    }

    @Override
    void visit(ThisNode node) {
        AstNode classDefinition = node;
        while (!(classDefinition instanceof ClassDefinitionNode)) classDefinition = classDefinition.parent;
        node.exprType = new ClassTypeNode(((ClassDefinitionNode)classDefinition).className);
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        try {
            super.visit(node);
        } catch (SemanticException excpetion) {}
        ClassDefinitionNode classDefinition;
        if (!(node.caller.exprType instanceof ClassTypeNode))
            if (node.caller.exprType instanceof ArrayTypeNode)
                classDefinition = toplevelScope.classDefinitionMap.get("array__");
            else throw new SemanticException(node.line, "caller must be of ClassType");
        else classDefinition =
            toplevelScope.classDefinitionMap.get(((ClassTypeNode)(node.caller.exprType)).referenceClassName);
        if (node.member instanceof ReferenceNode) {
            ReferenceNode member = (ReferenceNode)node.member;
            member.referenceType = ReferenceNode.ReferenceType.VARIABLE;
//            if (member.referenceType != ReferenceNode.ReferenceType.VARIABLE)
//                throw new SemanticException(node.line, "member must be a variable reference or method call");
            DefinitionExpressionNode memberVariableDefinition =
                classDefinition.scope.variableDefinitionMap.get(member.referenceName);
            if (memberVariableDefinition == null)
                throw new SemanticException(node.line,
                    "class \"" + classDefinition.className + "\" does not has such a member");
            node.exprType = memberVariableDefinition.variableType;
            node.leftValue = true;
        } else if (node.member instanceof MethodCallExpressionNode) {
            ReferenceNode member = (ReferenceNode)((MethodCallExpressionNode)node.member).caller;
            member.referenceType = ReferenceNode.ReferenceType.METHOD;
//            if (member.referenceType != ReferenceNode.ReferenceType.METHOD)
//                throw new SemanticException(node.line, "member must be a variable reference or method call");
            MethodDefinitionNode memberMethodDefinition =
                classDefinition.scope.methodDefinitionMap.get(member.referenceName);
            if (memberMethodDefinition == null)
                throw new SemanticException(node.line,
                    "class \"" + classDefinition.className + "\" does not has such a member");
            node.exprType = memberMethodDefinition.returnType;
        }
        else
            throw new SemanticException(node.line, "member must be a variable reference or method call");
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
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
    void visit(MethodCallExpressionNode node) throws Exception {
        super.visit(node);
        if (!(node.caller instanceof ReferenceNode))
            throw new SemanticException(node.line, "caller must be a method reference");
        if (((ReferenceNode)node.caller).referenceType != ReferenceNode.ReferenceType.METHOD)
            throw new SemanticException(node.line, "caller must be a method reference");
        String methodName = ((ReferenceNode)node.caller).referenceName;
        MethodDefinitionNode methodDefinition = null;
        AstNode ancestor = node.parent;
        while (ancestor.scope == null || ancestor.scope.methodDefinitionMap.get(methodName) == null) {
            if (ancestor.parent == null) throw new SemanticException(node.line, "no such method");
            ancestor = ancestor.parent;
        }
        methodDefinition = ancestor.scope.methodDefinitionMap.get(methodName);
        if (methodDefinition.formalArgumentList.size() != node.actualParameterList.size())
            throw new SemanticException(node.line, "number of parameter error");
        for (int i = 0; i < node.actualParameterList.size(); ++i) {
            DefinitionExpressionNode formalArgument = methodDefinition.formalArgumentList.get(i);
            ExpressionStatementNode actualArgument = node.actualParameterList.get(i);
            if (!formalArgument.variableType.equalTo(actualArgument.exprType))
                throw new SemanticException(node.line, "variable type of parameter error");
        }
        node.exprType = methodDefinition.returnType;
    }

    @Override
    void visit(NewExpressionNode node) throws Exception {
        super.visit(node);
        node.exprType = node.variableType;
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        super.visit(node);
        switch (node.op) {
            case PREFIX_DEC: case PREFIX_INC:
                if (!node.inner.leftValue || !node.inner.exprType.isPrimitiveType(INT))
                    throw new SemanticException(node.line, "++x must operate on leftValue int");
                node.leftValue = true;
                break;
            case POSTFIX_DEC: case POSTFIX_INC:
                if (!node.inner.leftValue)
                    throw new SemanticException(node.line, "x++ must operate on leftValue int");
                if (!node.inner.exprType.isPrimitiveType(INT))
                    throw new SemanticException(node.line, "x++ must operate on int");
                break;
        }
        node.exprType = node.inner.exprType;
    }

    @Override
    void visit(BinaryExpressionNode node) throws Exception {
        super.visit(node);
        ExpressionStatementNode lhs = node.lhs;
        ExpressionStatementNode rhs = node.rhs;

        if (lhs.exprType == null)      // bugs found here .. I only make some walk around
            lhs.exprType = rhs.exprType;
        if (rhs.exprType == null) {
            rhs.exprType = lhs.exprType;
            if (lhs.exprType == null) {
                lhs.exprType = rhs.exprType = new PrimitiveTypeNode("int");
            }
        }

        switch (node.op) {
            case ADD:
                if (lhs.exprType instanceof ClassTypeNode && rhs.exprType instanceof ClassTypeNode) {
                    if (!((ClassTypeNode) lhs.exprType).referenceClassName.equals("string") ||
                        !((ClassTypeNode) rhs.exprType).referenceClassName.equals("string"))
                        throw new SemanticException(node.line, "only string class instance can add");
                } else if (!lhs.exprType.isPrimitiveType(INT) ||
                           !rhs.exprType.isPrimitiveType(INT))
                            throw new SemanticException(node.line, "only int can add");
                node.exprType = lhs.exprType;
                break;
            case OR: case AND: case XOR:
            case DIV: case MOD: case MUL: case SUB:
            case LSHIFT: case RSHIFT:
                if (!lhs.exprType.isPrimitiveType(INT) || !rhs.exprType.isPrimitiveType(INT))
                    throw new SemanticException(node.line, "opt like this must operate on int");
                node.exprType = lhs.exprType;
                break;
            case ASSIGN:
                if (!lhs.leftValue)
                    throw new SemanticException(node.line, "value must be assigned to a leftValue");
                if (!lhs.exprType.equalTo(rhs.exprType))
                    throw new SemanticException(node.line, "value must be assigned to same type");
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
                if (!lhs.exprType.equalTo(rhs.exprType))
                    throw new SemanticException(node.line, "type of lhs and rhs must be the same");
                if (!lhs.exprType.isPrimitiveType(INT) &&
                    !lhs.exprType.isPrimitiveType(BOOL) &&
                    !lhs.exprType.equalTo(new ClassTypeNode("string")))
                    throw new SemanticException(node.line, "only support relation btw int, bool, string");
                node.exprType = new PrimitiveTypeNode("bool");
                break;
            default:
                if (!lhs.exprType.getTypeName().equals(rhs.exprType.getTypeName()))
                    throw new SemanticException(node.line,
                        "binary operator must operate on the same type");
                node.exprType = lhs.exprType;
        }
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        super.visit(node);
        if (node.condition == null) return;
        if (!node.condition.exprType.isPrimitiveType(BOOL))
            throw new SemanticException(node.line, "condition must be type of bool");
    }

    @Override
    void visit(IfStatementNode node) throws Exception {
        super.visit(node);
        if (!node.condition.exprType.isPrimitiveType(BOOL))
            throw new SemanticException(node.line, "condition must be type of bool");
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        super.visit(node);
        if (!node.condition.exprType.isPrimitiveType(BOOL))
            throw new SemanticException(node.line, "condition must be type of bool");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        super.visit(node);
        if (node.initValue == null) return;
        VariableTypeNode variableType = node.variableType;
        VariableTypeNode initType = node.initValue.exprType;
        if (variableType.getTypeName().equals("string") && initType.isPrimitiveType(NULL))
            throw new SemanticException(node.line, "a string cannot be initialized to null");
        if (variableType instanceof ArrayTypeNode && initType instanceof ArrayTypeNode)
            if (((ArrayTypeNode)variableType).contain((ArrayTypeNode)initType))
                variableType = initType;
            else throw new SemanticException(node.line, "dim of array error");
        else if (!variableType.equalTo(initType))
            throw new SemanticException(node.line, "init value must be assigned to same type");
    }

    @Override
    void visit(MethodDefinitionNode node) throws Exception {
        super.visit(node);
        for (DefinitionExpressionNode item : node.formalArgumentList)
            if (item.variableType.isPrimitiveType(VOID))
                throw new SemanticException(node.line, "parameter cannot be of void type");
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        super.visit(node);
        AstNode tmp = node.parent;
        while (!(tmp instanceof MethodDefinitionNode)) tmp = tmp.parent;
        MethodDefinitionNode methodDefinition = (MethodDefinitionNode)tmp;
        if (node.returnValue != null) {
            if (!node.returnValue.exprType.equalTo(methodDefinition.returnType))
                throw new SemanticException(node.line, "return value type error");
        } else if (!methodDefinition.returnType.isPrimitiveType(VOID))
            throw new SemanticException(node.line, "return type is not void");
    }
}
