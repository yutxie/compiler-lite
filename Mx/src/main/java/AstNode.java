import java.util.List;

public abstract class AstNode {
    public void printInformation() {}
}

// ------------------------- program ------------------------
class ProgramNode extends AstNode {
    List<ClassDefinitionNode> classDefinitionList;
    List<MethodDefinitionNode> methodDefinitionList;
    List<DefinitionExpressionNode> variableDefinitionList;
}

// ------------------------ class definition ----------------------
class ClassDefinitionNode extends AstNode {
    IdentifierExpressionNode identifier;
    List<DefinitionExpressionNode> memberVariableList;
    List<MethodDefinitionNode> memberMethodList;
    List<ConstructionMethodDefinitionNode> memberConstructionMethodList;
}

// ----------------------- method definition ----------------------
class MethodDefinitionNode extends AstNode {
    VariableType returnType;
    IdentifierExpressionNode identifier;
    List<DefinitionExpressionNode> formalArgumentList;
    BlockNode block;
}
class ConstructionMethodDefinitionNode extends MethodDefinitionNode {}

// --------------------- block and statement ---------------------------
class BlockNode extends AstNode {
    List<StatementNode> statementList;
}
abstract class StatementNode extends AstNode {}
class IfStatementNode extends StatementNode {
    ExpressionStatementNode condition;
    BlockNode ifBlock;
    BlockNode elseBlock;
}
class ForStatementNode extends StatementNode {
    ExpressionStatementNode init;
    ExpressionStatementNode condition;
    ExpressionStatementNode afterBlock;
    BlockNode block;
}
class WhileStatementNode extends StatementNode {
    ExpressionStatementNode condition;
    BlockNode block;
}
class ReturnStatementNode extends StatementNode {
    ExpressionStatementNode returnValue;
}
class BreakStatementNode extends StatementNode {}
class ContinueStatementNode extends StatementNode {}
class EmptyStatementNode extends StatementNode {}

// ---------------------- expression ---------------------------
abstract class ExpressionStatementNode extends StatementNode {
    VariableType type;
    boolean leftValue;
    ExpressionStatementNode() {
        type = null;
        leftValue = false;
    }
}
// primary
abstract class PrimaryExpressionNode extends ExpressionStatementNode {}
class IdentifierExpressionNode extends PrimaryExpressionNode {
    String identifierStr;
}
class ConstantExpressionNode extends PrimaryExpressionNode {
    String constantStr;
}
class ThisExpressionNode extends PrimaryExpressionNode {}
// definition
class DefinitionExpressionNode extends ExpressionStatementNode {
    VariableType variableType;
    IdentifierExpressionNode variableIdentifier;
    ExpressionStatementNode initValue;
}
// acess
class MemberAccessExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    ExpressionStatementNode member;
}
class IndexAccessExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    ExpressionStatementNode index;
}
class MethodCallExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    List<ExpressionStatementNode> actualParameterList;
}
class NewExpressionNode extends ExpressionStatementNode {
    VariableType variableType;
    List<ExpressionStatementNode> actualParameterList;
}
// unary
abstract class UnaryExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode inner;
}
class PostfixIncNode extends UnaryExpressionNode {}
class PostfixDecNode extends UnaryExpressionNode {}
class PrefixIncNode extends UnaryExpressionNode{}
class PrefixDecNode extends UnaryExpressionNode{}
class NegateNode extends UnaryExpressionNode{}
class NotNode extends UnaryExpressionNode{}
class LnotNode extends UnaryExpressionNode {}
// binary
abstract class BinaryExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode lhs;
    ExpressionStatementNode rhs;
}
class MulNode extends BinaryExpressionNode {}
class DivNode extends BinaryExpressionNode {}
class ModNode extends BinaryExpressionNode {}
class AddNode extends BinaryExpressionNode {}
class SubNode extends BinaryExpressionNode {}
class LshiftNode extends BinaryExpressionNode {}
class RshiftNode extends BinaryExpressionNode {}
class LeNode extends BinaryExpressionNode {}
class GeNode extends BinaryExpressionNode {}
class LtNode extends BinaryExpressionNode {}
class GtNode extends BinaryExpressionNode {}
class EqualNode extends BinaryExpressionNode {}
class NotEqualNode extends BinaryExpressionNode {}
class AndNode extends BinaryExpressionNode {}
class XorNode extends BinaryExpressionNode {}
class OrNode extends BinaryExpressionNode {}
class LandNode extends BinaryExpressionNode {}
class LorNode extends BinaryExpressionNode {}
class AssignNode extends BinaryExpressionNode {}
