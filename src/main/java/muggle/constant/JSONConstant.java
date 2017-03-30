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

    public static final String HEADER_PATH = "path";

    public static final String RESULT_CODE = "resultCode";

    public static final String QUESTIONS = "questions";

    public static final String ANSWER = "answer";

    public static final String EXAMINATIONS = "examinations";

    public static final String RESOURCE_PATH = "path";

    public static final String RESOURCE_VOLIDATE = "volidate";

    public static final String EXAM_MD5 = "exam_md5";

    public static final String KEY_MD5 = "key_md5";

    public static final String RADIO_MD5 = "radio_md5";

    public static final String NEWS = "news";

    public static final String USER_ID  = "u_id";

    public static final String USER = "user";

    public static final String DEFAULT_RESULT_CODE = "DEFAULT_RESULT_CODE";

    public static final String SQL_EXECUTE_EXCEPTION = "SQL_EXECUTE_EXCEPTION";

    public static final String SUCCESS = "SUCCESS";

    public static final String ACCOUNT_IS_EXISTS = "ACCOUNT_IS_EXISTS";

    public static final String ACCOUNT_PASSWORD_WRONG = "ACCOUNT_PASSWORD_WRONG";

    public static final String MODIFY_MESSAGE_ERROR = "MODIFY_MESSAGE_ERROR";

    public static final String ACCOUNT_IS_NOT_EXISTS = "ACCOUNT_IS_NOT_EXISTS";

    public static final String NO_SUCH_EXAM = "NO_SUCH_EXAM";

    public static final String JSON_ANALYZE_ERROR = "JSON_ANALYZE_ERROR";

    private static Map<String,Integer> instance = new HashMap<String, Integer>();

    static {

        instance.put(DEFAULT_RESULT_CODE,100);
        instance.put(SQL_EXECUTE_EXCEPTION,101);
        instance.put(NO_SUCH_EXAM,198);
        instance.put(ACCOUNT_IS_NOT_EXISTS,199);
        instance.put(ACCOUNT_IS_EXISTS,200);
        instance.put(ACCOUNT_PASSWORD_WRONG,201);
        instance.put(MODIFY_MESSAGE_ERROR,202);
        instance.put(SUCCESS,400);
        instance.put(JSON_ANALYZE_ERROR,500);
    }

    public static int getStatusCode(String key){
        return instance.get(key);
    }

}
