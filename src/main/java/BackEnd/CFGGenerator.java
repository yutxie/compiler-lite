package BackEnd;

import IR.*;
import IR.IRCode.*;

public class CFGGenerator {

    public void generateCFG(IR ir) {
        for (MethodEntity methodEntity : ir.methodList) {
            CFG cfg = new CFG();
            int n = methodEntity.codeList.size();
            BasicBlock currentBlock = null;
            for (int i = 0; i < n; ++i) {
                IRCode ins = methodEntity.codeList.get(i);
                if (ins.label != null) {
                    BasicBlock node = new BasicBlock(ins.label);
                    currentBlock = node;
                    cfg.addBasicBlock(node);
                }
                currentBlock.codeList.addLast(ins);
            }
            cfg.addEdge();
            cfg.resolveEdges();
            for (BasicBlock bb : cfg.edgeMap.keySet())
                methodEntity.basicBlockList.addLast(bb);
        }
    }
}