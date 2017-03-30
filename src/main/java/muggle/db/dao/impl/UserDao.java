package muggle.db.dao.impl;/**
 * Created by JuN on 2017/3/24.
 */

import muggle.constant.JSONConstant;
import muggle.constant.SQLConstant;
import muggle.db.dao.IUser;
import muggle.db.unity.DB;
import muggle.entity.*;
import muggle.tools.FormateId;
import org.json.JSONArray;
import org.json.JSONObject;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;

import java.lang.reflect.Type;
import java.sql.*;

/**
 * 用户的方法
 *
 * @authorJuN
 * @create2017-03-24 14:21
 */
public class UserDao extends GeneralDao implements IUser{

    //单例模式
    private UserDao() {}

    private static final UserDao instance = new UserDao();

    public static UserDao getInstance(){
        return instance;
    }

    public String register(String phone, String password) {
        JSONObject result = new JSONObject();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        Connection connection = getConnection();


        //生成用户的ID信息
        String sql = SQLConstant.SQL_PROCEDURE_GET_USER_ID;
        String generalId = null;
        generalId = FormateId.getGeneralId(connection,sql,SQLConstant.USER_ID_INIT,SQLConstant.USER_HEAD);

        //插入数据
        int code;
        sql = SQLConstant.SQL_PROCEDURE_REGISTER;
        System.out.println(sql);
        String nick = SQLConstant.USER_NICK_HEAD + generalId;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            System.out.println(generalId);
            statement.setString(2,phone);
            System.out.println(phone);
            statement.setString(3,password);
            System.out.println(password);
            statement.setString(4,nick);
            System.out.println(nick);
            statement.registerOutParameter(5,Types.INTEGER);
            statement.execute();
            code = statement.getInt(5);
            statement.close();

            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else if (code == 0){
                resultCode = JSONConstant.getStatusCode(JSONConstant.ACCOUNT_IS_EXISTS);
            }
        } catch (SQLException e) {
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            System.out.println(SQLConstant.SQL_REGISTER_EXCEPTION);
            e.printStackTrace();
        }

        closeConnection(connection);
        result.put(JSONConstant.RESULT_CODE,resultCode);
        result.put(JSONConstant.USER_ID,generalId);

