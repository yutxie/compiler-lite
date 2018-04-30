package AstNode;

public class PrimitiveTypeNode extends NonArrayTypeNode {

    public enum PrimitiveTypeKeyword {
        BOOL, INT, VOID, NULL //, STRING
    }

    public PrimitiveTypeKeyword type;

    public PrimitiveTypeNode(String str) {
        if (str.equals("bool")) this.type = PrimitiveTypeKeyword.BOOL;
        if (str.equals("int")) this.type = PrimitiveTypeKeyword.INT;
//        if (str.equals("string")) this.type = PrimitiveTypeKeyword.STRING;
        if (str.equals("void")) this.type = PrimitiveTypeKeyword.VOID;
        if (str.equals("null")) this.type = PrimitiveTypeKeyword.NULL;
    }

    @Override public String getTypeName() {
        switch (type) {
            case INT: return "int";
            case BOOL: return "bool";
            case VOID: return "void";
            case NULL: return "null";
//            case STRING: return "string";
            default: return "";
        }
    }

    @Override public boolean equalTo(VariableTypeNode node) {
        switch (type) {
//            case STRING: return node.isPrimitiveType(PrimitiveTypeKeyword.STRING);
            case VOID: return node.isPrimitiveType(PrimitiveTypeKeyword.VOID);
            case BOOL: return node.isPrimitiveType(PrimitiveTypeKeyword.BOOL);
            case INT: return node.isPrimitiveType(PrimitiveTypeKeyword.INT);
            case NULL: return node.isPrimitiveType(PrimitiveTypeKeyword.NULL);
            default: return false;
        }
    }
}
