package muggle.controller;/**
 * Created by JuN on 2017/3/26.
 */

import muggle.constant.RequestParamConstant;
import muggle.controller.helper.JsonHelper;
import muggle.helper.UploadFileHelper;
import muggle.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改用户信息的控制器
 *
 * @authorJuN
 * @create2017-03-26 15:59
 */
public class Modify extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter(RequestParamConstant.ID);
        String index = req.getParameter(RequestParamConstant.COLUMN);
        String param = req.getParameter(RequestParamConstant.PARAM);
        int column = Integer.parseInt(index);
        String result = service.modify(id,param,column);
        JsonHelper.showJson(resp,result);
    }
}
