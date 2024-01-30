package com.javaex.ex02;

import java.util.List;

public class BookApp {

	public static void main(String[] args) {
		
		AuthorDao author = new AuthorDao();
		List<AuthorVo> authorList = author.authorList();
		AuthorVo authorVo = new AuthorVo(9, "나비야", "이리날아오너라");
		author.authorUpdate(authorVo);
		
		//author.authorDelete(8);
		for (int i = 0; i < authorList.size(); i++) {
			authorList.get(i).showInfo();
		}
		
	}// main

}
