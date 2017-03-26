package muggle.controller;/**
 * Created by JuN on 2017/3/25.
 */

import muggle.constant.RequestParamConstant;
import muggle.constant.ResponseConstant;
import muggle.controller.helper.JsonHelper;
import muggle.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

/**
 * 注册的控制器
 *
 * @authorJuN
 * @create2017-03-25 13:50
 */
public class Register extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException{
        String phone = req.getParameter(RequestParamConstant.TELEPHONE_NUMBER);
        String password = req.getParameter(RequestParamConstant.PASSWORD);
        String result;

        if (phone != null && password != null){
            result = service.register(phone,password);
        }else {
            result = null;
        }

        JsonHelper.showJson(resp,result);



    }
}
