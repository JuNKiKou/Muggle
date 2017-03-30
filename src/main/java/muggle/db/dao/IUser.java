package muggle.db.dao;

/**
 * Created by JuN on 2017/3/24.
 */
public interface IUser {

    public abstract String register(String phone,String password);

    public abstract String login(String phone,String password);

    public abstract String modifyAge(String id,int age);

    public abstract String modifyHeader(String id,String header);

    public abstract String modifyNickName(String id,String nick);

    public abstract String modifySex(String id,boolean sex);

    public abstract String modifySign(String id,String sign);

    public abstract String modifyPlace(String id,int place);

    public abstract String modifyPassword(String id,String o_pwd,String n_pwd);

    public abstract String setStudyStatus(String id,int rank);

    public abstract String giveAdvice(String id,String content);

    public abstract String search(String keyword,int type,int rank,int method);

    public abstract String getNews();

    public abstract String star(String user,String exam,double value);

    public abstract String collect(String user,String exam);
}
