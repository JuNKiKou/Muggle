package muggle.controller;/**
 * Created by JuN on 2017/3/29.
 */

import muggle.controller.helper.JsonHelper;
import muggle.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 获取最新资源信息
 *
 * @authorJuN
 * @create2017-03-29 20:37
 */
public class GetNews extends HttpServlet{

    private UserService service = UserService.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String result = service.getNews();
        JsonHelper.showJson(resp,result);
    }
}
