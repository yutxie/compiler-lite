package IR;

import IR.IRCode.IRCode;
import IR.IRCode.Variable.*;

import java.util.*;

public class IR {

    public BasicBlock global = new BasicBlock("");
    public LinkedList<MethodEntity> methodList = new LinkedList<MethodEntity>();

    public void printInformation() {
        for (MethodEntity methodEntity : methodList) {
            System.out.print(methodEntity.methodName + " ");
            for (Variable para : methodEntity.formalParaVarList)
                System.out.print(para.id() + " ");
            System.out.print("{\n");
            if (!methodEntity.basicBlockList.isEmpty())
                for (BasicBlock bb : methodEntity.basicBlockList) {
                    System.out.print("\t" + bb.leadLabel + "\n");
                    for (IRCode ins : bb.codeList) {
                        System.out.print("\t\t");
                        ins.printInformation();
                    }
                }
            else for (IRCode ins : methodEntity.codeList) {
                if (ins.label != null) System.out.print("\t" + ins.label + "\n");
                System.out.print("\t\t");
                ins.printInformation();
            }
            System.out.print("}\n");
        }
    }
}
