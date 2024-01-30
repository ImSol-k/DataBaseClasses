package com.javaex.ex01.copy;

import java.util.Scanner;

public class BookApp {

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		String authorName, authorDesc;
		int num;
		boolean start = true;
		AuthorDao author = new AuthorDao();

		
		author.authorSelect();
		while (start) {
			System.out.println("==================================================");
			System.out.println("1.리스트 2.추가 3.삭제 4.수정 5.종료");
			System.out.print(">> ");
			num = in.nextInt();
			in.nextLine();
			System.out.println("==================================================");
			switch (num) {
			case 1:
				author.authorShowList();
				System.out.println("==================================================");
				break;
			case 2:
				System.out.print("작가입력 >>");
				authorName = in.nextLine();
				System.out.print("작가정보 입력 >> ");
				authorDesc = in.nextLine();
				author.AuthorInsert(authorName, authorDesc);
				break;
			case 3:
				System.out.print("삭제할 번호 입력 >> ");
				num = in.nextInt();
				author.authorDelete(num);
				break;
			case 4:
				System.out.print("수정할 id입력 >> ");
				num = in.nextInt();
				in.nextLine();
				System.out.print("작가수정 >>");
				authorName = in.nextLine();
				System.out.print("작가정보 수정 >> ");
				authorDesc = in.nextLine();
				author.authorUpdate(authorName, authorDesc, num);
				break;
			case 5:
				System.out.println(">> 종료되었습니다 <<");
				start = false;
				break;

			}
		}
		in.close();

	}//main

}
