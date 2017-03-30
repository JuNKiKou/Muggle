package muggle.entity;/**
 * Created by JuN on 2017/3/29.
 */

import org.json.JSONObject;

/**
 * 试卷的实体类
 *
 * @authorJuN
 * @create2017-03-29 15:38
 */
public class Examination {

    private static final String ID = "id";

    private static final String COLLECTION = "collection";

    private static final String VISIT = "visit";

    private static final String STAR = "star";

    private static final String DOWNLOAD = "download";

    private String id;

    private int collection;

    private int visit;

    private double star;

    private int download;

    public Examination(String id, int collection, int visit, double star, int download) {
        this.id = id;
        this.collection = collection;
        this.visit = visit;
        this.star = star;
        this.download = download;
    }

    public static void fixValue(JSONObject object,Examination examination){

        object.put(ID,examination.getId());
        object.put(COLLECTION,examination.getCollection());
        object.put(VISIT,examination.getVisit());
        object.put(STAR,examination.getStar());
        object.put(DOWNLOAD,examination.getDownload());
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


    public int getDownload() {
        return download;
    }


}
