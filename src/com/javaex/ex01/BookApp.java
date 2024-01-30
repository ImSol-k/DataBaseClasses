package com.javaex.ex01;

import java.util.List;
import java.util.Scanner;

public class BookApp {

	public static void main(String[] args) {
		
		AuthorDao author = new AuthorDao();
		List<AuthorVo> authorList = author.authorList();
		Scanner in = new Scanner(System.in);
		
		for(AuthorVo vo : authorList) {
			int id = vo.getId();
			String name = vo.getAuthorName();
			String desc = vo.getAuthorDesc();
			System.out.println(id + ". " + name + " / " + desc);
		}

		
		in.close();

	}//main

}
