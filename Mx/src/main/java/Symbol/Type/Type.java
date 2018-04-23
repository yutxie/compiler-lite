package Symbol.Type;

import java.lang.*;

public abstract class Type {

    public String getTypeName() {
        return this.getClass().getName();
    }
}
