package BackEnd;

import IRCode.Operand.*;

import java.util.*;

public class RegisterConfig {

    // RAX 0  c2nvsm: return value
    // RCX 2
    // RDX 3
    // RBX 1
    // RSP 4  top of global stack
    // RBP 5  current stack
    // RSI 6
    // RDI 7
    // R8-15

    ArrayList<Register> regList;
    public int numOfAssignable = 6;
    public int numOfAll = 16;

    public RegisterConfig() {
        regList = new ArrayList<Register>();
        for (int i = 0; i < 16; ++i)
            regList.add(new Register(i));
    }

    public Register get(int i) {
        return regList.get(i);
    }

    public Register get(String str) {
        if (str.equals("rsp")) return regList.get(4);
        if (str.equals("rbp")) return regList.get(5);
        if (str.equals("rsi")) return regList.get(6);
        if (str.equals("rdi")) return regList.get(7);
        if (str.contains("x")) return regList.get(str.charAt(1) - 'a');
        else return regList.get(Integer.parseInt(str.substring(1)));
    }
}
