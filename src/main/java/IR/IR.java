package IR;

import java.util.*;

public class IR {

    public BasicBlock global = new BasicBlock("");
    public LinkedList<MethodEntity> methodList = new LinkedList<MethodEntity>();

    public void printInformation() {
        for (MethodEntity methodEntity : methodList)
            methodEntity.printInformation();
    }
}
