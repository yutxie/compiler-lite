package IRCode.Operand;

import java.util.HashSet;

public class Address extends Operand {

    public int offsetNumber = 0;
//    public int scale = 1;
    public Register base;
//    public Register offsetReg;

    @Override
    public HashSet<Variable> colorable() {
        return new HashSet<Variable>();
    }

    @Override
    public String getName() {
        String offsetStr = "";
        if (offsetNumber >= 0) offsetStr = "+" + offsetNumber;
        else offsetStr = String.valueOf(offsetNumber);
        return "qword [" + base.getName() + offsetStr + "]";
//        String scaleStr = "";
//        if (offsetReg != null)
//            scaleStr = offsetReg.getName() + "*" + scale + " + ";
//        return "qword [" + base.getName() + " + " + scaleStr + offestNumber + "]";
    }
}
