package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JDBC_Test {
	static Connection conn = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	static String url = "jdbc:mysql://localhost:3306/"
    		+ "sx_database"
    		+ "?user=root&password=123456"
    		+ "&useUnicode=true"
    		+ "&characterEncoding=UTF8";
	
	public static void main(String[] args) 
			throws ClassNotFoundException
			, SQLException {

		
		//1.加载驱动
		method_1();
		//2.获取连接
		method_2();
		//3.获取声明
		method_3();
		//4.执行sql 返回结果集
		ResultSet rs= method_4("select * from student");
		
		/*	// 动态加载mysql驱动
		Class.forName("com.mysql.jdbc.Driver");
        System.out.println("成功加载MySQL驱动程序");
        
        String url = "jdbc:mysql://localhost:3306/"
        		+ "sx_database"
	    		+ "?user=root&password=123456"
	    		+ "&useUnicode=true"
	    		+ "&characterEncoding=UTF8";
        //获取连接
        Connection conn = 
        DriverManager.getConnection(url);
        
        //获取声明
        Statement stmt = conn.createStatement();	
        													// Statement不能防止sql注入 PrepareStatement可以
        String sql = "create table student("
        		+ "NO char(20),name varchar(20),"
        		+ "age int(2),"
        		+ "password varchar(20),"
        		+ "sex char(6),"
        		+ "birthday varchar(20)"
        		+ ")";
        
        String sql_insert = 
        		"insert into student values"
        		+ "('1','王杰',20,"
        		+ "'123456','male','2001-01-01')";
        String sql_update = "update student set name='吉喆'";
        String sql_delete = "delete from student where 1=1 ";
        //boolean result = stmt.execute(sql);// executeUpdate语句会返回一个受影响的行数，如果返回-1就没有成功
        //int count0  = stmt.executeUpdate(sql_update);
        //int count01 = stmt.executeUpdate(sql_delete);
        int count = stmt.executeUpdate(sql_insert);   
       System.out.println(count); 
        String select_sql = "select * from student ";
       ResultSet rs =  stmt.executeQuery(select_sql);
       while (rs.next()) {
           System.out
           .println(rs.getString(1) + "\t" 
        	+ rs.getString(2));
           // 入如果返回的是int类型可以用
           //getInt()
       }*/
	}
	
	
	
	//第一步 加载驱动
	public static void method_1() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
	        System.out.println("成功加载MySQL驱动程序");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	//第二步 获取连接
	public static void method_2() {
        //获取连接
        try {
			conn = 
			DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//第三步 获取声明
	public static void method_3() {
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//执行sql 获取结果集
	public static ResultSet method_4(String sql) throws SQLException {
	        rs =  stmt.executeQuery(sql);
	        return rs;
	}
	

	
}


