package kr.co.ppt.vo;

public class MyFavoriteVO {

	private int no;
	private int userNo;
	private int comNo;
	private String comName;

	public MyFavoriteVO() {}

	public MyFavoriteVO(int no, int userNo, int comNo) {
		this.no = no;
		this.userNo = userNo;
		this.comNo = comNo;
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

	
	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyFavoriteVO [no=").append(no).append(", userNo=").append(userNo).append(", comNo=").append(comNo).append("]");
		return builder.toString();
	}
	
}
