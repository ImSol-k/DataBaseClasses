package com.javaex.ex03;

public class AuthorVo {
	
	private int id;
	private String authorName;
	private String authorDesc;
	

	public AuthorVo() {}
	public AuthorVo(String authorName, String authorDesc) {
		this.authorName = authorName;
		this.authorDesc = authorDesc;
	}
	public AuthorVo(int id, String authorName, String authorDesc) {
		this.id = id;
		this.authorName = authorName;
		this.authorDesc = authorDesc;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
		System.out.println(id + ".\t 작가: " + authorName + " \t 정보: " + authorDesc);
	}
	
	
	
	
	@Override
	public String toString() {
		return "AuthorVo [id=" + id + ", authorName=" + authorName + ", authorDesc=" + authorDesc + "]";
	}
	
	
	
}
