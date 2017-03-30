package muggle.controller;/**
 * Created by JuN on 2017/3/29.
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
 * 设置学习方向的控制器
 *
 * @authorJuN
 * @create2017-03-29 12:37
 */
public class SetStatus extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String id = req.getParameter(RequestParamConstant.ID);
        String rankStr = req.getParameter(RequestParamConstant.RANK);
        int rank = Integer.parseInt(rankStr);
        String result = service.setStatus(id,rank);
        JsonHelper.showJson(resp,result);
    }
}
