package IRVisitor.CFG;

import IRCode.*;

import java.util.*;

public class CFGGenerator {

    ArrayList<IRCode> irCodeList;
    LinkedList<String>[] label;
    CFG cfg;

    public CFG generateCFG(ArrayList<IRCode> irCodeList, LinkedList<String>[] label) {
        this.irCodeList = irCodeList;
        this.label = label;
        this.cfg = new CFG();
        int n = irCodeList.size();
        CFG.Node currentBlock = null;
        for (int i = 0; i < n; ++i) {
            if (!label[i].isEmpty()) {
                CFG.Node node = new CFG.Node();
                node.leadLabelList = label[i];
                currentBlock = node;
                cfg.addNode(node);
            }
            IRCode ir = irCodeList.get(i);
            currentBlock.basicBlock.addLast(ir);
        }
        cfg.addEdge();
        return cfg;
    }

}