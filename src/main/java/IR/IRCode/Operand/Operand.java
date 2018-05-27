package IR.IRCode.Operand;

import java.util.*;

public abstract class Operand {

    public abstract HashSet<Variable> colorable();

    public abstract String getName();
}
