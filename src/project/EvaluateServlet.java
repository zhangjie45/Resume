package project;

import util.Resume_Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EvaluateServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入evaluateServlet方法内，马上进行数据库访问");
        resp.setContentType("text");
        String req_uri[] = req.getRequestURI().split("/");
        if ("evaluate".equals(req_uri[req_uri.length - 1])) {
            evaluate(req, resp);
        }
    }

    public void evaluate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("我现在进入了evaluate方法内");
        request.setCharacterEncoding("UTF-8");
        Resume_Test.method_1();
        Resume_Test.method_2();
        Resume_Test.method_3();
        String url = "INSERT INTO evaluate (ip,name,email,subject,message) " +
                "VALUES('" + request.getParameter("form_ip") + "','" +
                request.getParameter("form_name") + "','" +
                request.getParameter("form_email") + "','" +
                request.getParameter("form_subject") + "','" +
                request.getParameter("form_message") + "')";
        try {
            Resume_Test.method_5(url);
        } catch (SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }

    }
}