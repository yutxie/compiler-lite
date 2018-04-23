package Symbol.Type;

public class ClassType extends NonArrayType {

    public String className;

    public ClassType(String str) {
        className = str;
    }

    @Override
    public String getTypeName() {
        return className;
    }
}
