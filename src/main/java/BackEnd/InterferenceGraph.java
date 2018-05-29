package BackEnd;

import IRCode.Operand.*;

import java.util.*;

public class InterferenceGraph {

    class Node {
        Variable var;
        int degree = 0;
        public boolean selected = false;
        public int color = -1;
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

    public HashSet<Node> nodeSet = new HashSet<Node>();
    HashMap<Variable, Node> varMap = new HashMap<Variable, Node>();

    public void addNode(Variable var) {
        Node node = varMap.get(var);
        if (node == null) {
            varMap.put(var, node = new Node(var));
            nodeSet.add(node);
        }
    }

    public void addEdge(Variable uVar, Variable vVar) {
        Node u = varMap.get(uVar);
        Node v = varMap.get(vVar);
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
