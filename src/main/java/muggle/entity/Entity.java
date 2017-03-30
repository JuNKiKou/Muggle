package muggle.entity;/**
 * Created by JuN on 2017/3/30.
 */

import org.json.JSONObject;

/**
 * 试题的实体
 *
 * @authorJuN
 * @create2017-03-30 11:53
 */
public class Entity {

    private static final String ID = "id";

    private static final String CONTENT = "content";

    private static final String NUMBER = "number";

    private static final String KEY = "key";

    private static final String RADIO = "radio";

    private String id;

    private String content;

    private String number;

    private String key;

    private String radio;

    public static void fixValue(JSONObject object,Entity entity){
        object.put(ID,entity.getId());
        object.put(CONTENT,entity.getContent());
        object.put(NUMBER,entity.getNumber());
        object.put(KEY,entity.getKey());
        object.put(RADIO,entity.getRadio());
    }

    public Entity(String id, String content, String number, String key, String radio) {
        this.id = id;
        this.content = content;
        this.number = number;
        this.key = key;
        this.radio = radio;
    }

    public String getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public String getNumber() {
        return number;
    }

    public String getKey() {
        return key;
    }

    public String getRadio() {
        return radio;
    }
}
