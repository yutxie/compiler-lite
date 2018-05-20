package AstVisitor;

import AstNode.*;
import ErrorHandler.SemanticException;

import java.io.FileInputStream;
import java.io.PrintStream;
import java.util.List;

public class NoMercyPrinter extends AstVisitor {
    private PrintStream os;

    public NoMercyPrinter(PrintStream os) {
        this.os = os;
    }

    @Override
    void visit(ProgramNode node) throws Exception {
        for (AstNode item : node.childrenList) {
            if (item instanceof ClassDefinitionNode) visit((ClassDefinitionNode)item);
        }

        for (AstNode item : node.childrenList) {
            if (item instanceof MethodDefinitionNode) visit((MethodDefinitionNode)item);
        }

        for (AstNode item : node.childrenList) {
            if (item instanceof ClassDefinitionNode) continue;
            else if (item instanceof MethodDefinitionNode) continue;
            else visit((DefinitionExpressionNode)item);
        }

    }

    @Override
    void visit(ClassDefinitionNode node) throws Exception {
        if (node.className.equals("string"))
            return;

        os.printf("struct %s {\n", node.className);
        for (DefinitionExpressionNode item : node.memberVariableList) {
            visit(item);
            os.println(";");
        }
        for (MethodDefinitionNode item : node.memberMethodList) visit(item);
        for (MethodDefinitionNode item : node.memberConstructionMethodList) visit(item);
        os.println("};");
    }


    @Override
    void visit(MethodDefinitionNode node) throws Exception {

        if (node.methodName.equals("print")) {
            os.println("void print(string* str) { __lib_print(str); }");
        } else if (node.methodName.equals("toString")) {
            os.println("string* toString(int i) { return __lib_toString(i); }");
        } else if (node.methodName.equals("println")) {
            os.println("void println(string* str) { __lib_println(str); }");
        } else {
            // arg list
            String arg_list = get_arglist(node);
            String ret_type;
            if (node.methodName.equals("AAA"))
                ret_type = "";
            else
                ret_type = to_c_type(node.returnType);

            os.printf("%s %s(%s) {\n", ret_type, node.methodName, arg_list);
            for (AstNode n : node.block.childList) {
                visit(n);
            }
            os.print("}\n");
        }
    }

    // =============================================

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
        os.print(to_c_type(node.variableType));

