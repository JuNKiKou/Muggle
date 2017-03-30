package muggle.tools;/**
 * Created by JuN on 2017/3/25.
 */

import muggle.constant.SQLConstant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 格式化id的工具类
 *
 * @authorJuN
 * @create2017-03-25 12:05
 */
public class FormateId {


    private static String formate(String head,String number){
        int headLength = head.length();
        int numberLength = number.length();
        int restLength = 16 - headLength - numberLength;
        StringBuilder builder = new StringBuilder();
        builder.append(head);
        while (restLength > 0){
            builder.append("0");
            restLength --;
        }
        builder.append(number);
        return builder.toString();
    }

    private static String getGeneralId(String id,String head){
        String number = getNumber(id,head);
        int num = Integer.parseInt(number);
        num = num + 1;
        String result = String.valueOf(num);
        return formate(head,result);
    }

    private static String getNumber(String id,String head){
        int headerLength = head.length();
        String number = id.substring(headerLength);
        return number;
    }

    public static String getGeneralId(Connection connection, String sql, String initId, String header){

        String id = null;
        try {
            CallableStatement statement = connection.prepareCall(sql);
            statement.execute();
            ResultSet set = statement.getResultSet();
            while (set.next()){
                id = set.getString(1);
            }
            set.close();
            statement.close();
        } catch (SQLException e) {
            System.out.println(SQLConstant.SQL_GET_GENERAL_ID_EXCEPTION);
            e.printStackTrace();
        }

        if (id != null){
            id = getGeneralId(id,header);
        }else {
            id = initId;
        }

        return id;

    }

}
