package Error;

public class SemanticException extends Exception {

    public SemanticException(int line, String str) {
        super("[" + Integer.toString(line) + "] " + str);
    }

    public SemanticException(String str) {
        super(str);
    }
}
