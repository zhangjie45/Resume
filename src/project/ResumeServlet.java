package project;

import entity.UserInfo;
import util.Resume_Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResumeServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInfo user = new UserInfo();
        try {
            req.setCharacterEncoding("UTF-8");
            Resume_Test.method_1();
            Resume_Test.method_2();
            Resume_Test.method_3();
            String sql = "select * from userinfo limit 0,2";
            ResultSet resultSet = null;
            try {
                resultSet = Resume_Test.method_4(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (resultSet != null) {
                while (resultSet.next()) {
                    user.name = resultSet.getString(2);
                    user.sex = resultSet.getString(3);
                    user.age = resultSet.getInt(4);
                    user.birthday = resultSet.getString(5);
                    user.mail = resultSet.getString(6);
                    user.address = resultSet.getString(7);
                    user.site = resultSet.getString(8);
                    user.phoneNum = resultSet.getString(9);
                    user.introduceHead = resultSet.getString(10);
                    user.introduceContent = resultSet.getString(11);


                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("user", user);
        req.getRequestDispatcher("remove.jsp").forward(req, resp);
    }
}
