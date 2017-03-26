package muggle.service.impl;/**
 * Created by JuN on 2017/3/25.
 */

import muggle.db.dao.impl.UserDao;
import muggle.service.IUserService;

/**
 * 用户的业务类
 *
 * @authorJuN
 * @create2017-03-25 13:43
 */
public class UserService implements IUserService{


    //单例模式
    private UserService() {}

    private static final UserService instance = new UserService();

    public static UserService getInstance(){
        return instance;
    }

    private UserDao dao = UserDao.getInstance();

    public String register(String phone, String password) {
        return dao.register(phone,password);
    }

    public String login(String phone, String password) {
        return dao.login(phone,password);
    }
}
