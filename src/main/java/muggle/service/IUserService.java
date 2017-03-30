package muggle.service;

/**
 * Created by JuN on 2017/3/25.
 */
public interface IUserService {

    public abstract String register(String phone,String password);

    public abstract String login(String phone,String password);

    public abstract String modify(String id,String param,int column);

    public abstract String modifyPassword(String id,String o_pwd,String n_pwd);

    public abstract String setStatus(String id,int rank);

    public abstract String giveAdvice(String id,String content);

    public abstract String search(String keyword,int type,int rank,int method);

    public abstract String getNews();

    public abstract String star(String user,String exam,double value);

    public abstract String collect(String user,String exam);
}



