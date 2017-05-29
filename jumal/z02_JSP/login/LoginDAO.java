package z01_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import z02_vo.AuctionUserVO;

public class LoginDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Integer checkLogin(String email, String password){
//		boolean cl = false;
		Integer cl = null;
		try {
			con = ConnectDB.conn();
			String sql = "SELECT USER_ID FROM AUCTION_USER "+"WHERE EMAIL = ? "+
										  "AND PASSWORD = ?";
			pstmt = con.prepareStatement(sql);
//			System.out.println(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			// 여기서 왜 rs.next() 이외의 다른 방법은??
			if(rs.next()){
				cl = rs.getInt(1);
//				cl = true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(cl + 2);
		return cl;
	}
	public static void main(String[] args) {
		LoginDAO db = new LoginDAO();
		System.out.println("login:"+db.checkLogin("why@not", "whywhy"));
	}
	
}
