package muggle.entity;/**
 * Created by JuN on 2017/3/26.
 */

import org.json.JSONObject;

/**
 * 用户的实体类
 *
 * @authorJuN
 * @create2017-03-26 09:52
 */
public class EUser {

    private static final String ID = "id";

    private static final String PHONE = "phone";

    private static final String ADMIN = "admin";

    private static final String PASSWORD = "password";

    private static final String SIGN = "sign";

    private static final String HEADER = "header";

    private static final String NICK = "nick";

    private static final String SEX = "sex";

    private static final String AGE = "age";

    private static final String PLACE = "place";

    private String id;

    private String phone;

    private boolean admin;

    private String password;

    private String sign;

    private String header;

    private String nick;

    private boolean sex;

    private int age;

    private int place;


    public static void fixValue(JSONObject object,EUser user){
        object.put(ID,user.getId());
        object.put(PHONE,user.getPhone());
        object.put(ADMIN,user.isAdmin());
        object.put(PASSWORD,user.getPassword());
        object.put(SIGN,user.getSign());
        object.put(HEADER,user.getHeader());
        object.put(NICK,user.getNick());
        object.put(SEX,user.isSex());
        object.put(AGE,user.getAge());
        object.put(PLACE,user.getPlace());
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }
}
