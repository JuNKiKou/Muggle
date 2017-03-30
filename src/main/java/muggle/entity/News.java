package muggle.entity;/**
 * Created by JuN on 2017/3/29.
 */

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * 最新资源的实体类
 *
 * @authorJuN
 * @create2017-03-29 20:29
 */
public class News {

    private static final String ID = "id";

    private static final String NAME = "name";

    private static final String TIME = "time";

    private String id;

    private String name;

    private String time;

    public static void fixValue(JSONObject object,News news){
        object.put(ID,news.getId());
        object.put(NAME,news.getName());
        object.put(TIME,news.getTime());
    }

    public News(String id, String name, String time) {
        this.id = id;
        this.name = name;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getTime() {
        return time;
    }
}
