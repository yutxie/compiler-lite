package Symbol;

public class PrimitiveType extends VariableType {

    public enum PrimitiveTypeKeyword {
        BOOL, INT, STRING, VOID
    }

    public PrimitiveTypeKeyword type;

    public PrimitiveType(String str) {
        if (str == "bool") this.type = PrimitiveTypeKeyword.BOOL;
        if (str == "int") this.type = PrimitiveTypeKeyword.INT;
        if (str == "string") this.type = PrimitiveTypeKeyword.STRING;
        if (str == "void") this.type = PrimitiveTypeKeyword.VOID;
    }

    @Override public String getTypeName() {
        switch (type) {
            case INT: return "int";
            case BOOL: return "bool";
            case VOID: return "void";
            case STRING: return "string";
        }
        return "";
    }
}
