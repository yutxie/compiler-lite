package IR;

import IRCode.*;

import java.util.*;

public class CFG {

    public LinkedList<BasicBlock> basicBlockList = new LinkedList<BasicBlock>();
    public HashMap<String, BasicBlock> labelMap = new HashMap<String, BasicBlock>();

    public void addBasicBlock(BasicBlock node) {
        basicBlockList.add(node);
        labelMap.put(node.leadLabel, node);
    }

    public void addEdge() {
        for (BasicBlock u : basicBlockList)
            for (IRCode ins : u.codeList)
                if (ins instanceof Jump) {
                    String targetLabel = ((Jump) ins).targetLabel;
                    BasicBlock v = labelMap.get(targetLabel);
                    u.successorSet.add(v);
                    v.predecessorSet.add(u);
                }
    }

    public void addEdge(BasicBlock u, BasicBlock v) {
        u.successorSet.add(v);
        v.predecessorSet.add(u);
    }

    public void reduceNop() {
        for (BasicBlock node : basicBlockList) {
            if (node.codeList.size() <= 1) continue;
            if (node.codeList.getFirst() instanceof Nop)
                node.codeList.removeFirst();
        }
    }

    public void printInformation() {
        for (BasicBlock node: basicBlockList)
            node.printInformation();
    }
}
