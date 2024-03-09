package com.javaex.ex03;

import java.util.List;

public class BookApp {

	public static void main(String[] args) {
		
		AuthorDao author = new AuthorDao();
		BookDao book = new BookDao();
		List<AuthorVo> authorList = author.authorList();
		List<BookVo> bookList = book.bookList();
		//AuthorVo authorVo = new AuthorVo("김소리", "나야나");
		//author.authorInsert(authorVo);
		book.bookSelectAll();
		//author.authorUpdate("이혜리", "대왕빵꾸똥꾸", 9);
		//author.authorDelete(8);
		for (int i = 0; i < bookList.size(); i++) {
			System.out.println(bookList.get(i).toString()); 
		}
		
	}// main

}
