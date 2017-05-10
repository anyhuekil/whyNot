package database_test;

import java.sql.*;

public class EmpDB {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws ClassNotFoundException, SQLException {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String conInfo="jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(conInfo, "scott", "tiger");
			System.out.println("저~~~~~~업속!");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("드라이버이상!");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("접속이상!");
//		}
	}
	
	public static void main(String[] args){
		EmpDB db = new EmpDB();
		try {
			db.setConn();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
