package IR.IRCode.Operand;

import java.util.HashSet;

public class Address extends Operand {

    public int offestNumber = 0;
    public int scale = 1;
    public Register base;
    public Register offsetReg;

    @Override
    public HashSet<Variable> colorable() {
        return new HashSet<Variable>();
    }

    @Override
    public String getName() {
        String scaleStr = "";
        if (offsetReg != null)
            scaleStr = offsetReg.getName() + "*" + scale + " + ";
        return "[" + base.getName() + " + " + scaleStr + offestNumber + "]";
    }
}
