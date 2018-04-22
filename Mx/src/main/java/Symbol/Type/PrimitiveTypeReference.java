package Symbol.Type;

public class PrimitiveTypeReference extends VariableTypeReference {

    public enum PrimitiveTypeKeyword {
        BOOL, INT, STRING, VOID
    }

    public PrimitiveTypeKeyword type;

    public PrimitiveTypeReference(String str) {
        if (str.equals("bool")) this.type = PrimitiveTypeKeyword.BOOL;
        if (str.equals("int")) this.type = PrimitiveTypeKeyword.INT;
        if (str.equals("string")) this.type = PrimitiveTypeKeyword.STRING;
        if (str.equals("void")) this.type = PrimitiveTypeKeyword.VOID;
    }

    @Override public String getReference() {
        switch (type) {
            case INT: return "int";
            case BOOL: return "bool";
            case VOID: return "void";
            case STRING: return "string";
        }
        return "";
    }
}
