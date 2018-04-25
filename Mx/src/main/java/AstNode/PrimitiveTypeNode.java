package AstNode;

public class PrimitiveTypeNode extends NonArrayTypeNode {

    public enum PrimitiveTypeKeyword {
        BOOL, INT, STRING, VOID, NULL
    }

    public PrimitiveTypeKeyword type;

    public PrimitiveTypeNode(String str) {
        if (str.equals("bool")) this.type = PrimitiveTypeKeyword.BOOL;
        if (str.equals("int")) this.type = PrimitiveTypeKeyword.INT;
        if (str.equals("string")) this.type = PrimitiveTypeKeyword.STRING;
        if (str.equals("void")) this.type = PrimitiveTypeKeyword.VOID;
        if (str.equals("null")) this.type = PrimitiveTypeKeyword.NULL;
    }

    @Override public String getTypeName() {
        switch (type) {
            case INT: return "int";
            case BOOL: return "bool";
            case VOID: return "void";
            case NULL: return "null";
            case STRING: return "string";
            default: return "";
        }
    }
}
