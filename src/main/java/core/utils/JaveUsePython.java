package core.utils;

import java.io.IOException;

public class JaveUsePython {
	    /**
	     *
	      * @param path  python文件路径
	     * @throws IOException
	     */
	    public static void runPy(String path) throws IOException {
            Runtime.getRuntime().exec("cmd /k  start python " + path);
	        System.out.println("cmd /k start python "+path);
	    }


}
