package project.phone;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PhoneApp {

	public static void main(String[] args) throws Exception {
		
		List<PhoneDB> pList = new ArrayList<PhoneDB>();
		PhoneFunction phone = new PhoneFunction();
		PhoneDB pDB;
				
		phone.phoneDBStart();	
		phone.phoneRead();
		
		Scanner in = new Scanner(System.in);
		String num;
		boolean start = true;
		
		while(start) {
			System.out.println();
			System.out.println("1.리스트  2.등록  3.삭제  4.검색  5.종료");
			System.out.println("----------------------------------");
			System.out.print(">메뉴번호 :");
			num = in.nextLine();
			switch(num) {
			case"1":
				phone.showList();
				start = true;
				break;
				
			case"2":
				phone.Add();
				start = true;
				break;
				
			case"3":
				phone.Delete();
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
	}

}
