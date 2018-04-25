package AstBuilder;

import AstNode.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.lang.*;
import java.io.*;

public class AstBuilder extends MxBaseVisitor<AstNode> {

    @Override public AstNode visitProgram(MxParser.ProgramContext context) {
        ProgramNode res = new ProgramNode();
        res.line = context.start.getLine();
        for (ParseTree item : context.children) {
            AstNode node = visit(item);
            res.childrenList.add(node);
            if (item instanceof MxParser.ClassDefinitionContext)
                res.classDefinitionList.add((ClassDefinitionNode)node);
            else if (item instanceof MxParser.MethodDefinitionContext)
                res.methodDefinitionList.add((MethodDefinitionNode)node);
            else res.variableDefinitionList.add((DefinitionExpressionNode)node);
        }
        return res;
    }

    @Override public AstNode visitClassDefinition(MxParser.ClassDefinitionContext context) {
        ClassDefinitionNode res = new ClassDefinitionNode();
        res.line = context.start.getLine();
        res.className = context.Identifier().getText();
        for (MxParser.MemberVariableContext item : context.memberVariable())
            res.memberVariableList.add((DefinitionExpressionNode)visit(item));
        for (MxParser.MethodDefinitionContext item : context.methodDefinition())
            res.memberMethodList.add((MethodDefinitionNode)visit(item));
        for (MxParser.ConstructionMethodDefinitionContext item : context.constructionMethodDefinition()) 
            res.memberConstructionMethodList.add((MethodDefinitionNode)visit(item));
        return res;
    }

    @Override public AstNode visitMemberVariable(MxParser.MemberVariableContext context) {
        DefinitionExpressionNode res = new DefinitionExpressionNode();
        res.line = context.start.getLine();
        res.variableType = (VariableTypeNode)visit(context.variableType());
        res.variableName = context.Identifier().getText();
        res.initValue = null;
        return res;
    }

    @Override public AstNode visitConstructionMethodDefinition(MxParser.ConstructionMethodDefinitionContext context) {
        MethodDefinitionNode res = new MethodDefinitionNode();
        res.line = context.start.getLine();
        res.returnType = new ClassTypeNode((ReferenceNode)visit(context.Identifier()));
        res.methodName = context.Identifier().getText();
        for (MxParser.FormalParameterContext item : context.formalParameterList().formalParameter())
            res.formalArgumentList.add((DefinitionExpressionNode)visit(item));
        res.block = (BlockNode)visit(context.block());
        return res;
    }

    @Override public AstNode visitMethodDefinition(MxParser.MethodDefinitionContext context) {
        MethodDefinitionNode res = new MethodDefinitionNode();
        res.line = context.start.getLine();
        res.returnType = (VariableTypeNode)visit(context.variableType());
        res.methodName = context.Identifier().getText();
        if (context.formalParameterList() != null)
        for (MxParser.FormalParameterContext item : context.formalParameterList().formalParameter())
            res.formalArgumentList.add((DefinitionExpressionNode)visit(item));
        res.block = (BlockNode)visit(context.block());
        return res;
    }
    
    @Override public AstNode visitFormalParameter(MxParser.FormalParameterContext context) {
        DefinitionExpressionNode res = new DefinitionExpressionNode();
        res.line = context.start.getLine();
        res.variableType = (VariableTypeNode)visit(context.variableType());
        res.variableName = context.Identifier().getText();
        res.initValue = null;
        return res;
    }

    @Override public AstNode visitBlock(MxParser.BlockContext context) {
        BlockNode res = new BlockNode();
        res.line = context.start.getLine();
        for (MxParser.StatementContext item : context.statement())
            res.statementList.add((StatementNode)visit(item));
        return res;
    }

    @Override public AstNode visitBlockOrStatement(MxParser.BlockOrStatementContext context) {
        if (context.block() != null) return (BlockNode)visit(context.block());
        BlockNode res = new BlockNode();
        res.line = context.start.getLine();
        res.statementList.add((StatementNode)visit(context.statement()));
        return res;
    }

