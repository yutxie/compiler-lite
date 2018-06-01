package BackEnd;

import java.io.*;

public class BuiltinPrinter {

    void printBuiltin(String methodName) throws IOException {
        String dir = "";
        OutputStream os = System.out;
        InputStream is = new FileInputStream("code/builtin_" + methodName + ".txt");
        int b;
        while((b = is.read()) != -1) {
            os.write(b);
        }
        is.close();
    }
}
