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
 * 查找控制器
 *
 * @authorJuN
 * @create2017-03-29 16:15
 */
public class Search extends HttpServlet{

    private UserService service = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(EncodingConstant.UTF8);
        String keyword = req.getParameter(RequestParamConstant.KEYWORD);
        String typeStr = req.getParameter(RequestParamConstant.TYPE);
        String rankStr = req.getParameter(RequestParamConstant.RANK);
        String methodStr = req.getParameter(RequestParamConstant.METHOD);
        int type = Integer.parseInt(typeStr);
        int rank = Integer.parseInt(rankStr);
        int method = Integer.parseInt(methodStr);
        String result = service.search(keyword,type,rank,method);
        JsonHelper.showJson(resp,result);
    }
}
