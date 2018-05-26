package IR;

import IR.IRCode.*;

import java.util.*;

public class CFG {

    public HashMap<BasicBlock, LinkedList<BasicBlock>> edgeMap
        = new HashMap<BasicBlock, LinkedList<BasicBlock>>();
    public HashMap<String, BasicBlock> labelMap = new HashMap<String, BasicBlock>();

    public void addBasicBlock(BasicBlock node) {
        edgeMap.put(node, new LinkedList<BasicBlock>());
        labelMap.put(node.leadLabel, node);
    }

    public void addEdge() {
        for (BasicBlock node : edgeMap.keySet()) {
            LinkedList<BasicBlock> toBasicBlock = edgeMap.get(node);
            for (IRCode ir : node.codeList)
                if (ir instanceof Jump) {
                    String targetLabel = ((Jump) ir).targetLabel;
                    toBasicBlock.addLast(labelMap.get(targetLabel));
                }
        }
    }

    public void printInformation() {
        for (BasicBlock node: edgeMap.keySet()) {
            System.out.print("=============== node");
            System.out.print(" " + node.leadLabel);
            System.out.print(":\n");
            for (IRCode ir : node.codeList)
                ir.printInformation();
//            System.out.print("                                            edge to:");
//            for (BasicBlock toBasicBlock : edgeMap.get(node))
//                System.out.print(" " + toBasicBlock.leadLabel);
//            System.out.print("\n");
        }
    }

    public void resolveEdges() {
        for (BasicBlock node : edgeMap.keySet()) {
            LinkedList<BasicBlock> edgeList = edgeMap.get(node);
            for (BasicBlock toNode : edgeList) {
                node.successorList.addLast(toNode);
                toNode.predecessorList.addLast(node);
            }
        }
    }
}
