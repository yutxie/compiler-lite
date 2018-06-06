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
            LinkedList<IRCode> codeList = new LinkedList<IRCode>();
            for (IRCode ins : node.codeList) {
                if (ins instanceof Nop) {
                    Nop nop = (Nop) ins;
                    if (nop.realName == null) continue;
                }
                codeList.addLast(ins);
            }
            if (codeList.isEmpty()) codeList.addLast(new Nop());
            node.codeList = codeList;
        }
    }

    public void reduceJump() {
        int n = basicBlockList.size();
        for (int i = 0; i < n - 1; ++i) {
            BasicBlock u = basicBlockList.get(i);
            BasicBlock v = basicBlockList.get(i + 1);
            IRCode ins = u.codeList.getLast();
            if (!(ins instanceof Jump)) continue;
            Jump jump = (Jump) ins;
            if (jump.type != Jump.Type.JMP) continue;
            if (jump.targetLabel != v.leadLabel) continue;
            u.codeList.removeLast();
            if (u.codeList.isEmpty())
                u.codeList.addLast(new Nop());
        }
    }

    public void printInformation() {
        for (BasicBlock node: basicBlockList)
            node.printInformation();
    }
}
