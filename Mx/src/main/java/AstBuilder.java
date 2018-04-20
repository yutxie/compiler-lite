import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import java.util.*;
import java.lang.*;
import java.io.*;

public class AstBuilder {

    private static class ParseTreeVisitor extends MxBaseVisitor<AstNode> {

        @Override public AstNode visitProgram(MxParser.ProgramContext context) {
            ProgramNode res = new ProgramNode();
            for (MxParser.ClassDefinitionContext item : context.classDefinition())
                res.classDefinitionList.add((ClassDefinitionNode)visit(item));
            for (MxParser.MethodDefinitionContext item : context.methodDefinition())
                res.methodDefinitionList.add((MethodDefinitionNode)visit(item));
            for (MxParser.DefinitionStatementContext item : context.definitionStatement())
                res.variableDefinitionList.add((DefinitionExpressionNode)visit(item));
            return res;
        }

        @Override public AstNode visitClassDefinition(MxParser.ClassDefinitionContext context) {
            ClassDefinitionNode res = new ClassDefinitionNode();
            res.identifier = new IdentifierExpressionNode(context.Identifier().getText());
            for (MxParser.MemberVariableContext item : context.memberVariable())
                res.memberVariableList.add((DefinitionExpressionNode)visit(item));
            for (MxParser.MethodDefinitionContext item : context.methodDefinition())
                res.memberMethodList.add((MethodDefinitionNode)visit(item));
            for (MxParser.ConstructionMethodDefinitionContext item : context.constructionMethodDefinition()) 
                res.memberConstructionMethodList.add((ConstructionMethodDefinitionNode)visit(item));
            return res;
        }

        @Override public AstNode visitMemberVariable(MxParser.MemberVariableContext context) {
            DefinitionExpressionNode res = new DefinitionExpressionNode();
            res.variableType = new VariableType(context.variableType().getText());
            res.variableIdentifier = new IdentifierExpressionNode(context.Identifier().getText());
            res.initValue = null;
            return res;
        }

        @Override public AstNode visitConstructionMethodDefinition(MxParser.ConstructionMethodDefinitionContext context) {
            ConstructionMethodDefinitionNode res = new ConstructionMethodDefinitionNode();
            res.returnType = new VariableType(context.Identifier().getText());
            res.identifier = new IdentifierExpressionNode(context.Identifier().getText());
            for (MxParser.FormalParameterContext item : context.formalParameterList().formalParameter())
                res.formalArgumentList.add((DefinitionExpressionNode)visit(item));
            res.block = (BlockNode)visit(context.block());
            return res;
        }

        @Override public AstNode visitMethodDefinition(MxParser.MethodDefinitionContext context) {
            MethodDefinitionNode res = new MethodDefinitionNode();
            res.returnType = new VariableType(context.variableType().getText());
            res.identifier = new IdentifierExpressionNode(context.Identifier().getText());
            if (context.formalParameterList() != null)
            for (MxParser.FormalParameterContext item : context.formalParameterList().formalParameter())
                res.formalArgumentList.add((DefinitionExpressionNode)visit(item));
            res.block = (BlockNode)visit(context.block());
            return res;
        }
        
        @Override public AstNode visitFormalParameter(MxParser.FormalParameterContext context) {
            DefinitionExpressionNode res = new DefinitionExpressionNode();
            res.variableType = new VariableType(context.variableType().getText());
            res.variableIdentifier = new IdentifierExpressionNode(context.Identifier().getText());
            res.initValue = null;
            return res;
        }

        @Override public AstNode visitBlock(MxParser.BlockContext context) {
            BlockNode res = new BlockNode();
            for (MxParser.StatementContext item : context.statement())
                res.statementList.add((StatementNode)visit(item));
            return res;
        }

        @Override public AstNode visitBlockOrStatement(MxParser.BlockOrStatementContext context) {
            if (context.block() != null) return (BlockNode)visit(context.block());
            BlockNode res = new BlockNode();
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
            res.condition = (ExpressionStatementNode)visit(context.expression());
            res.ifBlock = (BlockNode)visit(context.blockOrStatement(0));
            if (context.ELSE() == null) res.elseBlock = null;
            else res.elseBlock = (BlockNode)visit(context.blockOrStatement(1));
            return res;
        }

        @Override public AstNode visitForStat(MxParser.ForStatContext context) {
            ForStatementNode res = new ForStatementNode();
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
            res.condition = (ExpressionStatementNode)visit(context.expression());
            res.block = (BlockNode)visit(context.blockOrStatement());
            return res;
        }

        @Override public AstNode visitReturnStat(MxParser.ReturnStatContext context) {
            ReturnStatementNode res = new ReturnStatementNode();
            if (context.expression() == null) res.returnValue = null;
            else res.returnValue = (ExpressionStatementNode)visit(context.expression());
            return res;
        }

        @Override public AstNode visitBreakStat(MxParser.BreakStatContext context) {
            return new BreakStatementNode();
        }

        @Override public AstNode visitContinueStat(MxParser.ContinueStatContext context) {
            return new ContinueStatementNode();
        }

        @Override public AstNode visitEmptyStat(MxParser.EmptyStatContext context) {
            return new EmptyStatementNode();
        }

        @Override public AstNode visitDefinitionStatement(MxParser.DefinitionStatementContext context) {
            return (DefinitionExpressionNode)visit(context.definitionExpression());
        }

