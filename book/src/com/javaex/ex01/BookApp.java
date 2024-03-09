package com.javaex.ex01;

import java.util.List;
import java.util.Scanner;

public class BookApp {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		AuthorDao author = new AuthorDao();
		
		//int cnt = author.AuthorInsert("이효리", "제주도");
		//System.out.println(cnt + "건 추가");
		
		List<AuthorVo> authorList = author.authorList();
		for(AuthorVo vo : authorList) {
			int id = vo.getId();
			String name = vo.getAuthorName();
			String desc = vo.getAuthorDesc();
			System.out.println(id + ". " + name + " / " + desc);
		}

		
		in.close();

	}//main

}
