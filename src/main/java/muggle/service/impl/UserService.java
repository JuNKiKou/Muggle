package muggle.service.impl;/**
 * Created by JuN on 2017/3/25.
 */

import muggle.constant.RequestParamConstant;
import muggle.db.dao.impl.UserDao;
import muggle.service.IUserService;

/**
 * 用户的业务类
 *
 * @authorJuN
 * @create2017-03-25 13:43
 */
public class UserService implements IUserService{


    public static final int AGE = 0;

    public static final int HEADER = 1;

    public static final int NICK = 2;

    public static final int PLACE = 3;

    public static final int SEX = 4;

    public static final int SIGN = 5;

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

    public String modify(String id, Object param, int column) {
        switch (column){
            case AGE:
                return dao.modifyAge(id,(Integer) param);
            case HEADER:
                return dao.modifyHeader(id,(String) param);
            case NICK:
                return dao.modifyNickName(id,(String) param);
            case PLACE:
                return dao.modifyPlace(id,(Integer) param);
            case SEX:
                return dao.modifySex(id,(Boolean) param);
            case SIGN:
                return dao.modifySign(id,(String) param);
            default:
                System.out.println(RequestParamConstant.REQUEST_PARAM_INVALID);
                break;
        }
        return null;
    }
}
