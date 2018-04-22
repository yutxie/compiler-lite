package Symbol;

import AstNode.*;
import java.util.*;

public class LocalScope extends Scope {

    public Scope parent;
    public Map<String, DefinitionExpressionNode> variables;
}