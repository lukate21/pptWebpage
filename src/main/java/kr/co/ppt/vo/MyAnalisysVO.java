package kr.co.ppt.vo;

public class MyAnalisysVO {

	private int no;
	private int userNo;
	private int myDicNo;
	private String anaCode;
	private String name;
	private String regDate;
	
	public MyAnalisysVO() {}

	public MyAnalisysVO(int no, int userNo, int myDicNo, String anaCode, String name, String regDate) {
		this.no = no;
		this.userNo = userNo;
		this.myDicNo = myDicNo;
		this.anaCode = anaCode;
		this.name = name;
		this.regDate = regDate;
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

	public int getMyDicNo() {
		return myDicNo;
	}

	public void setMyDicNo(int myDicNo) {
		this.myDicNo = myDicNo;
	}

	public String getAnaCode() {
		return anaCode;
	}

	public void setAnaCode(String anaCode) {
		this.anaCode = anaCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyAnalisysVO [no=").append(no).append(", userNo=").append(userNo).append(", myDicNo=").append(myDicNo).append(", anaCode=")
				.append(anaCode).append(", name=").append(name).append(", regDate=").append(regDate).append("]");
		return builder.toString();
	}
	
}
