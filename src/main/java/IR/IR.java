package IR;

import IRCode.Operand.*;

import java.util.*;

public class IR {

    public LinkedList<MethodEntity> methodList = new LinkedList<MethodEntity>();
    public LinkedList<Variable> globalVarList = new LinkedList<Variable>();
    public LinkedList<String> stringConstList = new LinkedList<String>();

    public void printInformation() {
        for (MethodEntity methodEntity : methodList)
            methodEntity.printInformation();
    }
}
