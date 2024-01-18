package project.phone;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PhoneApp {

	public static void main(String[] args) throws Exception {
		
		Reader fr = new FileReader("C:\\javaStudy\\PhoneDB.txt");
		BufferedReader br = new BufferedReader(fr);
		
		List<PhoneDB> pList = new ArrayList<PhoneDB>();
		PhoneFunction phone = new PhoneFunction();
		PhoneDB pDB;
		
		
		System.out.println("*****************************************");
		System.out.println("*\t    전화번호 관리 프로그램     \t*");
		System.out.println("*****************************************");
		System.out.println();
		
		while(true) {
			String str = br.readLine();
			if(str == null) {
				break;
			}
			String[] sArr = str.split(",");
			pDB = new PhoneDB(sArr[0], sArr[1], sArr[2]);
			pList.add(pDB);
		}
		
		
		
		Scanner in = new Scanner(System.in);
		String num, name, ph, company;
		boolean start = true;
		
		while(start) {
			System.out.println();
			System.out.println("1.리스트  2.등록  3.삭제  4.검색  5.종료");
			System.out.println("----------------------------------");
			System.out.print(">메뉴번호 :");
			num = in.nextLine();
			switch(num) {
			case"1":
				for (int i = 0; i < pList.size(); i++) {
					System.out.print((i+1) + ".  ");
					pList.get(i).showInfo();
				}
				start = true;
				break;
				
			case"2":
				System.out.println("<2.등록>");				
				System.out.print(">이름: ");
				name = in.nextLine();
				System.out.print(">휴대전화: ");
				ph = in.nextLine();
				System.out.print(">회사전화: ");
				company = in.nextLine();
				
				pDB = new PhoneDB(name, ph, company);
				pList.add(pDB);
				start = true;
				break;
				
			case"3":
				System.out.println("<3.삭제>");
				System.out.print(">번호 : ");
				int i  = in.nextInt();
				in.nextLine();
				pList.remove(i-1);
				start = true;
				break;
				
			case"4":
				
				start = true;
				break;
				
			case"5":
				phone.Esc();
				start = false;
				break;
				
			default:
				System.out.println("[다시 입력해 주세요.]");
				start = true;
				break;
			}
			
		}
		
		
		
		in.close();
		br.close();
	}

}