    @Override public AstNode visitDefinitionStat(MxParser.DefinitionStatContext context) {
        return (DefinitionExpressionNode)visit(context.definitionStatement().definitionExpression());
    }

    @Override public AstNode visitExpressionStat(MxParser.ExpressionStatContext context) {
        return (ExpressionStatementNode)visit(context.expression());
    }

    @Override public AstNode visitIfStat(MxParser.IfStatContext context) {
        IfStatementNode res = new IfStatementNode();
        res.line = context.start.getLine();
        res.condition = (ExpressionStatementNode)visit(context.expression());
        res.ifBlock = (BlockNode)visit(context.blockOrStatement(0));
        if (context.ELSE() == null) res.elseBlock = null;
        else res.elseBlock = (BlockNode)visit(context.blockOrStatement(1));
        return res;
    }

    @Override public AstNode visitForStat(MxParser.ForStatContext context) {
        ForStatementNode res = new ForStatementNode();
        res.line = context.start.getLine();
        if (context.init == null) res.init = null;
        else res.init = (ExpressionStatementNode)visit(context.init);
        if (context.condition == null) res.condition = null;
        else res.condition = (ExpressionStatementNode)visit(context.condition);
        if (context.after_block == null) res.afterBlock = null;
        else res.afterBlock = (ExpressionStatementNode)visit(context.after_block);
        res.block = (BlockNode)visit(context.blockOrStatement());
        return res;
    }

    @Override public AstNode visitWhileStat(MxParser.WhileStatContext context) {
        WhileStatementNode res = new WhileStatementNode();
        res.line = context.start.getLine();
        res.condition = (ExpressionStatementNode)visit(context.expression());
        res.block = (BlockNode)visit(context.blockOrStatement());
        return res;
    }

    @Override public AstNode visitReturnStat(MxParser.ReturnStatContext context) {
        ReturnStatementNode res = new ReturnStatementNode();
        res.line = context.start.getLine();
        if (context.expression() == null) res.returnValue = null;
        else res.returnValue = (ExpressionStatementNode)visit(context.expression());
        return res;
    }

    @Override public AstNode visitBreakStat(MxParser.BreakStatContext context) {
        BreakStatementNode res = new BreakStatementNode();
        res.line = context.start.getLine();
        return res;
    }

    @Override public AstNode visitContinueStat(MxParser.ContinueStatContext context) {
        ContinueStatementNode res = new ContinueStatementNode();
        res.line = context.start.getLine();
        return res;
    }

    @Override public AstNode visitEmptyStat(MxParser.EmptyStatContext context) {
        EmptyStatementNode res = new EmptyStatementNode();
        res.line = context.start.getLine();
        return res;
    }

    @Override public AstNode visitDefinitionStatement(MxParser.DefinitionStatementContext context) {
        return (DefinitionExpressionNode)visit(context.definitionExpression());
    }

    @Override public AstNode visitConstantExpr(MxParser.ConstantExprContext context) {
        ConstantNode res = new ConstantNode();
        res.line = context.start.getLine();
        res.constantStr = context.getText();
        if (context.constant().LogicConstant() != null)
            res.exprType = new PrimitiveTypeNode("bool");
        if (context.constant().IntegerConstant() != null)
            res.exprType = new PrimitiveTypeNode("int");
        if (context.constant().StringConstant() != null)
            res.exprType = new PrimitiveTypeNode("string");
        if (context.constant().NullConstant() != null)
            res.exprType = new PrimitiveTypeNode("null");
        return res;
    }

    @Override public AstNode visitThisExpr(MxParser.ThisExprContext context) {
        ThisNode res = new ThisNode();
        res.line = context.start.getLine();
        return res;
    }

    @Override public AstNode visitMemberAccessExpr(MxParser.MemberAccessExprContext context) {
        MemberAccessExpressionNode res = new MemberAccessExpressionNode();
        res.line = context.start.getLine();
        res.caller = (ExpressionStatementNode)visit(context.caller);
        res.member = (ExpressionStatementNode)visit(context.member);
        return res;
    }

