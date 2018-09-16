package project;

import entity.Student;
import util.JDBC_Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Servlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String req_uri[] = request.getRequestURI().split("/");
        String req_url = request.getRequestURL() + "";
        System.out.println("uri---->" + req_uri);
        System.out.println("url---->" + req_url);
        if ("a.do".equals(req_uri[req_uri.length - 1])) {//以a.do结尾
            method_a(request, response);
        } else if ("test.do".equals(req_uri[req_uri.length - 1])) {//以test.do结尾
            method_d(request, response);
        } else if ("admin.do".equals(req_uri[req_uri.length - 1])) {
            method_admin(request, response);
        }

    }

    public void method_d(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("这是test方法");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("hello");
    }

    public void method_admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("这是admin方法");
        response.setContentType("text/html;charset=utf-8");
       // request.getRequestDispatcher("").forward(request, response);
    }
    public void method_a(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("这是a方法");
        String req_uri = request.getRequestURI();
        String req_url = request.getRequestURL() + "";
        System.out.println("uri---->" + req_uri);
        System.out.println("url---->" + req_url);
        //新建一张只能放Student类的清单
        //我们个人简历里只放一张学生自己的信息表
        //信息表里就放一条数据 就是你自己的信息
        Student s = new Student();
        try {
            request.setCharacterEncoding("UTF-8");
            //数据库返回数据
            ResultSet rs = null;
            JDBC_Test.method_1();//1.驱动
            JDBC_Test.method_2();//2.连接
            JDBC_Test.method_3();//3.声明
            String sqlString = "select * from student limit 1,2";
            try {//4.查询
                rs = JDBC_Test.method_4(sqlString);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (rs != null) {
                while (rs.next()) {
                    s.NO = rs.getString(1);
                    s.name = rs.getString(2);
                    s.sex = rs.getString(3);
                    s.age = rs.getInt(4);
                    s.password = rs.getString(5);
                    s.birthday = rs.getString(6);
                    s.mail = rs.getString(7);
                    s.address = rs.getString(8);
                    s.site = rs.getString(9);
                    s.phoneNum = rs.getString(10);
                    s.introduceHead = rs.getString(11);
                    s.introduceContent = rs.getString(12);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        //页面跳转
        //の转发
        //request.setAttribute("username", name);
        request.setAttribute("s", s);
        request.getRequestDispatcher("/web_index/index.jsp")
                .forward(request, response);
    }

}
