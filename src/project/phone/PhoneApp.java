package project.phone;

import java.util.Scanner;

public class PhoneApp {

	public static void main(String[] args) {

		PhoneFunction phone = new PhoneFunction();
		Scanner in = new Scanner(System.in);
		int num;
		boolean start = true;

		phone.phoneDBStart();	
		phone.phoneRead();
		
		try {
			while(start) {
				System.out.println();
				System.out.println("1.리스트  2.등록  3.삭제  4.검색  5.종료");
				System.out.println("----------------------------------");
				System.out.print(">메뉴번호 :");
				num = in.nextInt();
				in.nextLine();
				
				switch(num) {
				case 1:
					phone.showList();
					start = true;
					break;				
				case 2:
					phone.Add();
					start = true;
					break;				
				case 3:
					phone.Delete();
					start = true;
					break;				
				case 4:
					phone.Search();
					start = true;
					break;				
				case 5:
					phone.phoneEnd();
					start = false;
					break;				
				default:
					System.out.println("[다시 입력해 주세요.]");
					start = true;
					break;
				}

			}
		} catch (Exception e) {
			System.out.println("*번호 인식 불가");
			System.out.println("[프로그램 종료]");
		}
		in.close();
	}

}
