package AstVisitor;

import AstNode.*;
import ErrorHandler.SemanticException;
import IRCode.IRCode;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.LinkedList;

public class NoMercyPrinter extends AstVisitor {
    private PrintStream os;

    public NoMercyPrinter(PrintStream os) {
        this.os = os;
    }

    @Override
    void visit(MethodDefinitionNode node) throws Exception {

        if (node.methodName.equals("print")) {
            os.println("void print(string str) {");
            os.println("    fputs(str.base.c_str(), stdout);");
            os.println("}");
        } else {
            // arg list
            String arg_list = get_arglist(node);
            os.printf("%s %s(%s) {\n", node.returnType.getTypeName(), node.methodName, arg_list);
            for (AstNode n : node.block.childList) {
                visit(n);
            }
            os.print("}\n");

        }
    }

    // =============================================

    @Override
    void visit(BlockNode node) throws Exception {
        for (AstNode item : node.childList) visit(item);
    }

    @Override
    void visit(BreakStatementNode node) throws SemanticException {
        os.println("break;");
    }

    @Override
    void visit(ConstantNode node) {
        os.print(node.constantStr);
    }

    @Override
    void visit(ContinueStatementNode node) throws SemanticException {
        os.println("continue;");
    }

    @Override
    void visit(DefinitionExpressionNode node) throws Exception {
        assert(false);
    }

    @Override
    void visit(ForStatementNode node) throws Exception {
        os.print("for (");
        if (node.init != null) visit(node.init);
        os.print(";");
        if (node.condition != null) visit(node.condition);
        os.print(";");
        if (node.afterBlock != null) visit(node.afterBlock);
        os.println(") {");
        visit(node.block);
        os.println("}");
    }

    @Override
    void visit(IfStatementNode node) throws Exception {
        os.print("if (");
        visit(node.condition);
        os.println(" ) {");
        visit(node.ifBlock);
        os.println("}");
        if (node.elseBlock != null) {
            os.println("else {");
            visit(node.elseBlock);
            os.println("}");
        }
    }

    @Override
    void visit(IndexAccessExpressionNode node) throws Exception {
        visit(node.caller);
        os.print("[");
        visit(node.index);
        os.print("]");
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        os.print(".");
        visit(node.member);
    }


    @Override
    void visit(MethodCallExpressionNode node) throws Exception {
        // arg list
        os.printf("%s(", node.caller.referenceName);
        for (int i = 0; i < node.actualParameterList.size(); i++) {
            ExpressionStatementNode x = node.actualParameterList.get(i);

            visit(x);
            if (i != node.actualParameterList.size() - 1) {
                os.print(", ");
            }
        }
        os.println(");");
    }


    @Override
    void visit(NewExpressionNode node) throws Exception {
        assert (false);
    }

    @Override
    void visit(ThisNode node) throws Exception {
        os.println("this->");
    }

    @Override
    void visit(UnaryExpressionNode node) throws Exception {
        switch (node.op) {
            case PREFIX_DEC:
                os.print("--");
                visit(node.inner);
                break;
            case PREFIX_INC:
                os.print("++");
                visit(node.inner);
                break;
            case POSTFIX_DEC:
                visit(node.inner);
                os.print("--");
                break;
            case POSTFIX_INC:
                visit(node.inner);
                os.print("++");
                break;
            case NOT:
                os.print("~");
                visit(node.inner);
                break;
            case LNOT:
                os.print("!");
                visit(node.inner);
                break;
            case NEGATE:
                os.print("-");
                visit(node.inner);
                break;
        }
    }

    @Override
    void visit(WhileStatementNode node) throws Exception {
        os.print("while (");
        visit(node.condition);
        os.println(") {");
        visit(node.block);
        os.println("}");
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        os.print("return ");
        visit(node.returnValue);
        os.println(";");
    }

    @Override
    void visit(BinaryExpressionNode node) throws Exception {
        visit(node.lhs);
        switch(node.op) {
            case MUL:      os.print(" * "); break;
            case DIV:      os.print(" / "); break;
            case MOD:      os.print(" % "); break;
            case ADD:      os.print(" + "); break;
            case SUB:      os.print(" - "); break;
            case LSHIFT:   os.print(" << "); break;
            case RSHIFT:   os.print(" >> "); break;
            case LE:       os.print(" <= "); break;
            case GE:       os.print(" >= "); break;
            case LT:       os.print(" < "); break;
            case GT:       os.print(" > "); break;
            case EQUAL:    os.print(" == "); break;
            case NOTEQUAL: os.print(" != "); break;
            case AND:      os.print(" & "); break;
            case XOR:      os.print(" ^ "); break;
            case OR:       os.print(" | "); break;
            case LAND:     os.print(" && "); break;
            case LOR:      os.print(" || "); break;
            case ASSIGN:   os.print(" = "); break;
        }

        visit(node.rhs);
    }

    @Override
    void visit(ReferenceNode node) throws Exception {
        os.print(node.referenceName);
    }


    public void aha_print(ProgramNode prog) throws Exception {
        // pre code library
        String dir = "";
        FileInputStream is = new FileInputStream(dir + "code/nomercy_pre.cc");
        int b;
        while((b = is.read()) != -1) {
            os.write(b);
        }
        is.close();

        // forward deceleration
        for (MethodDefinitionNode node: prog.methodDefinitionList) {
            String arg_list = get_arglist(node);

            os.printf("%s %s(%s);\n", node.returnType.getTypeName(), node.methodName, arg_list);
        }
        visit(prog);

        // post code library
    }

    private String get_arglist(MethodDefinitionNode node) {
        StringBuilder sb = new StringBuilder();

        // arg list
        for (int i = 0; i < node.formalArgumentList.size(); i++) {
            DefinitionExpressionNode x = node.formalArgumentList.get(i);
            sb.append(x.variableType.getTypeName());
            sb.append(" ");
            sb.append(x.variableName);
            if (i != node.formalArgumentList.size() - 1)
                sb.append(", ");
        }

        return sb.toString();
    }
}
