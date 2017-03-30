package muggle.tools;/**
 * Created by JuN on 2017/3/30.
 */

/**
 * 格式化文件名称的类
 *
 * @authorJuN
 * @create2017-03-30 10:27
 */
public class FormateName {

    public static String formate(String path){
        int index = path.lastIndexOf("/");
        return path.substring(index + 1);
    }

}
