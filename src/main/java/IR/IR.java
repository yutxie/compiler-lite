package IR;

import IRCode.Operand.*;

import java.util.*;

public class IR {

    public BasicBlock global = new BasicBlock("");
    public LinkedList<MethodEntity> methodList = new LinkedList<MethodEntity>();
    public LinkedList<Variable> globalVarList = new LinkedList<Variable>();

    public void printInformation() {
        for (MethodEntity methodEntity : methodList)
            methodEntity.printInformation();
    }
}
