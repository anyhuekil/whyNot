package z01_database;

import java.sql.*;

import z02_vo.AuctionBidVO;

public class AuctionBidDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AuctionBidVO infoBid(AuctionBidVO sch) {
		AuctionBidVO ib = null;

		try {
			con = ConnectDB.conn(); // setConn();를 대체함
			String sql = "select * from Auction_Bid where auction_ID=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getAuctionID());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ib = new AuctionBidVO();
				ib.setBidderID(rs.getInt(1));
				ib.setAuctionID(rs.getInt(2));
				ib.setBiddingDate(rs.getTimestamp(3));
				ib.setBidAmount(rs.getDouble(4));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ib;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
