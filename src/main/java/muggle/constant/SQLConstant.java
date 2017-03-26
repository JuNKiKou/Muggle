package muggle.constant;/**
 * Created by JuN on 2017/3/24.
 */

/**
 * 存储过程调用中的各种常量
 *
 * @authorJuN
 * @create2017-03-24 14:59
 */
public class SQLConstant {

    public static final String USER_ID_INIT = "U000000000000001";

    public static final String SQL_PROCEDURE_GET_USER_ID = "{call getUserId()}";

    public static final String USER_NICK_HEAD = "用户";

    public static final String USER_HEAD = "U";

    public static final String QUESTION_HEAD = "Q";

    public static final String EXAMINATION_HEAD = "E";

    public static final String ANSWER_HEAD = "A";

    public static final String EXAMINATION_RESOURCE_HEAD = "ER";

    public static final String KEY_RESOURCE_HEAD = "KR";

    public static final String RADIO_RESOURCE_HEAD = "RR";

    public static final String QUESTION_COLLECTION_HEAD = "QC";

    public static final String EXAMINATION_COLLECTION_HEAD = "EC";

    public static final String QUESTION_VISIT_HEAD = "QV";

    public static final String EXAMINATION_VISIT_HEAD = "EV";

    public static final String QUESTION_STAR_HEAD = "QS";

    public static final String EXAMINATION_STAR_HEAD = "ES";

    public static final String EXAMINATION_DOWNLOAD_HEAD = "ED";

    public static final String SQL_PROCEDURE_REGISTER = "{call register(?,?,?,?,?)}";

    public static final String SQL_PROCEDURE_LOGIN = "{call login(?,?,?)}";

    public static final String SQL_GET_USER_ID_EXCEPTION = "获取用户ID的数据库操作出错";

    public static final String SQL_REGISTER_EXCEPTION = "注册出错";

    public static final String SQL_LOGIN_EXCEPTION = "登录出错";
}
