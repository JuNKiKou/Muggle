package muggle.controller;/**
 * Created by JuN on 2017/3/26.
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
 * 登录的控制器
 *
 * @authorJuN
 * @create2017-03-26 10:25
 */
public class Login extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter(RequestParamConstant.TELEPHONE_NUMBER);
        String password = req.getParameter(RequestParamConstant.PASSWORD);
        String result;
        if (phone != null && password != null){
            result = service.login(phone,password);
        }else {
            result = null;
        }
        JsonHelper.showJson(resp,result);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
