package muggle.controller.helper;/**
 * Created by JuN on 2017/3/26.
 */

import muggle.constant.ResponseConstant;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 返回json形式的数据的工具类
 *
 * @authorJuN
 * @create2017-03-26 10:30
 */
public class JsonHelper {

    public static void showJson(HttpServletResponse response,String result){
        response.setCharacterEncoding(ResponseConstant.CHARSET_UTF8);
        response.setContentType(ResponseConstant.CONTENT_TYPE_JSON_TYPE);
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (out != null){
                out.close();
            }
        }
    }

}