        @Override public AstNode visitIdentifierExpr(MxParser.IdentifierExprContext context) {
            IdentifierExpressionNode res = new IdentifierExpressionNode(context.getText());
            return res;
        }

        @Override public AstNode visitConstantExpr(MxParser.ConstantExprContext context) {
            ConstantExpressionNode res = new ConstantExpressionNode();
            res.constantStr = context.getText();
            switch(context.constant().getRuleIndex()) {
                case MxLexer.LogicConstant: res.type = new VariableType("bool"); break;
                case MxLexer.IntegerConstant: res.type = new VariableType("int"); break;
                case MxLexer.StringConstant: res.type = new VariableType("string"); break;
                case MxLexer.NullConstant: res.type = new VariableType("null"); break;
            }
            return res;
        }

        @Override public AstNode visitThisExpr(MxParser.ThisExprContext context) {
            return new ThisExpressionNode();
        }

        @Override public AstNode visitMemberAccessExpr(MxParser.MemberAccessExprContext context) {
            MemberAccessExpressionNode res = new MemberAccessExpressionNode();
            res.caller = (ExpressionStatementNode)visit(context.caller);
            res.member = (ExpressionStatementNode)visit(context.member);
            return res;
        }

        @Override public AstNode visitIndexAccessExpr(MxParser.IndexAccessExprContext context) {
            IndexAccessExpressionNode res = new IndexAccessExpressionNode();
            res.caller = (ExpressionStatementNode)visit(context.caller);
            res.index = (ExpressionStatementNode)visit(context.index);
            return res;
        }

        @Override public AstNode visitMethodCallExpr(MxParser.MethodCallExprContext context) {
            MethodCallExpressionNode res = new MethodCallExpressionNode();
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
            res.type = new VariableType("null");
            res.variableType = new VariableType(context.creator().variableType().getText());
            if (context.creator().actualParameterList() != null)
            for (MxParser.ExpressionContext item : context.creator().actualParameterList().expression())
                res.actualParameterList.add((ExpressionStatementNode)visit(item));
            return res;
        }

        @Override public AstNode visitUnaryExpr(MxParser.UnaryExprContext context) {
            UnaryExpressionNode res = null;
            if (context.prefix != null) {
                switch (context.prefix.getType()) {
                    case MxLexer.INC: res = new PrefixIncNode(); break;
                    case MxLexer.DEC: res = new PrefixDecNode(); break;
                    case MxLexer.ADD: return (ExpressionStatementNode)visit(context.expression());
                    case MxLexer.SUB: res = new NegateNode(); break;
                    case MxLexer.NOT: res = new NotNode(); break;
                    case MxLexer.LNOT: res = new LnotNode(); break;
                }
            } else if (context.postfix != null) {
                switch (context.postfix.getType()) {
                    case MxLexer.INC: res = new PostfixIncNode(); break;
                    case MxLexer.DEC: res = new PostfixDecNode(); break;
                }
            }
            res.inner = (ExpressionStatementNode)visit(context.expression());
            return res;
        }

        @Override public AstNode visitBinaryExpr(MxParser.BinaryExprContext context) {
            BinaryExpressionNode res = null;
            switch (context.op.getType()) {
                case MxLexer.MUL: res = new MulNode(); break;
                case MxLexer.DIV: res = new DivNode(); break;
                case MxLexer.MOD: res = new ModNode(); break;
                case MxLexer.ADD: res = new AddNode(); break;
                case MxLexer.SUB: res = new SubNode(); break;
                case MxLexer.LSHIFT: res = new LshiftNode(); break;
                case MxLexer.RSHIFT: res = new RshiftNode(); break;
                case MxLexer.LE: res = new LeNode(); break;
                case MxLexer.GE: res = new GeNode(); break;
                case MxLexer.LT: res = new LtNode(); break;
                case MxLexer.GT: res = new GtNode(); break;
                case MxLexer.EQUAL: res = new EqualNode(); break;
                case MxLexer.NOTEQUAL: res = new NotEqualNode(); break;
                case MxLexer.AND: res = new AndNode(); break;
                case MxLexer.XOR: res = new XorNode(); break;
                case MxLexer.OR: res = new OrNode(); break;
                case MxLexer.LAND: res = new LandNode(); break;
                case MxLexer.LOR: res = new LorNode(); break;
                case MxLexer.ASSIGN: res = new AssignNode(); break;
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
            res.variableType = new VariableType(context.variableType().getText());
            res.variableIdentifier = new IdentifierExpressionNode(context.Identifier().getText());
            if (context.expression() == null) res.initValue = null;
            else res.initValue = (ExpressionStatementNode)visit(context.expression());
            return res;
        }
    }

    public static AstNode buildAst(String path) throws IOException {

        InputStream is = new FileInputStream(path);
        ANTLRInputStream input = new ANTLRInputStream(is);
        MxLexer lexer = new MxLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxParser parser = new MxParser(tokens);
        ParseTreeVisitor visitor = new ParseTreeVisitor();

        ParseTree cst = parser.program();
        return visitor.visit(cst);
    }

    public static void printInformation(AstNode ast) {
        ast.printInformation(0);
    }

    // ----------------------- main --------------------------------------
    public static void main(String args[]) throws IOException {

        AstNode ast = buildAst("code/700.txt");
        printInformation(ast);
    }
}
