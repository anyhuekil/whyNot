package z01_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import z02_vo.AuctionUserVO;

//import z02_vo.AuctionUserVO;

public class AuctionUserDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AuctionUserVO infoUser(AuctionUserVO sch){
		AuctionUserVO iu = null;
		try {
			con = ConnectDB.conn();
			String sql = "SELECT * FROM AUCTION_USER WHERE USER_ID = ?";
			pstmt = con.prepareStatement(sql);
//			System.out.println(sql);
			pstmt.setInt(1, sch.getUserId());
			rs = pstmt.executeQuery();
			// 여기서 왜 rs.next() 이외의 다른 방법은??
			if(rs.next()){
				iu = new AuctionUserVO();
				iu.setUserId(rs.getInt(1));
				iu.setUserName(rs.getString(2));
				iu.setEmail(rs.getString(3));
				iu.setPassword(rs.getString(4));
				iu.setRegisterDate(rs.getTimestamp(5));
				iu.setAuth(rs.getInt(6));
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
		return iu;
	}
	public static void main(String[] args) {
		int uid = 8;
		AuctionUserDAO userDAO = new AuctionUserDAO();
		AuctionUserVO userVO = new AuctionUserVO();
		
		userVO.setUserId(uid);
		
		String userName = userDAO.infoUser(userVO).getUserName(); //###
		System.out.println(userName);
	}
	
}
