import java.awt.image.ByteLookupTable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.locks.AbstractQueuedLongSynchronizer.ConditionObject;
import java.io.*;
import java.lang.*;

class PrintTool {
    public static void printSpaceAndStr(int tab, String str) {
        for (int i = 0; i < tab; ++i) System.out.print("    ");
        System.out.println(str);
    }
    public static void printDashAndStr(int tab, String str) {
        for (int i = 0; i < tab; ++i) System.out.print("----");
        System.out.println(str);
    }
}

public abstract class AstNode {
    public void printInformation(int tab) {
        PrintTool.printDashAndStr(tab, this.getClass().getName());
    }
}

// ------------------------- program ------------------------
class ProgramNode extends AstNode {
    List<ClassDefinitionNode> classDefinitionList;
    List<MethodDefinitionNode> methodDefinitionList;
    List<DefinitionExpressionNode> variableDefinitionList;
    ProgramNode() {
        classDefinitionList = new LinkedList<ClassDefinitionNode>();
        methodDefinitionList = new LinkedList<MethodDefinitionNode>();
        variableDefinitionList = new LinkedList<DefinitionExpressionNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (ClassDefinitionNode item : classDefinitionList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : methodDefinitionList)
            item.printInformation(tab + 1);
        for (DefinitionExpressionNode item : variableDefinitionList)
            item.printInformation(tab + 1);
    }
}

// ------------------------ class definition ----------------------
class ClassDefinitionNode extends AstNode {
    IdentifierExpressionNode identifier;
    List<DefinitionExpressionNode> memberVariableList;
    List<MethodDefinitionNode> memberMethodList;
    List<ConstructionMethodDefinitionNode> memberConstructionMethodList;
    ClassDefinitionNode() {
        memberVariableList = new LinkedList<DefinitionExpressionNode>();
        memberMethodList = new LinkedList<MethodDefinitionNode>();
        memberConstructionMethodList = new LinkedList<ConstructionMethodDefinitionNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        identifier.printInformation(tab + 1);
        for (DefinitionExpressionNode item : memberVariableList)
            item.printInformation(tab + 1);
        for (MethodDefinitionNode item : memberMethodList)
            item.printInformation(tab + 1);
        for (ConstructionMethodDefinitionNode item : memberConstructionMethodList)
            item.printInformation(tab + 1);
    }
}

// ----------------------- method definition ----------------------
class MethodDefinitionNode extends AstNode {
    VariableType returnType;
    IdentifierExpressionNode identifier;
    List<DefinitionExpressionNode> formalArgumentList;
    BlockNode block;
    MethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "returnType: " + returnType.getVariableTypeStr());
        identifier.printInformation(tab + 1);
        for (DefinitionExpressionNode item : formalArgumentList)
            item.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
class ConstructionMethodDefinitionNode extends MethodDefinitionNode {
    ConstructionMethodDefinitionNode() {
        formalArgumentList = new LinkedList<DefinitionExpressionNode>();
    }
}

// --------------------- block and statement ---------------------------
class BlockNode extends AstNode {
    List<StatementNode> statementList;
    BlockNode() {
        statementList = new LinkedList<StatementNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        for (StatementNode item : statementList)
            item.printInformation(tab + 1);
    }
}
abstract class StatementNode extends AstNode {}
class IfStatementNode extends StatementNode {
    ExpressionStatementNode condition;
    BlockNode ifBlock;
    BlockNode elseBlock;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        condition.printInformation(tab + 1);
        ifBlock.printInformation(tab + 1);
        if (elseBlock != null) elseBlock.printInformation(tab + 1);
    }
}
class ForStatementNode extends StatementNode {
    ExpressionStatementNode init;
    ExpressionStatementNode condition;
    ExpressionStatementNode afterBlock;
    BlockNode block;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (init != null) init.printInformation(tab + 1);
        if (condition != null) condition.printInformation(tab + 1);
        if (afterBlock != null) afterBlock.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
class WhileStatementNode extends StatementNode {
    ExpressionStatementNode condition;
    BlockNode block;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        condition.printInformation(tab + 1);
        block.printInformation(tab + 1);
    }
}
class ReturnStatementNode extends StatementNode {
    ExpressionStatementNode returnValue;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (returnValue != null) returnValue.printInformation(tab + 1);
    }
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
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        if (type != null) PrintTool.printSpaceAndStr(tab, "type: " + type.getVariableTypeStr());
        PrintTool.printSpaceAndStr(tab, "leftValue: " + leftValue);
    }
}
// primary
abstract class PrimaryExpressionNode extends ExpressionStatementNode {}
class IdentifierExpressionNode extends PrimaryExpressionNode {
    String identifierStr;
    IdentifierExpressionNode(String str) {
        identifierStr = str;
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "identifierStr: " + identifierStr);
    }
}
class ConstantExpressionNode extends PrimaryExpressionNode {
    String constantStr;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "constantStr: " + constantStr);
    }
}
class ThisExpressionNode extends PrimaryExpressionNode {}
// definition
class DefinitionExpressionNode extends ExpressionStatementNode {
    VariableType variableType;
    IdentifierExpressionNode variableIdentifier;
    ExpressionStatementNode initValue;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "variableType: " + variableType.getVariableTypeStr());
        variableIdentifier.printInformation(tab + 1);
        if (initValue != null) initValue.printInformation(tab + 1);
    }
}
// access
class MemberAccessExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    ExpressionStatementNode member;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        member.printInformation(tab + 1);
    }
}
class IndexAccessExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    ExpressionStatementNode index;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        index.printInformation(tab + 1);
    }
}
class MethodCallExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode caller;
    List<ExpressionStatementNode> actualParameterList;
    MethodCallExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        caller.printInformation(tab + 1);
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
class NewExpressionNode extends ExpressionStatementNode {
    VariableType variableType;
    List<ExpressionStatementNode> actualParameterList;
    NewExpressionNode() {
        actualParameterList = new LinkedList<ExpressionStatementNode>();
    }
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        PrintTool.printSpaceAndStr(tab, "variableType: " + variableType.getVariableTypeStr());
        for (ExpressionStatementNode item : actualParameterList)
            item.printInformation(tab + 1);
    }
}
// unary
abstract class UnaryExpressionNode extends ExpressionStatementNode {
    ExpressionStatementNode inner;
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        inner.printInformation(tab + 1);
    }
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
    @Override public void printInformation(int tab) {
        super.printInformation(tab);
        lhs.printInformation(tab + 1);
        rhs.printInformation(tab + 1);
    }
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
