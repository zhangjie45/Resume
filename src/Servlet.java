import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Servlet extends HttpServlet {
    //req(获取传入值)
    //resp(跳转页面，转发重定向)
    /*
    转发 是一次
    重定向 是两次
     */

    //只返回结果
//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String ask = req.getParameter("ask");
//        String time = req.getParameter("time");
//        String name = req.getParameter("name");
//        if ("江涛".equals(name) || "2018-05-14".equals(time)) {
//            System.out.println("NO");
//        } else {
//            System.out.println("YES");
//        }
    //  resp.sendRedirect("http://www.baidu.com");重定向 除非是www.baidu.comm?a=1&b=2才可以拿到值
//        req.getRequestDispatcher("/A/a.html").forward(req, resp);转发 request对象的值不变的
//    }

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.print("我是doget()方法");
//        req.getRequestDispatcher("/A/a.html").forward(req, resp);
//    }


//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("username");
//        System.out.println("dopost()" + name);
//    }


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("pwd");
        System.out.println(username + ":" + password);
        //转发
        req.setAttribute("username",username);
        req.getRequestDispatcher("/back_index/home.jsp").forward(req,resp);
    }
}
