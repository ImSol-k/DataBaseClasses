package project.phone;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PhoneFunction  {
	
	private Scanner in = new Scanner(System.in);
	private List<PhoneDB> pList = new ArrayList<PhoneDB>();
	private PhoneDB pDB;
	private String num, name, ph, company, search;
	

	public void phoneDBStart() {
		System.out.println("*****************************************");
		System.out.println("*\t    전화번호 관리 프로그램     \t*");
		System.out.println("*****************************************");
		System.out.println();
	}

//	public String phoneStart() {
//		System.out.println();
//		System.out.println("1.리스트  2.등록  3.삭제  4.검색  5.종료");
//		System.out.println("----------------------------------");
//		System.out.print(">메뉴번호 :");
//		num = in.nextLine();
//	}
	
	public void phoneRead() {
		try {

			Reader fr = new FileReader("C:\\javaStudy\\PhoneDB.txt");
			BufferedReader br = new BufferedReader(fr);

			while(true) {
				String str = br.readLine();
				if(str == null) {
					break;
				}
				String[] sArr = str.split(",");
				pDB = new PhoneDB(sArr[0], sArr[1], sArr[2]);
				pList.add(pDB);
				br.close();
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void showList() {
		for (int i = 0; i < pList.size(); i++) {
			System.out.print((i+1) + ".  ");
			pList.get(i).showInfo();
		}
	}
	
	public void Add() {
		System.out.println("<2.등록>");				
		System.out.print(">이름: ");
		name = in.nextLine();
		System.out.print(">휴대전화: ");
		ph = in.nextLine();
		System.out.print(">회사전화: ");
		company = in.nextLine();
		
		pDB = new PhoneDB(name, ph, company);
		pList.add(pDB);
	}
	
	public void Delete() {
		System.out.println("<3.삭제>");
		System.out.print(">번호 : ");
		int i  = in.nextInt();
		in.nextLine();
		pList.remove(i-1);
	}
	
	public void Search() {
		System.out.println("<4.검색>");
		System.out.print(">이름: ");
		search = in.nextLine();
		for (int i = 0; i < pList.size(); i++) {
			String ns = pList.get(i).getName();
			if(ns.contains(search));{
				pList.get(i).showInfo();
			}
		}
		
	}
	
	public void phoneEnd() {
		System.out.println();
		System.out.println("*****************************************");
		System.out.println("*\t\t감사합니다 \t\t\t*");
		System.out.println("*****************************************");
	}
	
}
