package resume;

import util.JDBC_Test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet {


//    protected void service1(HttpServletRequest request,
//                            HttpServletResponse response)
//            throws ServletException, IOException, SQLException {
//
//        //request.setCharacterEncoding("utf-8");
//
//        String ask = request.getParameter("ask");
//        String time = request.getParameter("time");
//        String name = request.getParameter("name");
//        System.out.println(ask + "," + time + "," + name);
		/*
		if("江涛".equals(name)){  //调用方法的对象保证不能为空才行 不然空指针 
			System.out.println("不跟他出去");
		}else if ("2018-05-14".equals(time)) {
			System.out.println("时间不合适 不出去");
		}else {
			System.out.println("时间合适 且不是江涛 可以出去");
		}*/
		
		
		/*
		转发重定向
		
		转发速度快 重定向慢
		转发只有一次请求  重定向有两次
		转发方便传递参数  重定向只能传递url中带的参数
		
		
		 */


    /** 重定向 */
    //客户端跳转：效率低
    //session范围属性，url中的参数会传递下去，request范围属性不传递
    //response.sendRedirect("http://www.baidu.com");

    //重定向是先执行sendRedirect后的代码才重定向到该页面的
//        response.sendRedirect("http://127.0.0.1:8766/resume_/a/a.html?aaa=111");


    /**
     * 转发
     */
    // 服务器端跳转：常用，效率高
    // request范围属性，session范围属性，url中的参数会传递

    //先执行转发才 执行后面代码
    //request.getRequestDispatcher("/a/a.jsp").forward(request, response);
//        System.out.println("看我是什么时候执行的");
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        JDBC_Test.method_1();
        JDBC_Test.method_2();
        JDBC_Test.method_3();
        //JDBC_Test.method_4();
        ResultSet result;
        try {
            result = JDBC_Test.method_4("");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //  System.out.println(result);
        //   req.setAttribute("username", result);
        req.getRequestDispatcher("/back_index/home.jsp").forward(req, resp);
    }

//    }


}
