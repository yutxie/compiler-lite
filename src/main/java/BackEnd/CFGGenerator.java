package BackEnd;

import IR.*;
import IRCode.*;

public class CFGGenerator {

    public void generateCFG(IR ir) {
        for (MethodEntity method : ir.methodList) {
            CFG cfg = new CFG();
            int n = method.codeList.size();
            BasicBlock currentBlock = new BasicBlock(method.methodName + "_entry");
            currentBlock.codeList.addLast(new Nop());
            cfg.addBasicBlock(currentBlock);
            for (int i = 0; i < n; ++i) {
                IRCode ins = method.codeList.get(i);
                if (ins.label != null) {
                    BasicBlock node = new BasicBlock(ins.label);
                    cfg.addBasicBlock(node);
                    cfg.addEdge(currentBlock, node);
                    currentBlock = node;
                }
                currentBlock.codeList.addLast(ins);
            }
            cfg.addEdge();
            cfg.reduceNop();
            method.basicBlockList = cfg.basicBlockList;
        }
    }
}