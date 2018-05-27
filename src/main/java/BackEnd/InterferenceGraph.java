package BackEnd;

import IR.IRCode.Operand.*;

import java.util.*;

public class InterferenceGraph {

    class Node {
        Variable var;
        int degree = 0;
        HashSet<Node> edges = new HashSet<Node>();

        Node(Variable var) {
            this.var = var;
        }

        void addEdge(Node node) {
            if (edges.contains(node)) return;
            edges.add(node);
            ++degree;
        }
    }

    HashSet<Node> nodeSet = new HashSet<Node>();
    HashMap<Variable, Node> varMap = new HashMap<Variable, Node>();

    public void addEdge(Variable uVar, Variable vVar) {
        Node u = varMap.get(uVar);
        if (u == null) varMap.put(uVar, u = new Node(uVar));
        Node v = varMap.get(vVar);
        if (v == null) varMap.put(vVar, v = new Node(vVar));
        nodeSet.add(u);
        nodeSet.add(v);
        if (u == v) return;
        u.addEdge(v);
        v.addEdge(u);
    }

    public void printInformation() {
        for (Node u : nodeSet) {
            System.out.print(u.var.getName() + ":");
            for (Node v : u.edges)
                System.out.print(" " + v.var.getName());
            System.out.println();
        }
    }
}
