package muggle.controller;/**
 * Created by JuN on 2017/3/29.
 */

import muggle.constant.RequestParamConstant;
import muggle.controller.helper.JsonHelper;
import muggle.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 修改密码的控制器
 *
 * @authorJuN
 * @create2017-03-29 10:12
 */
public class ModifyPassword extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter(RequestParamConstant.ID);
        String o_pwd = req.getParameter(RequestParamConstant.OLD_PASSWORD);
        String n_pwd = req.getParameter(RequestParamConstant.NEW_PASSWORD);
        String result = service.modifyPassword(id,o_pwd,n_pwd);
        JsonHelper.showJson(resp,result);
    }
}
