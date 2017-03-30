package muggle.controller;/**
 * Created by JuN on 2017/3/30.
 */

import muggle.constant.EncodingConstant;
import muggle.constant.JSONConstant;
import muggle.constant.RequestParamConstant;
import muggle.controller.helper.JsonHelper;
import muggle.helper.DownloadFileHelper;
import muggle.service.impl.UserService;
import muggle.tools.FormateName;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 下载的控制器
 *
 * @authorJuN
 * @create2017-03-30 10:16
 */
public class Download extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String id = req.getParameter(RequestParamConstant.ID);
        String exam = req.getParameter(RequestParamConstant.EXAM);
        String typeStr = req.getParameter(RequestParamConstant.TYPE);
        int type = Integer.parseInt(typeStr);
        String objectStr = service.download(id,exam,type);
        JSONObject object = new JSONObject(objectStr);
        int code = object.getInt(JSONConstant.RESULT_CODE);
        if (code != JSONConstant.getStatusCode(JSONConstant.SUCCESS)){
            JsonHelper.showJson(resp,objectStr);
            return;
        }
        String path = object.getString(JSONConstant.RESOURCE_PATH);
        String volidate = object.getString(JSONConstant.RESOURCE_VOLIDATE);

        switch (type){
            case 0:
                service.addDownloadList(id,exam);
                DownloadFileHelper.downloadExamination(this.getServletContext(),resp, FormateName.formate(path));
                break;
            case 1:
                DownloadFileHelper.downloadKey(this.getServletContext(),resp,FormateName.formate(path));
                break;
            case 2:
                DownloadFileHelper.downloadRadio(this.getServletContext(),resp,FormateName.formate(path));
                break;
            default:
                break;
        }
    }
}
