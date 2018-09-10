package util;

import java.sql.*;

//进行数据库请求
public class Resume_Test {
    static Connection connection = null;
    static Statement statement = null;
    static ResultSet resultSet = null;
    static boolean resultUpdate;
    static String url = "jdbc:mysql://localhost:3306/db_resume" +
            "?user=root&password=123456" +
            "&useUnicode=true" +
            "&characterEncoding=UTF8";

    //执行数据库请求
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

    }
    //1.加载驱动
    public static void method_1(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Mysql驱动已经成功被加载");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //2.获取连接
    public static void method_2(){
        try {
            connection = DriverManager.getConnection(url);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //3.获取声明
    public static void method_3(){
        try {
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //4.执行sql语句，获取返回的结果集
    public static ResultSet method_4(String sql) throws SQLException{
        resultSet = statement.executeQuery(sql);
        return  resultSet;
    }
    public static boolean method_5(String sql) throws  SQLException{
        resultUpdate = statement.execute(sql);
        return  resultUpdate;

    }
}
