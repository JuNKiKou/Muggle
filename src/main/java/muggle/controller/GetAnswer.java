package muggle.controller;/**
 * Created by JuN on 2017/3/30.
 */

import muggle.constant.EncodingConstant;
import muggle.constant.RequestParamConstant;
import muggle.controller.helper.JsonHelper;
import muggle.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 获取答案的控制器
 *
 * @authorJuN
 * @create2017-03-30 12:33
 */
public class GetAnswer extends HttpServlet{

    private UserService service = UserService.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String id = req.getParameter(RequestParamConstant.ID);
        String result = service.getAnswer(id);
        JsonHelper.showJson(resp,result);
    }
}
