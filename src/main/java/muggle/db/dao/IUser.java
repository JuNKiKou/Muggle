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

}
