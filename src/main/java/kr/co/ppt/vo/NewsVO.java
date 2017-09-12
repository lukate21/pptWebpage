package kr.co.ppt.vo;

public class NewsVO {
	
	private int no;
	private String title;
	private String link;
	private String content;
	private String image;
	
	public NewsVO() {}

	public NewsVO(int no, String title, String link, String content, String image) {
		this.no = no;
		this.title = title;
		this.link = link;
		this.content = content;
		this.image = image;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NewsVO [no=").append(no).append(", title=").append(title).append(", link=").append(link).append(", content=")
				.append(content).append(", image=").append(image).append("]");
		return builder.toString();
	}
	
}
