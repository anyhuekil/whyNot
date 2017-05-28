package z02_vo;

import java.sql.Timestamp;

public class AuctionItemVO {

	public int auctionId;
	public int auctioneerId;
	public String itemName;
	public Timestamp startDate;
	public Timestamp endDate;
	public int state;
	public Double currentBidAmount;

	public int getAuctionId() {
		return auctionId;
	}

	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}

	public int getAuctioneerId() {
		return auctioneerId;
	}

	public void setAuctioneerId(int auctioneerId) {
		this.auctioneerId = auctioneerId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Double getCurrentBidAmount() {
		return currentBidAmount;
	}

	public void setCurrentBidAmount(Double currentBidAmount) {
		this.currentBidAmount = currentBidAmount;
	}

}
