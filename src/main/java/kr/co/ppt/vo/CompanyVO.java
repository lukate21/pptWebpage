package kr.co.ppt.vo;

public class CompanyVO {
	
	private int no;
	private String name;
	private String code;
	private String stockType;
	
	public CompanyVO() {}

	public CompanyVO(int no, String name, String code, String stockType) {
		this.no = no;
		this.name = name;
		this.code = code;
		this.stockType = stockType;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStockType() {
		return stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompanyVO [no=").append(no).append(", name=").append(name).append(", code=").append(code).append(", stockType=")
				.append(stockType).append("]");
		return builder.toString();
	}
	
}
