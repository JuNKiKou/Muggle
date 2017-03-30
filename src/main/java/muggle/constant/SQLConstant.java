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

    public static final String EXAMINATION_STAR_ID_INIT = "ES00000000000001";

    public static final String EXAMINATION_COLLECTION_ID_INIT = "EC00000000000001";

    public static final String ID_INIT = "0000000000000001";

    public static final String SQL_PROCEDURE_GET_USER_ID = "{call getUserId()}";

    public static final String SQL_PROCEDURE_GET_STUDY_STATUS_ID = "{call getStudyStatusId()}";

    public static final String SQL_PROCEDURE_GET_ADVICE_ID = "{call getAdviceId()}";

    public static final String SQL_PROCEDURE_GET_STAR_ID = "{call getStarId()}";

    public static final String SQL_PROCEDURE_GET_COLLECTION_ID = "{call getCollectionId()}";

    public static final String USER_NICK_HEAD = "用户";

    public static final String ID_HEAD = "";

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

    public static final String SQL_PROCEDURE_MODIFY_AGE = "{call modifyAge(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_HEADER = "{call modifyHeader(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_NICK = "{call modifyNickName(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_PLACE = "{call modifyPlace(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_SEX = "{call modifySex(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_SIGN = "{call modifySign(?,?,?)}";

    public static final String SQL_PROCEDURE_MODIFY_PWD = "{call modifyPassword(?,?,?,?)}";

    public static final String SQL_PROCEDURE_SET_STUDY_STATUS = "{call setStudyStatus(?,?,?,?)}";

    public static final String SQL_PROCEDURE_GIVE_ADVICE = "{call giveAdvice(?,?,?,?)}";

    public static final String SQL_PROCEDURE_SEARCH_QUESTION = "{call searchQuestion(?,?,?,?)}";

    public static final String SQL_PROCEDURE_SEARCH_EXAMINATION = "{call searchExamination(?,?,?,?)}";

    public static final String SQL_PROCEDURE_GET_NEWS = "{call getNews()}";

    public static final String SQL_PROCEDURE_STAR = "{call star(?,?,?,?,?)}";

    public static final String SQL_PROCEDURE_COLLECT = "{call collect(?,?,?,?)}";

    public static final String SQL_GET_GENERAL_ID_EXCEPTION = "获取编号数据库操作出错";

    public static final String SQL_REGISTER_EXCEPTION = "注册出错";

    public static final String SQL_LOGIN_EXCEPTION = "登录出错";

    public static final String SQL_MODIFY_MESSAGE_EXCEPTION = "修改信息出错";

    public static final String SQL_SEARCH_EXCEPTION = "查找内容出错";

    public static final String SQL_GET_NEWS_EXCEPTION = "获取最新资源出错";

    public static final String SQL_EXAMINATION_STAR_EXCEPTION = "评分资源出错";

    public static final String SQL_EXAMINATION_COLLECT_EXCEPTION = "收藏资源出错";
}
