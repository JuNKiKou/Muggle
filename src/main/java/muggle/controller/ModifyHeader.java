package muggle.controller;/**
 * Created by JuN on 2017/3/27.
 */

import muggle.constant.EncodingConstant;
import muggle.constant.JSONConstant;
import muggle.constant.RequestParamConstant;
import muggle.controller.helper.JsonHelper;
import muggle.helper.UploadFileHelper;
import muggle.service.impl.UserService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改头像的控制器类
 *
 * @authorJuN
 * @create2017-03-27 16:06
 */
public class ModifyHeader extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String builder = UploadFileHelper.uploadHeader(this.getServletContext(),req,resp);
        JSONObject object = new JSONObject(builder);
        String id = object.getString(RequestParamConstant.ID);
        int column = object.getInt(RequestParamConstant.COLUMN);
        String path = object.getString(JSONConstant.HEADER_PATH);
        String result = service.modify(id,path,column);
        JsonHelper.showJson(resp,result);
    }


}
