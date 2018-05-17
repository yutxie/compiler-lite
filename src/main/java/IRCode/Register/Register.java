package IRCode.Register;

import AstNode.*;
import IRCode.IRCode;

public class Register {

    public boolean global = false;
    public ConstantNode initValue;

    public String id() {
        return String.valueOf(this.hashCode());
    }
}