        os.print(" ");
        os.print(node.variableName);
        if (node.initValue != null) {
            os.print(" = ");
            visit(node.initValue);
        }
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
        os.print("(*");
        visit(node.caller);
        os.print(")[");
        visit(node.index);
        os.print("]");
    }

    @Override
    void visit(MemberAccessExpressionNode node) throws Exception {
        visit(node.caller);
        os.print("->");
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
        os.print(")");
    }


    private void gen_new_array(String base, int depth, VariableTypeNode type,
                               List<ExpressionStatementNode> params) throws Exception {
        if (type instanceof ArrayTypeNode) {
            VariableTypeNode inner = ((ArrayTypeNode) type).innerTypeNode;
            String str_type = to_c_type(type);
            String len_tmp = "len_" + depth;

            os.printf("int %s = ", len_tmp);
            visit(((ArrayTypeNode)type).size);
            os.println(";");

            os.printf("%s = new %s(%s);\n", base,
                    str_type.substring(0, str_type.length()-1), len_tmp);

            if (inner instanceof ClassTypeNode) {
                String iter_tmp = "iter_" + depth;
                os.printf("for (int %s = 0; %s < %s; %s++) {\n", iter_tmp, iter_tmp, len_tmp, iter_tmp);
                os.printf("(*%s)[%s] = new %s();\n", base, iter_tmp, ((ClassTypeNode) inner).referenceClassName);
                os.println("}");
            } else if (inner instanceof ArrayTypeNode) {
                if  (((ArrayTypeNode)inner).size != null) {
                    String iter_tmp = "iter_" + depth;
                    os.printf("for (int %s = 0; %s < %s; %s++) {\n", iter_tmp, iter_tmp, len_tmp, iter_tmp);
                    gen_new_array("(*" + base + ")[" + iter_tmp + "]", depth + 1,
                            ((ArrayTypeNode) type).innerTypeNode,
                            params);
                    os.println("}");
                }
            }
        }
    }

    @Override
    void visit(NewExpressionNode node) throws Exception {
        if (node.variableType instanceof ClassTypeNode) {
            os.print("new ");
            os.print(to_c_type(node.variableType));
            os.print("(");
            for (int i = 0; i < node.actualParameterList.size(); i++) {
                visit(node.actualParameterList.get(i));
                if (i != node.actualParameterList.size() - 1)
                    os.print(", ");
            }
            os.print(")");
        } else if (node.variableType instanceof ArrayTypeNode) {
            os.println("([]{");
            os.printf("%s %s;\n", to_c_type(node.variableType), "tmp");
            gen_new_array("tmp", 0, node.variableType, node.actualParameterList);
            os.println("return tmp;");
            os.print("}())");
        }
    }

    @Override
    void visit(ReferenceNode node) throws Exception {
        os.print(node.referenceName);
    }

    @Override
    void visit(ReturnStatementNode node) throws Exception {
        os.print("return ");
        visit(node.returnValue);
        os.println(";");
    }

    @Override
    void visit(StatementNode node) throws Exception {
        super.visit(node);
        if (node instanceof ExpressionStatementNode)
            os.println(";");
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
        for (ClassDefinitionNode node: prog.classDefinitionList) {
            os.printf("struct %s;\n", node.className);
        }
        for (MethodDefinitionNode node: prog.methodDefinitionList) {
            String arg_list = get_arglist(node);
            os.printf("%s %s(%s);\n", to_c_type(node.returnType),
                    node.methodName, arg_list);
        }

        visit(prog);

        // post code library
    }

    @Override
    void visit(ArrayTypeNode node) throws Exception {

    }

    // private utilities
    private String to_c_type(TypeNode node) {
        StringBuilder sb = new StringBuilder();

        if (node instanceof ArrayTypeNode) {
            sb.append("std::vector<");
            sb.append(to_c_type(((ArrayTypeNode) node).innerTypeNode));
            sb.append(">*");
        } else if (node instanceof ClassTypeNode) {
            sb.append(node.getTypeName());
            sb.append("*");
        } else {
            sb.append(node.getTypeName());
        }

        return sb.toString();
    }

    private String get_arglist(MethodDefinitionNode node) {
        StringBuilder sb = new StringBuilder();

        // arg list
        for (int i = 0; i < node.formalArgumentList.size(); i++) {
            DefinitionExpressionNode x = node.formalArgumentList.get(i);
            sb.append(to_c_type(x.variableType));
            sb.append(" ");
            sb.append(x.variableName);
            if (i != node.formalArgumentList.size() - 1)
                sb.append(", ");
        }

        return sb.toString();
    }
}

// int [] a  = new int[10]  -> std::vector<int>* a = new std::vector<int>(10);
// a[0]       : (*a)[0]

// int [][] a  -> std::vector<std::vector<int>*>* a;
// a[0][0]    : (*(*a)[0])[0]

// int [][][] a  -> std::vector<std::vector<std::vector<int>*>*>*>* a;
// a[0][0][0] : (*(*(*a)[0])[0])[0]

// int [][][] a = new int[2][3][4];
// std::vector<std::vector<std::vector<int>*>*>*>* a;
// a = new std::vector<std::vector<std::vector<int>*>*>*>();
// for (int i = 0; i < 2; i++)  {
//   a[i] = new std::vector<std::vector<int>*>(3)
//   for (int j = 0; j < 3; j++) {
//     a[i][j] = new std::vector<int>(4);
// }
//

// A [][]a = new A[2][3];
// a = new std::vector<std::vector<A*>*>(2);
// for (int i = 0; i < 2; i++) {
//   a[i] = new std::vector<A*>(3);
//   for (int k = 0; k < 3; k++) {  // add a new line
//     a[i][j] = new A();
//   }
// }
//