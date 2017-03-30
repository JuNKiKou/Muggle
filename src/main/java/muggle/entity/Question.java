package muggle.entity;/**
 * Created by JuN on 2017/3/29.
 */

import org.json.JSONObject;

/**
 * 试题的实体类
 *
 * @authorJuN
 * @create2017-03-29 15:36
 */
public class Question {

    private static final String ID = "id";

    private static final String COLLECTION = "collection";

    private static final String VISIT = "visit";

    private static final String STAR = "star";

    private String id ;

    private int collection;

    private int visit;

    private double star;

    public Question(String id, int collection, int visit, double star) {
        this.id = id;
        this.collection = collection;
        this.visit = visit;
        this.star = star;
    }

    public static void fixValue(JSONObject object,Question question){
        object.put(ID,question.getId());
        object.put(COLLECTION,question.getCollection());
        object.put(VISIT,question.getVisit());
        object.put(STAR,question.getStar());
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCollection() {
        return collection;
    }



    public int getVisit() {
        return visit;
    }



    public double getStar() {
        return star;
    }


}