    @Override public AstNode visitIndexAccessExpr(MxParser.IndexAccessExprContext context) {
        IndexAccessExpressionNode res = new IndexAccessExpressionNode();
        res.line = context.start.getLine();
        res.caller = (ExpressionStatementNode)visit(context.caller);
        res.index = (ExpressionStatementNode)visit(context.index);
        return res;
    }

    @Override public AstNode visitMethodCallExpr(MxParser.MethodCallExprContext context) {
        MethodCallExpressionNode res = new MethodCallExpressionNode();
        res.line = context.start.getLine();
        res.caller = (ExpressionStatementNode)visit(context.caller);
        if (context.actualParameterList() != null)
        for (MxParser.ExpressionContext item : context.actualParameterList().expression())
            res.actualParameterList.add((ExpressionStatementNode)visit(item));
        return res;
    }

    @Override public AstNode visitParensExpr(MxParser.ParensExprContext context) {
        return (ExpressionStatementNode)visit(context.expression());
    }

    @Override public AstNode visitNewExpr(MxParser.NewExprContext context) {
        NewExpressionNode res = new NewExpressionNode();
        res.line = context.start.getLine();
        res.variableType = (VariableTypeNode)visit(context.creator().variableType());
        if (context.creator().actualParameterList() != null)
        for (MxParser.ExpressionContext item : context.creator().actualParameterList().expression())
            res.actualParameterList.add((ExpressionStatementNode)visit(item));
        return res;
    }

    @Override public AstNode visitUnaryExpr(MxParser.UnaryExprContext context) {
        UnaryExpressionNode res = new UnaryExpressionNode();
        res.line = context.start.getLine();
        if (context.prefix != null) {
            switch (context.prefix.getType()) {
                case MxLexer.INC: res.op = UnaryExpressionNode.UnaryOp.PREFIX_INC; break;
                case MxLexer.DEC: res.op = UnaryExpressionNode.UnaryOp.PREFIX_DEC; break;
                case MxLexer.ADD: return (ExpressionStatementNode)visit(context.expression());
                case MxLexer.SUB: res.op = UnaryExpressionNode.UnaryOp.NEGATE; break;
                case MxLexer.NOT: res.op = UnaryExpressionNode.UnaryOp.NOT; break;
                case MxLexer.LNOT: res.op = UnaryExpressionNode.UnaryOp.LNOT; break;
            }
        } else if (context.postfix != null) {
            switch (context.postfix.getType()) {
                case MxLexer.INC: res.op = UnaryExpressionNode.UnaryOp.POSTFIX_INC; break;
                case MxLexer.DEC: res.op = UnaryExpressionNode.UnaryOp.POSTFIX_DEC; break;
            }
        }
        res.inner = (ExpressionStatementNode)visit(context.expression());
        return res;
    }

