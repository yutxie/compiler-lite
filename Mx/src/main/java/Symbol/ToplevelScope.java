package Symbol;

import AstNode.*;

import java.util.*;

public class ToplevelScope extends Scope {

//    public Map<String, Entity> entities;
    public List<DefinitionExpressionNode> staticLocalVariables;
}