package com.javaex.ex01.copy;

public class BookVo {
	
	private int bookId;
	private String title;
	private String pubs;
	private String pubData;
	private int authorId;
	private String authorName;
	private String authorDesc;
	

	
	public BookVo() {
		super();
	}
	public BookVo(int bookId, String title, String pubs, String pubData, int authorId, String authorName,
			String authorDesc) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.pubs = pubs;
		this.pubData = pubData;
		this.authorId = authorId;
		this.authorName = authorName;
		this.authorDesc = authorDesc;
	}



	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPubs() {
		return pubs;
	}
	public void setPubs(String pubs) {
		this.pubs = pubs;
	}
	public String getPubData() {
		return pubData;
	}
	public void setPubData(String pubData) {
		this.pubData = pubData;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getAuthorDesc() {
		return authorDesc;
	}
	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
	}
	
	
	public void showInfo() {
		System.out.println("책번호 : " + bookId + ",\t 책제목 : " + title + ",\t\t 출판사 : " + pubs + ",\t\t 출판일 : " + pubData
				+ ",\t 작가번호 : " + authorId + ",\t 작가이름 : " + authorName + ",\t 작가정보 : " + authorDesc + "]");
	}
	
	
	
	@Override
	public String toString() {
		return "[bookId=" + bookId + ", title=" + title + ", pubs=" + pubs + ", pubData=" + pubData				
				+ ", authorId=" + authorId + ", authorName=" + authorName + ", authorDesc=" + authorDesc + "]";
	}
	
	
	

	
}
