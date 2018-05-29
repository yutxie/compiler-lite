package IR.IRCode.Operand;

import java.util.*;

public class Register extends Operand {

    int type;
    // RAX 0  c2nvsm: return value
    // RCX 2
    // RDX 3
    // RBX 1
    // RSP 4  top of global stack
    // RBP 5  current stack
    // RSI 6
    // RDI 7
    // R8-15

    public Register(int type) {
        this.type = type;
    }

    public Register(String str) {
        if (str.equals("rsp")) type = 4;
        else if (str.equals("rbp")) type = 5;
        else if (str.equals("rsi")) type = 6;
        else if (str.equals("rdi")) type = 7;
        else if (str.contains("x")) type = str.charAt(1) - 'a';
        else type = Integer.parseInt(str.substring(1));
    }

    @Override
    public HashSet<Variable> colorable() {
        return null;
    }

    @Override
    public String getName() {
        switch (type) {
            case 4: return "rsp";
            case 5: return "rbp";
            case 6: return "rsi";
            case 7: return "rdi";
            default:
                if (type < 4) return "r" + (char)('a' + type) + "x";
                else return "r" + type;
        }
    }
}
