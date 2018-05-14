package IRCode;

import AstNode.*;

import java.util.*;

public class MethodCall extends IRCode {

    public Register lhs;
    public Register callerReg;
    public LinkedList<Register> actualParaRegList;
    public MethodDefinitionNode method;

    public MethodCall() {
        actualParaRegList = new LinkedList<Register>();
    }
    // ATTENTION: pass caller as this
}
