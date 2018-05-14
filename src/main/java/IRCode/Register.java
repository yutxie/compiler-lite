package IRCode;

import AstNode.*;

public class Register {

    public boolean global = false;
    public ConstantNode initValue;

    public String id() {
        return String.valueOf(this.hashCode());
    }
}
