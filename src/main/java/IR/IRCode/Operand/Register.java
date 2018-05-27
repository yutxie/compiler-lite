package IR.IRCode.Operand;

import java.util.*;

public class Register extends Operand {

    int type;
    // R0-15
    // RAX 16
    // RCX 18
    // RDX 19
    // RBX 17
    // RSP 20
    // RBP 21
    // RSI 22
    // RDI 23

    public Register(int type) {
        this.type = type;
    }

    public Register(String str) {
        if (str.equals("rsp")) type = 20;
        else if (str.equals("rbp")) type = 21;
        else if (str.equals("rsi")) type = 22;
        else if (str.equals("rdi")) type = 23;
        else if (str.contains("x")) type = 16 + str.charAt(1) - 'a';
        else type = Integer.parseInt(str.substring(1));
    }

    @Override
    public HashSet<Variable> colorable() {
        return null;
    }

    @Override
    public String getName() {
        switch (type) {
            case 20: return "rsp";
            case 21: return "rbp";
            case 22: return "rsi";
            case 23: return "rdi";
            default:
                if (type < 16) return "r" + type;
                else return "r" + (char)('a' + type - 16) + "x";
        }
    }
}
