package muggle.tools;/**
 * Created by JuN on 2017/3/27.
 */

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间字符串的包装类
 *
 * @authorJuN
 * @create2017-03-27 10:59
 */
public class FormateTime {

    public static String getCurrentTime(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd&HH:mm:ss");
        String now = format.format(date);
        return now;
    }
}