    @Override public AstNode visitBinaryExpr(MxParser.BinaryExprContext context) {
        BinaryExpressionNode res = new BinaryExpressionNode();
        res.line = context.start.getLine();
        switch (context.op.getType()) {
            case MxLexer.MUL: res.op = BinaryExpressionNode.BinaryOp.MUL; break;
            case MxLexer.DIV: res.op = BinaryExpressionNode.BinaryOp.DIV; break;
            case MxLexer.MOD: res.op = BinaryExpressionNode.BinaryOp.MOD; break;
            case MxLexer.ADD: res.op = BinaryExpressionNode.BinaryOp.ADD; break;
            case MxLexer.SUB: res.op = BinaryExpressionNode.BinaryOp.SUB; break;
            case MxLexer.LSHIFT: res.op = BinaryExpressionNode.BinaryOp.LSHIFT; break;
            case MxLexer.RSHIFT: res.op = BinaryExpressionNode.BinaryOp.RSHIFT; break;
            case MxLexer.LE: res.op = BinaryExpressionNode.BinaryOp.LE; break;
            case MxLexer.GE: res.op = BinaryExpressionNode.BinaryOp.GE; break;
            case MxLexer.LT: res.op = BinaryExpressionNode.BinaryOp.LT; break;
            case MxLexer.GT: res.op = BinaryExpressionNode.BinaryOp.GT; break;
            case MxLexer.EQUAL: res.op = BinaryExpressionNode.BinaryOp.EQUAL; break;
            case MxLexer.NOTEQUAL: res.op = BinaryExpressionNode.BinaryOp.NOTEQUAL; break;
            case MxLexer.AND: res.op = BinaryExpressionNode.BinaryOp.AND; break;
            case MxLexer.XOR: res.op = BinaryExpressionNode.BinaryOp.XOR; break;
            case MxLexer.OR: res.op = BinaryExpressionNode.BinaryOp.OR; break;
            case MxLexer.LAND: res.op = BinaryExpressionNode.BinaryOp.LAND; break;
            case MxLexer.LOR: res.op = BinaryExpressionNode.BinaryOp.LOR; break;
            case MxLexer.ASSIGN: res.op = BinaryExpressionNode.BinaryOp.ASSIGN; break;
        }
        res.lhs = (ExpressionStatementNode)visit(context.lhs);
        res.rhs = (ExpressionStatementNode)visit(context.rhs);
        return res;
    }

    @Override public AstNode visitDefinitionExpr(MxParser.DefinitionExprContext context) {
        return (DefinitionExpressionNode)visit(context.definitionExpression());
    }

    @Override public AstNode visitDefinitionExpression(MxParser.DefinitionExpressionContext context) {
        DefinitionExpressionNode res = new DefinitionExpressionNode();
        res.line = context.start.getLine();
        res.variableType = (VariableTypeNode)visit(context.variableType());
        res.variableName = context.Identifier().getText();
        if (context.expression() == null) res.initValue = null;
        else res.initValue = (ExpressionStatementNode)visit(context.expression());
        return res;
    }

    @Override
    public AstNode visitIdentifierExpr(MxParser.IdentifierExprContext context) {
        ReferenceNode res = new ReferenceNode(context.getText());
        res.line = context.start.getLine();
        return res;
    }

    @Override
    public AstNode visitArrayVariableType(MxParser.ArrayVariableTypeContext context) {
        ArrayTypeNode res = new ArrayTypeNode();
        res.line = context.start.getLine();
        if (context.Identifier() != null)
            res.nonArrayTypeNode = new ClassTypeNode((ReferenceNode)visit(context.Identifier()));
        else res.nonArrayTypeNode = new PrimitiveTypeNode(context.primitiveType().getText());
        res.dim = context.arrayCreatorRest().LBRACK().size();
        for (TerminalNode item : context.arrayCreatorRest().IntegerConstant())
            res.dimList.addLast(new Integer(item.getText()));
        res.dimStr = context.arrayCreatorRest().getText();
        return res;
    }

    ReferenceNode visitIdentifierTerminalNode(TerminalNode context) {
        ReferenceNode res = new ReferenceNode(context.getText());
        return res;
    }

    @Override
    public AstNode visitNonArrayVariableType(MxParser.NonArrayVariableTypeContext context) {
        NonArrayTypeNode res;
        if (context.Identifier() != null)
            res = new ClassTypeNode(visitIdentifierTerminalNode(context.Identifier()));
        else res = new PrimitiveTypeNode(context.primitiveType().getText());
        res.line = context.start.getLine();
        return res;
    }

    public ProgramNode buildAst(String path) throws IOException {

        InputStream is = new FileInputStream(path);
        ANTLRInputStream input = new ANTLRInputStream(is);
        MxLexer lexer = new MxLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxParser parser = new MxParser(tokens);
        AstBuilder builder = new AstBuilder();

        ParseTree cst = parser.program();
        return (ProgramNode)builder.visit(cst);
    }
}
