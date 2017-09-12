package kr.co.ppt.vo;

public class MyStockVO {

	private int no;
	private int userNo;
	private int comNo;
	private int buyPrice;
	private int volume;

	public MyStockVO() {}

	public MyStockVO(int no, int userNo, int comNo, int buyPrice, int volume) {
		this.no = no;
		this.userNo = userNo;
		this.comNo = comNo;
		this.buyPrice = buyPrice;
		this.volume = volume;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyStockVO [no=").append(no).append(", userNo=").append(userNo).append(", comNo=").append(comNo).append(", buyPrice=")
				.append(buyPrice).append(", volume=").append(volume).append("]");
		return builder.toString();
	}
	
}
