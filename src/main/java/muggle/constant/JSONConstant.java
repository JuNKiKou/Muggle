package muggle.constant;/**
 * Created by JuN on 2017/3/24.
 */

import java.util.HashMap;
import java.util.Map;

/**
 * json 包装中的常量定义
 *
 * @authorJuN
 * @create2017-03-24 14:24
 */
public class JSONConstant {

    public static final String RESULT_CODE = "resultCode";

    public static final String USER_ID  = "u_id";

    public static final String USER = "user";

    public static final String DEFAULT_RESULT_CODE = "DEFAULT_RESULT_CODE";

    public static final String SQL_EXECUTE_EXCEPTION = "SQL_EXECUTE_EXCEPTION";

    public static final String SUCCESS = "SUCCESS";

    public static final String ACCOUNT_IS_EXISTS = "ACCOUNT_IS_EXISTS";

    public static final String ACCOUNT_PASSWORD_WRONG = "ACCOUNT_PASSWORD_WRONG";

    private static Map<String,Integer> instance = new HashMap<String, Integer>();

    static {

        instance.put(DEFAULT_RESULT_CODE,100);
        instance.put(SQL_EXECUTE_EXCEPTION,101);
        instance.put(ACCOUNT_IS_EXISTS,200);
        instance.put(ACCOUNT_PASSWORD_WRONG,201);
        instance.put(SUCCESS,400);
    }

    public static int getStatusCode(String key){
        return instance.get(key);
    }

}