package Symbol.Type;

public abstract class TypeReference {

    public String getReference() {
        return this.getClass().getName();
    }
}
