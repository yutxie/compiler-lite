import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.lang.*;

// difine AST node classes
abstract class ExpressionNode {}

abstract class InfixExressionNode extends ExpressionNode {
    public ExpressionNode Left;
    public ExpressionNode Right;
}

class AdditionNode extends InfixExressionNode {}
class SubtractionNode extends InfixExressionNode {}
class MultiplicationNode extends InfixExressionNode {}
class DivisionNode extends InfixExressionNode {}

class NegateNode extends ExpressionNode {
    public ExpressionNode InnerNode;
}

class NumberNode extends ExpressionNode {
    public double value;
}

// override visitor method
class BuildAstVisitor extends MathBaseVisitor<ExpressionNode> {

    @Override
    public ExpressionNode visitCompileUnit(MathParser.CompileUnitContext context) {
        System.out.println("visitCompileUnit");
        ExpressionNode tmp = visit(context.expr());
        if (tmp == null) System.out.println("><");
        return tmp;
    }

    @Override
    public ExpressionNode visitNumberExpr(MathParser.NumberExprContext context) {
        System.out.println("visitNumberExpr");
        NumberNode node = new NumberNode();
        node.value = Double.parseDouble(context.value.getText());
        return node;
    }

    @Override
    public ExpressionNode visitParensExpr(MathParser.ParensExprContext context) {
        System.out.println("visitParensExpr");
        return visit(context.expr());
    }

    @Override
    public ExpressionNode visitInfixExpr(MathParser.InfixExprContext context) {
        System.out.println("visitInfixExpr");
        InfixExressionNode node = null;
        switch (context.op.getType()) {
            case MathLexer.OP_ADD:
                node = new AdditionNode();
                break;
            case MathLexer.OP_SUB:
                node = new SubtractionNode();
                break;
            case MathLexer.OP_MUL:
                node = new MultiplicationNode();
                break;
            case MathLexer.OP_DIV:
                node = new DivisionNode();
                break;
            default:
                System.out.println("null in visitInfixExpr");
        }
        node.Left = visit(context.left);
        node.Right = visit(context.right);
        return node;
    }

    @Override
    public ExpressionNode visitUnaryExpr(MathParser.UnaryExprContext context) {
        System.out.println("visitUnaryExpr");
        switch (context.op.getType()) {
            case MathLexer.OP_ADD:
                return visit(context.expr());
            case MathLexer.OP_SUB:
                NegateNode node = new NegateNode();
                node.InnerNode = visit(context.expr());
                return node;
        }
        System.out.println("null in visitUnaryExpr");
        return null;
    }
}

// visit well built AST
abstract class AstVisitor<T> {
    public abstract T visit(AdditionNode node);
    public abstract T visit(SubtractionNode node);
    public abstract T visit(MultiplicationNode node);
    public abstract T visit(DivisionNode node);
    public abstract T visit(NegateNode node);
    public abstract T visit(NumberNode node);

    public T visit(ExpressionNode node) {
        if (node instanceof AdditionNode)
            return visit((AdditionNode)node);
        else if (node instanceof SubtractionNode)
            return visit((SubtractionNode)node);
        else if (node instanceof MultiplicationNode)
            return visit((MultiplicationNode)node);
        else if (node instanceof DivisionNode)
            return visit((DivisionNode)node);
        else if (node instanceof NegateNode)
            return visit((NegateNode)node);
        else if (node instanceof NumberNode)
            return visit((NumberNode)node);
        System.out.println("null in visit");
        return null;
    }
}

class EvaluateExpressionVisitor extends AstVisitor<Double> {

    @Override
    public Double visit(AdditionNode node) {
        return visit(node.Left) + visit(node.Right);
    }
    @Override
    public Double visit(SubtractionNode node) {
        return visit(node.Left) - visit(node.Right);
    }

    @Override
    public Double visit(MultiplicationNode node) {
        System.out.println(visit(node.Left) + " * " + visit(node.Right));
        return visit(node.Left) * visit(node.Right);
    }

    @Override
    public Double visit(DivisionNode node) {
        return visit(node.Left) / visit(node.Right);
    }

    @Override
    public Double visit(NegateNode node) {
        return -visit(node.InnerNode);
    }

    @Override
    public Double visit(NumberNode node) {
        return node.value;
    }
}

// putting it all together
public class MathTest {
    public static void main(String args[]) throws IOException {

        InputStream is = new FileInputStream("example/0.txt");
        ANTLRInputStream input = new ANTLRInputStream(is);
        MathLexer lexer = new MathLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MathParser parser = new MathParser(tokens);
        BuildAstVisitor builder = new BuildAstVisitor();
        EvaluateExpressionVisitor evaluator = new EvaluateExpressionVisitor();

        ParseTree tree = parser.compileUnit();
        ExpressionNode ast = builder.visit(tree);
        double value = evaluator.visit(ast);
        System.out.println(value);
    }
}