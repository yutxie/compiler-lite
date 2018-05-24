package IRVisitor.CFG;

import IRCode.*;

import java.util.*;

public class CFG {

    public static class Node {
        LinkedList<String> leadLabelList;
        LinkedList<IRCode> basicBlock;

        public Node() {
            leadLabelList = new LinkedList<String>();
            basicBlock = new LinkedList<IRCode>();
        }
    }

    public HashMap<Node, LinkedList<Node>> edgeMap;
    public HashMap<String, Node> labelMap;

    public CFG() {
        edgeMap = new HashMap<Node, LinkedList<Node>>();
        labelMap = new HashMap<String, Node>();
    }

    public void addNode(Node node) {
        edgeMap.put(node, new LinkedList<Node>());
        for (String item : node.leadLabelList)
            labelMap.put(item, node);
    }

    public void addEdge() {
        for (Node node : edgeMap.keySet()) {
            LinkedList<Node> toNode = edgeMap.get(node);
            for (IRCode ir : node.basicBlock)
                if (ir instanceof Jump) {
                    String targetLabel = ((Jump) ir).targetLabel;
                    toNode.addLast(labelMap.get(targetLabel));
                }
        }
    }

    public void printInformation() {
        for (Node node: edgeMap.keySet()) {
            System.out.print("=============== node");
            for (String label : node.leadLabelList)
                System.out.print(" " + label);
            System.out.print(":\n");
            for (IRCode ir : node.basicBlock)
                ir.printInformation();
            System.out.print("                                            edge to:");
            for (Node toNode : edgeMap.get(node))
                System.out.print(" " + toNode.leadLabelList.getFirst());
            System.out.print("\n");
        }
    }
}
