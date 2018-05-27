package BackEnd;

import IR.IRCode.Operand.*;

import java.util.*;

public class RegisterConfig {

    // R0-15
    // RAX 16
    // RCX 18
    // RDX 19
    // RBX 17
    // RSP 20
    // RBP 21
    // RSI 22
    // RDI 23

    ArrayList<Register> regList;

    public RegisterConfig() {
        regList = new ArrayList<Register>();
        for (int i = 0; i < 24; ++i)
            regList.add(new Register(i));
    }

    public Register get(int i) {
        return regList.get(i);
    }

    public Register get(String str) {
        if (str.equals("rsp")) return regList.get(20);
        if (str.equals("rbp")) return regList.get(21);
        if (str.equals("rsi")) return regList.get(22);
        if (str.equals("rdi")) return regList.get(23);
        if (str.contains("x")) return regList.get(16 + str.charAt(1) - 'a');
        else return regList.get(Integer.parseInt(str.substring(1)));
    }
}
