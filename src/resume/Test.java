package resume;

import java.sql.SQLException;

import util.JDBC_Util;


public class Test {
		public static void main(String[] args) {
			try {
				JDBC_Util.connect();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
}
