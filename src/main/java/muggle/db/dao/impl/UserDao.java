package muggle.db.dao.impl;/**
 * Created by JuN on 2017/3/24.
 */

import muggle.constant.JSONConstant;
import muggle.constant.SQLConstant;
import muggle.db.dao.IUser;
import muggle.db.unity.DB;
import muggle.entity.EUser;
import muggle.tools.FormateId;
import org.json.JSONObject;

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
        String userId = null;
        String generalId = null;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set.next()){
                userId = set.getString(1);
            }
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_GET_USER_ID_EXCEPTION);
            resultCode = JSONConstant.getStatusCode(JSONConstant.SQL_EXECUTE_EXCEPTION);
            e.printStackTrace();
        }

        if (userId != null){
            generalId = FormateId.getGeneralId(userId,SQLConstant.USER_HEAD);
        }else {
            generalId = SQLConstant.USER_ID_INIT;
        }

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
}
