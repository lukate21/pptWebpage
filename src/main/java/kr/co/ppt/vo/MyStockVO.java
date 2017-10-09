package kr.co.ppt.vo;

public class MyStockVO {

	private int no;
	private String comName;
	private int userNo;
	private int comNo;
	private int buyPrice;
	private int volume;
	private String buyDate;

	public MyStockVO() {}

	public MyStockVO(int no, String comName, int userNo, int comNo, int buyPrice, int volume, String buyDate) {
		this.no = no;
		this.comName = comName;
		this.userNo = userNo;
		this.comNo = comNo;
		this.buyPrice = buyPrice;
		this.volume = volume;
		this.buyDate = buyDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}
	
	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyStockVO [no=").append(no).append(", comName=").append(comName).append(", userNo=").append(userNo).append(", comNo=").append(comNo).append(", buyPrice=")
				.append(buyPrice).append(", volume=").append(volume).append(", buyDate=").append(buyDate).append("]");
		return builder.toString();
	}
	
}
