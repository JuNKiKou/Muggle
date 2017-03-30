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
 * 获取试卷信息
 *
 * @authorJuN
 * @create2017-03-30 12:04
 */
public class GetExamination extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String exam = req.getParameter(RequestParamConstant.EXAM);
        String result = service.getExamination(exam);
        JsonHelper.showJson(resp,result);
    }
}
