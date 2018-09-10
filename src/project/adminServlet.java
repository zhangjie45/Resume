package project;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



public class adminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String req_uri[] = request.getRequestURI().split("/");
        String req_url = request.getRequestURL() + "";
        System.out.println("uri---->" + req_uri);
        System.out.println("url---->" + req_url);
        if ("b.action".equals(req_uri[req_uri.length - 1])) {//以a.do结尾
          System.out.println("进入b方法");
        }

    }
}
