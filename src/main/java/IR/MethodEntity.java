package IR;

import IR.IRCode.*;
import IR.IRCode.Variable.*;

import java.util.*;

public class MethodEntity {

    public String methodName;
    public LinkedList<Variable> formalParaVarList = new LinkedList<Variable>();
    public LinkedList<IRCode> codeList = new LinkedList<IRCode>();
    public LinkedList<BasicBlock> basicBlockList = new LinkedList<BasicBlock>();
}
