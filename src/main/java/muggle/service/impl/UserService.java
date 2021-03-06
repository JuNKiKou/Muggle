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

    public String modify(String id, String param, int column) {
        switch (column){
            case AGE:
                return dao.modifyAge(id,Integer.parseInt(param));
            case HEADER:
                return dao.modifyHeader(id, param);
            case NICK:
                return dao.modifyNickName(id, param);
            case PLACE:
                return dao.modifyPlace(id,Integer.parseInt(param));
            case SEX:
                return dao.modifySex(id,Boolean.parseBoolean(param));
            case SIGN:
                return dao.modifySign(id,param);
            default:
                System.out.println(RequestParamConstant.REQUEST_PARAM_INVALID);
                break;
        }
        return null;
    }

    public String modifyPassword(String id, String o_pwd, String n_pwd) {
        return dao.modifyPassword(id,o_pwd,n_pwd);
    }

    public String setStatus(String id, int rank) {
        return dao.setStudyStatus(id,rank);
    }

    public String giveAdvice(String id, String content) {
        return dao.giveAdvice(id,content);
    }

    public String search(String keyword, int type, int rank, int method) {
        return dao.search(keyword,type,rank,method);
    }

    public String getNews() {
        return dao.getNews();
    }

    public String star(String user, String exam, double value) {
        return dao.star(user,exam,value);
    }

    public String collect(String user, String exam) {
        return dao.collect(user,exam);
    }

    public String download(String id, String exam, int type) {
        return dao.download(id,exam,type);
    }

    public void addDownloadList(String user, String exam) {
        dao.addDownloadList(user,exam);
        return;
    }

    public String getExamination(String exam) {
        return dao.getExamination(exam);
    }

    public String getAnswer(String id) {
        return dao.getAnswer(id);
    }
}
