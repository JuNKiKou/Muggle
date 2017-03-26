package muggle.db.dao;

/**
 * Created by JuN on 2017/3/24.
 */
public interface IUser {

    public abstract String register(String phone,String password);

    public abstract String login(String phone,String password);

}
