package kr.co.ppt.vo;

public class MemberVO {
	
	private int no;
	private String id;
	private String domain;
	private String password;
	private String name;
	private String tel;
	private String regDate;
	
	public MemberVO() {}

	public MemberVO(int no, String id, String domain, String password, String name, String tel, String regDate) {
		this.no = no;
		this.id = id;
		this.domain = domain;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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
		builder.append("MemberDAO [no=").append(no).append(", id=").append(id).append("@").append(domain).append(", password=")
				.append(password).append(", name=").append(name).append(", tel=").append(tel).append(", regDate=")
				.append(regDate).append("]");
		return builder.toString();
	}
	
}