        return result.toString();
    }

    public String login(String phone, String password) {
        Connection connection = getConnection();
        JSONObject result = new JSONObject();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);

        String sql = SQLConstant.SQL_PROCEDURE_LOGIN;
        int code;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,phone);
            statement.setString(2,password);
            statement.registerOutParameter(3,Types.INTEGER);
            statement.execute();
            code = statement.getInt(3);
            if (code == 1){
                //遍历结果，包装
                ResultSet set = statement.getResultSet();
                EUser user = new EUser();
                while (set.next()){
                    user.setId(set.getString(1));
                    user.setPhone(set.getString(2));
                    user.setAdmin(set.getBoolean(3));
                    user.setPassword(set.getString(4));
                    user.setSign(set.getString(10));
                    user.setHeader(set.getString(5));
                    user.setNick(set.getString(6));
                    user.setSex(set.getBoolean(7));
                    user.setAge(set.getInt(8));
                    user.setPlace(set.getInt(9));
                }
                set.close();
                JSONObject u = new JSONObject();
                EUser.fixValue(u,user);
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
                result.put(JSONConstant.USER,u);
            }else if (code == 0){
                resultCode = JSONConstant.getStatusCode(JSONConstant.ACCOUNT_PASSWORD_WRONG);
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_LOGIN_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        result.put(JSONConstant.RESULT_CODE,resultCode);


        return result.toString();
    }

    public String modifyAge(String id, int age) {

        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_AGE;
        return modify(sql,id,age,1);
    }

    public String modifyHeader(String id, String header) {
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_HEADER;
        return modify(sql,id,header,0);
    }

    public String modifyNickName(String id, String nick) {
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_NICK;

        return modify(sql,id,nick,0);
    }

    public String modifySex(String id, boolean sex) {
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_SEX;
        return modify(sql,id,sex,2);
    }

    public String modifySign(String id, String sign) {
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_SIGN;
        return modify(sql,id,sign,0);
    }

    public String modifyPlace(String id, int place) {
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_PLACE;
        return modify(sql,id,place,1);
    }

    private String modify(String sql,String id,Object param,int flag){
        JSONObject object = new JSONObject();
        Connection connection = getConnection();
        int resultCode;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,id);
            switch (flag){

                case 0:
                    statement.setString(2,(String) param);
                    break;
                case 1:
                    statement.setInt(2,(Integer) param);
                    break;
                case 2:
                    statement.setBoolean(2,(Boolean) param);
                    break;
                default:
                    statement.setString(2,(String) param);
                    break;

            }
            statement.registerOutParameter(3,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(3);
            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else {
                resultCode = JSONConstant.getStatusCode(JSONConstant.MODIFY_MESSAGE_ERROR);
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_MODIFY_MESSAGE_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);

        return object.toString();

    }

    public String modifyPassword(String id, String o_pwd, String n_pwd) {
        JSONObject object = new JSONObject();
        Connection connection = getConnection();
        String sql = SQLConstant.SQL_PROCEDURE_MODIFY_PWD;
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,id);
            statement.setString(2,o_pwd);
            statement.setString(3,n_pwd);
            statement.registerOutParameter(4,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(4);
            switch (code){
                case 1:
                    resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
                    break;
                case 0:
                    //没有这样的用户
                    resultCode = JSONConstant.getStatusCode(JSONConstant.ACCOUNT_IS_NOT_EXISTS);
                    break;
                case -1:
                    //账号密码错误
                    resultCode = JSONConstant.getStatusCode(JSONConstant.ACCOUNT_PASSWORD_WRONG);
                    break;
                default:
                    resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
                    break;
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_MODIFY_MESSAGE_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        return object.toString();
    }

    public String setStudyStatus(String id, int rank) {
        JSONObject object = new JSONObject();
        Connection connection = getConnection();
        String sql = SQLConstant.SQL_PROCEDURE_GET_STUDY_STATUS_ID;
        String generalId;
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        generalId = FormateId.getGeneralId(connection,sql,SQLConstant.ID_INIT,SQLConstant.ID_HEAD);

        sql = SQLConstant.SQL_PROCEDURE_SET_STUDY_STATUS;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            statement.setString(2,id);
            statement.setInt(3,rank);
            statement.registerOutParameter(4,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(4);
            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else {
                resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            }
            statement.close();
        } catch (SQLException e) {
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        return object.toString();
    }

    public String giveAdvice(String id, String content) {
        JSONObject object = new JSONObject();
        Connection connection = getConnection();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        String sql = SQLConstant.SQL_PROCEDURE_GET_ADVICE_ID;
        String generalId = FormateId.getGeneralId(connection,sql,SQLConstant.ID_INIT,SQLConstant.ID_HEAD);
        sql = SQLConstant.SQL_PROCEDURE_GIVE_ADVICE;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            statement.setString(2,id);
            statement.setString(3,content);
            statement.registerOutParameter(4,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(4);
            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else {
                resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            }
            statement.close();
        } catch (SQLException e) {
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        return object.toString();
    }

    public String search(String keyword, int type, int rank, int method) {
        JSONObject object = new JSONObject();
        JSONArray questions = new JSONArray();
        JSONArray examinations = new JSONArray();
        Connection connection = getConnection();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        String sql = SQLConstant.SQL_PROCEDURE_SEARCH_QUESTION;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,keyword);
            statement.setInt(2,type);
            statement.setInt(3,rank);
            statement.setInt(4,method);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set != null && set.next()){
                Question question = new Question(set.getString(1),set.getInt(2),set.getInt(3),set.getDouble(4));
                JSONObject item = new JSONObject();
                Question.fixValue(item,question);
                questions.put(item);
            }
            set.close();
            statement.close();
            sql = SQLConstant.SQL_PROCEDURE_SEARCH_EXAMINATION;
            CallableStatement statement2 = connection.prepareCall(sql);
            statement2.setString(1,keyword);
            statement2.setInt(2,type);
            statement2.setInt(3,rank);
            statement2.setInt(4,method);
            statement2.execute();
            ResultSet set2 = statement2.getResultSet();
            while (set2 != null && set2.next()){
                Examination examination = new Examination(set2.getString(1),set2.getInt(2),set2.getInt(3),set2.getDouble(4),set2.getInt(5));
                JSONObject item = new JSONObject();
                Examination.fixValue(item,examination);
                examinations.put(item);
            }
            set2.close();
            statement2.close();
            resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_SEARCH_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        object.put(JSONConstant.QUESTIONS,questions);
        object.put(JSONConstant.EXAMINATIONS,examinations);
        return object.toString();
    }

    public String getNews() {
        JSONObject object = new JSONObject();
        JSONArray array = new JSONArray();
        Connection connection = getConnection();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        String sql = SQLConstant.SQL_PROCEDURE_GET_NEWS;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set != null && set.next()){
                News news = new News(set.getString(1),set.getString(2),set.getDate(3).toString());
                JSONObject item = new JSONObject();
                News.fixValue(item,news);
                array.put(item);
            }
            set.close();
            statement.close();
            resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_GET_NEWS_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }

        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        object.put(JSONConstant.NEWS,array);
        return object.toString();
    }

    public String star(String user, String exam, double value) {
        JSONObject object = new JSONObject();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        Connection connection = getConnection();
        String sql = SQLConstant.SQL_PROCEDURE_GET_STAR_ID;
        String generalId = FormateId.getGeneralId(connection,sql,SQLConstant.EXAMINATION_STAR_ID_INIT,SQLConstant.EXAMINATION_STAR_HEAD);

        sql = SQLConstant.SQL_PROCEDURE_STAR;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            statement.setString(2,user);
            statement.setString(3,exam);
            statement.setDouble(4,value);
            statement.registerOutParameter(5,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(5);
            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else {
                resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_EXAMINATION_STAR_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        return object.toString();
    }

    public String collect(String user, String exam) {
        JSONObject object = new JSONObject();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        Connection connection = getConnection();
        String sql = SQLConstant.SQL_PROCEDURE_GET_COLLECTION_ID;
        String generalId = FormateId.getGeneralId(connection,sql,SQLConstant.EXAMINATION_COLLECTION_ID_INIT,SQLConstant.EXAMINATION_COLLECTION_HEAD);
        sql = SQLConstant.SQL_PROCEDURE_COLLECT;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            statement.setString(2,user);
            statement.setString(3,exam);
            statement.registerOutParameter(4,Types.INTEGER);
            statement.execute();
            int code = statement.getInt(4);
            if (code == 1){
                resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
            }else {
                resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_EXAMINATION_COLLECT_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        return object.toString();
    }

    public String download(String id, String exam, int type) {
        JSONObject object = new JSONObject();
        Connection connection = getConnection();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        String sql = SQLConstant.SQL_PROCEDURE_GET_RESOURCE;
        String path = null;
        String volidate = null;
        Resource resource = new Resource();
        try {
            CallableStatement statement  = connection.prepareCall(sql);
            statement.setString(1,exam);
            ResultSet set = statement.getResultSet();
            while (set != null && set.next()){
                resource.setExam(set.getString(1));
                resource.setEr_path(set.getString(2));
                resource.setEr_volidate(set.getString(3));
                resource.setKr_path(cutNull(set.getString(4)));
                resource.setKr_volidate(cutNull(set.getString(5)));
                resource.setRr_path(cutNull(set.getString(6)));
                resource.setRr_volidate(cutNull(set.getString(7)));
            }
            set.close();
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_GET_RESOURCE_MESSAGE_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        if (resource.getExam() == null){
            resultCode = JSONConstant.getStatusCode(JSONConstant.NO_SUCH_EXAM);
        }else {
            switch (type){
                case 0:
                    //试卷
                    path = resource.getEr_path();
                    volidate = resource.getEr_volidate();
                    break;
                case 1:
                    //答案
                    path = resource.getKr_path();
                    volidate = resource.getKr_volidate();
                    break;
                case 2:
                    //音频
                    path = resource.getRr_path();
                    volidate = resource.getRr_volidate();
                    break;
                default:
                    break;
            }
            resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        object.put(JSONConstant.RESOURCE_PATH,path);
        object.put(JSONConstant.RESOURCE_VOLIDATE,volidate);




        return object.toString();
    }

    public void addDownloadList(String user, String exam) {
        Connection connection = getConnection();
        String sql = SQLConstant.SQL_PROCEDURE_GET_DOWNLOAD_ID;
        String generalId = FormateId.getGeneralId(connection,sql,SQLConstant.EXAMINATION_DOWNLOAD_ID_INIT,SQLConstant.EXAMINATION_DOWNLOAD_HEAD);
        sql = SQLConstant.SQL_PROCEDURE_ADD_DOWNLOAD_LIST;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,generalId);
            statement.setString(2,user);
            statement.setString(3,exam);
            statement.registerOutParameter(4,Types.INTEGER);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_EXAMINATION_DOWNLOAD_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);

    }

    private String cutNull(String str){
        return (str != null) ? str : null;
    }

    public String getExamination(String exam) {
        JSONObject object = new JSONObject();
        JSONObject volidate = new JSONObject();
        JSONArray array = new JSONArray();
        Connection connection = getConnection();
        int resultCode = JSONConstant.getStatusCode(JSONConstant.DEFAULT_RESULT_CODE);
        String sql = SQLConstant.SQL_PROCEDURE_GET_EXAMINATION;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,exam);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set != null && set.next()){
                Entity entity = new Entity(set.getString(1),set.getString(2),set.getString(3),set.getString(4),set.getString(5));
                JSONObject item = new JSONObject();
                Entity.fixValue(item,entity);
                array.put(item);
            }
            set.close();
            sql = SQLConstant.SQL_PROCEDURE_GET_MD5;
            statement = connection.prepareCall(sql);
            statement.setString(1,exam);
            statement.execute();
            ResultSet rs = statement.getResultSet();
            while (rs != null && rs.next()){
                volidate.put(JSONConstant.EXAM_MD5,rs.getString(2));
                volidate.put(JSONConstant.KEY_MD5,rs.getString(3));
                volidate.put(JSONConstant.RADIO_MD5,rs.getString(4));
            }
            rs.close();

            statement.close();
            resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        } catch (SQLException e) {
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        object.put(JSONConstant.QUESTIONS,array);
        object.put(JSONConstant.RESOURCE_VOLIDATE,volidate);

        return object.toString();
    }

    public String getAnswer(String id) {
        Connection connection = getConnection();
        JSONObject object = new JSONObject();
        String answer = null;
        int resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        String sql = SQLConstant.SQL_PROCEDURE_GET_ANSWER;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1,id);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set != null && set.next()){
                answer = set.getString(1);
            }
            set.close();
            statement.close();
            resultCode = JSONConstant.getStatusCode(JSONConstant.SUCCESS);
        } catch (SQLException e) {
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }
        closeConnection(connection);
        object.put(JSONConstant.RESULT_CODE,resultCode);
        object.put(JSONConstant.ANSWER,answer);
        return null;
    }
}



