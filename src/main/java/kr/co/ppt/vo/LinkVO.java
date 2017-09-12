package kr.co.ppt.vo;

public class LinkVO {

	private int no;
	private String name;
	private String url;
	
	public LinkVO() {}

	public LinkVO(int no, String name, String url) {
		this.no = no;
		this.name = name;
		this.url = url;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LinkVO [no=").append(no).append(", name=").append(name).append(", url=").append(url).append("]");
		return builder.toString();
	}
	
}
