package kr.co.ppt.vo;

public class MyDictionaryVO {

	private int no;
	private int userNo;
	private int comNo;
	private String name;
	
	public MyDictionaryVO() {}
	
	public MyDictionaryVO(int no, int userNo, int comNo, String name) {
		this.no = no;
		this.userNo = userNo;
		this.comNo = comNo;
		this.name = name;
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
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyDictionaryVO [no=").append(no).append(", userNo=").append(userNo).append(", comNo=").append(comNo).append(", name=")
				.append(name).append("]");
		return builder.toString();
	}
	
}
