package z02_vo;

import java.sql.Timestamp;

public class AuctionBidVO {
	private int bidderID;
	private int auctionID;
	private Timestamp biddingDate;
	private double bidAmount;
	
//	public AuctionBidVO() {
//	}
//
//	public AuctionBidVO(int bidderID, int auctionID, Date biddingDate, double bidAmount) {
//		this.bidderID = bidderID;
//		this.auctionID = auctionID;
//		this.biddingDate = biddingDate;
//		this.bidAmount = bidAmount;
//	}

	public int getBidderID() {
		return bidderID;
	}

	public void setBidderID(int bidderID) {
		this.bidderID = bidderID;
	}

	public int getAuctionID() {
		return auctionID;
	}

	public void setAuctionID(int auctionID) {
		this.auctionID = auctionID;
	}

	public Timestamp getBiddingDate() {
		return biddingDate;
	}

	public void setBiddingDate(Timestamp biddingDate) {
		this.biddingDate = biddingDate;
	}

	public double getBidAmount() {
		return bidAmount;
	}

	public void setBidAmount(double bidAmount) {
		this.bidAmount = bidAmount;
	}

}
