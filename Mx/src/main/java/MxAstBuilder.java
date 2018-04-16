import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class MxAstBuilder {

    // ------------------------ AST node ----------------------
    public abstract class AstNode {}

    public class ClassDefinitionNode extends AstNode {}
    public class MethodDefinitionNode extends AstNode {}

    // block and statement
    public class BlockNode extends AstNode {
        StatementNode[] statement_list;
    }
    public abstract class StatementNode extends AstNode {}
    public class DefinitionStatementNode extends StatementNode {
        ExpressionNode inner;
    }
    public class ExpressionStatementNode extends StatementNode {
        ExpressionNode inner;
    }
    public class IfStatementNode extends StatementNode {
        ExpressionNode condition;
        BlockNode if_block;
        BlockNode else_block;
    }
    public class ForStatementNode extends StatementNode {
        ExpressionNode init;
        ExpressionNode condition;
        ExpressionNode operation;
        BlockNode block;
    }
    public class WhileStatementNode extends StatementNode {
        ExpressionNode condition;
        BlockNode block;
    }
    public class ReturnStatementNode extends StatementNode {
        ExpressionNode ret;
    }
    public class BreakStatementNode extends StatementNode {}
    public class ContinueStatementNode extends StatementNode {}
    // public class EmptyStatementNode extends StatementNode {}

    // expression
    public abstract class ExpressionNode extends AstNode {}
    public class IdentifierExpressionNode extends ExpressionNode {}
    public class ConstantExpressionNode extends ExpressionNode {}
    public class ThisExpressionNode extends ExpressionNode {}
    public class DefinitionExpressionNode extends ExpressionNode {
        ExpressionNode id;
        ExpressionNode init_value;
    }
    // public class ParensExpressionNode extends ExpressionNode {}
    public class MemberAccessExpressionNode extends ExpressionNode {
        ExpressionNode caller;
        ExpressionNode member;
    }
    public class IndexAccessExpressionNode extends ExpressionNode {
        ExpressionNode caller;
        ExpressionNode index;
    }
    public class MethodCallExpressionNode extends ExpressionNode {
        ExpressionNode caller;
        ExpressionNode[] actual_parameter_list;
    }
    public class NewExpressionNode extends ExpressionNode {}
    
    public abstract class UnaryExpressionNode extends ExpressionNode {
        public ExpressionStatementNode inner;
    }
    public class PostfixIncNode extends UnaryExpressionNode {}
    public class PostfixDecNode extends UnaryExpressionNode {}
    public class PrefixIncNode extends UnaryExpressionNode{}
    public class PrefixDecNode extends UnaryExpressionNode{}
    // public class PositiveNode extends UnaryExpressionNode{}
    public class NegateNode extends UnaryExpressionNode{}
    public class NotNode extends UnaryExpressionNode{}
    public class LnotNode extends UnaryExpressionNode {}

    public abstract class BinaryExpressionNode extends ExpressionNode {
        public ExpressionStatementNode lhs;
        public ExpressionStatementNode rhs;
    }
    public class MulNode extends BinaryExpressionNode {}
    public class DivNode extends BinaryExpressionNode {}
    public class ModNode extends BinaryExpressionNode {}
    public class AddNode extends BinaryExpressionNode {}
    public class SubNode extends BinaryExpressionNode {}
    public class LshiftNode extends BinaryExpressionNode {}
    public class RshiftNode extends BinaryExpressionNode {}
    public class LeNode extends BinaryExpressionNode {}
    public class GeNode extends BinaryExpressionNode {}
    public class LtNode extends BinaryExpressionNode {}
    public class GtNode extends BinaryExpressionNode {}
    public class EqualNode extends BinaryExpressionNode {}
    public class NotEqualNode extends BinaryExpressionNode {}
    public class AndNode extends BinaryExpressionNode {}
    public class XorNode extends BinaryExpressionNode {}
    public class OrNode extends BinaryExpressionNode {}
    public class LandNode extends BinaryExpressionNode {}
    public class LorNode extends BinaryExpressionNode {}
    public class AssignNode extends BinaryExpressionNode {}

    // others

}
