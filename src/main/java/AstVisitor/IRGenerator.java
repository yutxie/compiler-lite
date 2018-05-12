package AstVisitor;

import AstNode.*;
import IRCode.*;
import Scope.*;

import java.util.*;

public class IRGenerator extends AstVisitor {

    LinkedList<IRCode> irCodeList;
    LinkedList<Scope> scopeStack;
    LinkedList<IRCode> breakStack;
    LinkedList<IRCode> continueStack;
    HashMap<String, IRCode> labelMap;

    public IRGenerator() {
        irCodeList = new LinkedList<IRCode>();
        scopeStack = new LinkedList<Scope>();
        breakStack = new LinkedList<IRCode>();
        continueStack = new LinkedList<IRCode>();
        labelMap = new HashMap<String, IRCode>();
    }

    public LinkedList<IRCode> generateIR(ProgramNode prog) {
        scopeStack.addLast(prog.scope);
        return irCodeList;
    }

    Scope currentScope() {
        return scopeStack.getLast();
    }

    Scope popScope() {
        return scopeStack.pop();
    }

    void pushScope(Scope scope) {
        scopeStack.push(scope);
    }

    @Override
    void visit(ProgramNode node) {

    }
}
