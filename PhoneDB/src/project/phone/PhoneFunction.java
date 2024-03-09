package project.phone;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PhoneFunction {
	
	private Scanner in = new Scanner(System.in);
	private List<PhoneDB> pList = new ArrayList<PhoneDB>();
	private PhoneDB pDB;
	private String name, ph, company, search;
	private int num;
	

	public void phoneDBStart() {
		System.out.println("*****************************************");
		System.out.println("*\t    전화번호 관리 프로그램     \t*");
		System.out.println("*****************************************");
		System.out.println();
	}

	public void phoneStart() {
//		System.out.println();
//		System.out.println("1.리스트  2.등록  3.삭제  4.검색  5.종료");
//		System.out.println("----------------------------------");
//		System.out.print(">메뉴번호 :");
//		num = in.nextLine();
	}
	
	public void phoneRead() {
		try {

			Reader fr = new FileReader("C:\\javaStudy\\PhoneDB.txt");
			BufferedReader br = new BufferedReader(fr);
			
			while(true) {
				String str = br.readLine();
				num ++;
				if(str == null) {
					break;
				}
				String[] sArr = str.split(",");
				pDB = new PhoneDB(num, sArr[0], sArr[1], sArr[2]);
				pList.add(pDB);
			}
		} catch (Exception e) { }

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
		
		num = pList.size() + 1;
		pDB = new PhoneDB(num, name, ph, company);
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
			if((pList.get(i).getName()).contains(search)){
				System.out.print(pList.get(i).getNum() + ".  ");
				pList.get(i).showInfo();
			}
		}
		
	}
	
	public void phoneEnd() {
		System.out.println();
		System.out.println("*****************************************");
		System.out.println("*\t\t감사합니다 \t\t*");
		System.out.println("*****************************************");
	}
	
}
