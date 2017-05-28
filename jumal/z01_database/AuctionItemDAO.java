package z01_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.text.SimpleDateFormat;

import z02_vo.AuctionItemVO;

public class AuctionItemDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public AuctionItemVO infoItem(AuctionItemVO sch) {
		AuctionItemVO ii = null;
		try {
			// setConn();
			con = ConnectDB.conn();
			String sql = "select * from Auction_item where auction_ID = ? ";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getAuctionId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ii = new AuctionItemVO();
				ii.setAuctioneerId(rs.getInt(1));
				ii.setAuctionId(rs.getInt(2));
				ii.setItemName(rs.getString(3));
				ii.setStartDate(rs.getTimestamp(4));
				ii.setEndDate(rs.getTimestamp(5));
				ii.setState(rs.getInt(6));
				ii.setCurrentBidAmount(rs.getDouble(7));
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
		return ii;
	}

	public void raisePrice(AuctionItemVO udt) {
		try {
			// setConn();
			con = ConnectDB.conn();
			String sql = "update Auction_item " + "set current_Bid_Amount = ? " + "where auction_ID = ? ";
			System.out.println(sql);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, udt.getCurrentBidAmount());
			pstmt.setInt(2, udt.getAuctionId());
			pstmt.executeUpdate();
			con.commit();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		
		//dao, dto 세팅 
//		AuctionItemDAO dao = new AuctionItemDAO();
//		AuctionItemVO dto = new AuctionItemVO();
//	
//		int itemID = 1;//현재 1번 아이템 경매
//		dto.setAuctionId(itemID);
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//
//		// 아이템 정보
//		String itemName = dao.infoItem(dto).getItemName(); //###
//		double curBid = dao.infoItem(dto).getCurrentBidAmount(); //###
//		String startDate = sdf.format(dao.infoItem(dto).getStartDate());
//		String endDate = sdf.format(dao.infoItem(dto).getEndDate());
//
//		//	날짜 변환. sql에서 rs.getDate로 테이블의 마감시간값을 따오면 yyyy/MM/dd로만 표시되서 
//		//	SimpleDateFormat으로 날짜형식을 변형함.
//
//		int boundary[] = {0, 5000, 50000, 10000000};
//		int increaseBid[] = {1000, 2000, 3000};
//		int interval = 0;
//		int nowBidPrice = 0;
//		for (int i = 0; i < increaseBid.length; i++) {
//			if (curBid >= boundary[i] && curBid < boundary[(i + 1)]) {
//				nowBidPrice = increaseBid[i];
//				break;
//			}
//		}
//		System.out.println(itemName);
//		System.out.println(curBid);
//		System.out.println(startDate);
//		System.out.println(endDate);
//		System.out.println(interval);
//		System.out.println(nowBidPrice);
//		System.out.println("\n GOOD JOB");
	}

}
