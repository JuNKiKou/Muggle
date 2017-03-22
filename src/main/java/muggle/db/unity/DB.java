package muggle.db.unity;/**
 * Created by JuN on 2017/3/21.
 */

import muggle.constant.DBConstant;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 连接数据库工具类
 *
 * @authorJuN
 * @create2017-03-21 16:40
 */
public class DB {



    //设计成单例模式
    private DB() {}

    private static final DB instance = new DB();

    public static DB getInstance(){
        return instance;
    }

    public Connection getConnection(){
        InputStream in = DB.this.getClass().getClassLoader().getResourceAsStream("muggle.properties");
        Properties properties = new Properties();
        try {
            properties.load(in);
        } catch (IOException e) {
            System.out.print(DBConstant.PROPERTIES_LOAD_ERROR);
        }

        String driver = properties.getProperty(DBConstant.PROPERTIES_DRIVER_KEY);
        String url = properties.getProperty(DBConstant.PROPERTIES_URL_KEY);
        String username = properties.getProperty(DBConstant.PROPERTIES_USERNAME_KEY);
        String password = properties.getProperty(DBConstant.PROPERTIES_PASSWORD_KRY);

        return createConnection(driver,url,username,password);
    }

    public int closeConnection(Connection connection){
        if (connection == null){
            return 0;
        }

        try {
            connection.close();
        } catch (SQLException e) {
            System.out.print(DBConstant.CONNECTION_CLOSE_ERROR);
            return -1;
        }

        return 1;
    }

    private Connection createConnection(String className,String url,String userName,String password){
        Connection connection = null;
        try {
            Class.forName(className);
            connection = DriverManager.getConnection(url,userName,password);
        } catch (ClassNotFoundException e) {
            System.out.print(DBConstant.DRIVER_NOT_FOUND);
        } catch (SQLException e) {
            System.out.print(DBConstant.CONNECTION_OPEN_ERROR);
        }
        return connection;
    }
}
