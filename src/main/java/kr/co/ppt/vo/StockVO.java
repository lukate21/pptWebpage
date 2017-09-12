package kr.co.ppt.vo;

public class StockVO {

	private int no;
	private int comNo;
	private String openDate;
	private int openPrice;
	private int closePrice;
	private int highPrice;
	private int lowPrice;
	private int volume;
	private String flucState;
	private int raise;
	private int rate;
	
	public StockVO() {}

	public StockVO(int no, int comNo, String openDate, int openPrice, int closePrice, int highPrice, int lowPrice, int volume,
			String flucState, int raise, int rate) {
		this.no = no;
		this.comNo = comNo;
		this.openDate = openDate;
		this.openPrice = openPrice;
		this.closePrice = closePrice;
		this.highPrice = highPrice;
		this.lowPrice = lowPrice;
		this.volume = volume;
		this.flucState = flucState;
		this.raise = raise;
		this.rate = rate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public int getOpenPrice() {
		return openPrice;
	}

	public void setOpenPrice(int openPrice) {
		this.openPrice = openPrice;
	}

	public int getClosePrice() {
		return closePrice;
	}

	public void setClosePrice(int closePrice) {
		this.closePrice = closePrice;
	}

	public int getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}

	public int getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getFlucState() {
		return flucState;
	}

	public void setFlucState(String flucState) {
		this.flucState = flucState;
	}

	public int getRaise() {
		return raise;
	}

	public void setRaise(int raise) {
		this.raise = raise;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StockVO [no=").append(no).append(", comNo=").append(comNo).append(", openDate=").append(openDate).append(", openPrice=")
				.append(openPrice).append(", closePrice=").append(closePrice).append(", highPrice=").append(highPrice)
				.append(", lowPrice=").append(lowPrice).append(", volume=").append(volume).append(", flucState=")
				.append(flucState).append(", raise=").append(raise).append(", rate=").append(rate).append("]");
		return builder.toString();
	}
	
}
