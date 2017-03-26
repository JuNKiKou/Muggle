package muggle.db.dao.impl;/**
 * Created by JuN on 2017/3/24.
 */

import muggle.db.unity.DB;

import java.sql.Connection;

/**
 * 实现的通用类，实现了获取连接，关闭连接的实现
 *
 * @authorJuN
 * @create2017-03-24 14:48
 */
public class GeneralDao {

    private DB unity = DB.getInstance();

    public Connection getConnection(){
        return unity.getConnection();
    }

    public int closeConnection(Connection con){
        return unity.closeConnection(con);
    }

}
