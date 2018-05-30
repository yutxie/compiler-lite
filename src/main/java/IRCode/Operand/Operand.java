package IRCode.Operand;

import java.util.*;

public abstract class Operand {

    public abstract HashSet<Variable> colorable();
    public abstract HashSet<Variable> colorableInIndexOrMember();

    public abstract String getName();
}
