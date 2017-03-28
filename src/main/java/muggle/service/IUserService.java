package muggle.service;

/**
 * Created by JuN on 2017/3/25.
 */
public interface IUserService {

    public abstract String register(String phone,String password);

    public abstract String login(String phone,String password);

    public abstract String modify(String id,String param,int column);

}
