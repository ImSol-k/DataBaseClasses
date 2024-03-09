package com.javaex.ex03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
	
	private List<BookVo> bookList = new ArrayList<BookVo>();
	private BookVo bookVo;
	private AuthorVo author;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String dv = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/book_db";
	private String id = "book";
	private String pw = "book";

	private void bookSetting() {
		try {
			Class.forName(dv);
			String url = this.url;
			conn = DriverManager.getConnection(url, id, pw);
			// String url = "jdbc:mysql://192.168.0.43:3306/book_db";
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}

	}//authorSetting()

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}//close()

	// 불러오기
	public void bookSelectAll() {

		bookSetting();

		try {
			
			String query = "";
			query += " select book_id,";
			query += " 		  title,";
			query += " 		  pubs,";
			query += " 		  pub_date,";
			query += " 		  b.author_id,";
			query += " 		  author_name,";
			query += "  	  author_desc";
			query += " from book b, author a";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			System.out.println("select");
			int bookId, authorId;
			String title, pubs, pubData, authorName, authorDesc;
			while (rs.next()) {

				bookId = rs.getInt("book_id");
				title = rs.getString("title");
				pubs = rs.getString("pubs");
				pubData = rs.getString("pub_date");				
				authorId = rs.getInt("author_id");
				authorName = rs.getString("author_name");
				authorDesc = rs.getString("author_desc");

				bookVo = new BookVo(bookId, title, pubs, pubData, authorId, authorName, authorDesc);
				bookList.add(bookVo);
			}
			System.out.println("==================================================");
//			for (int i = 0; i < bookList.size(); i++) {
//				System.out.println(bookList.get(i).toString()); 
//
//			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
	}//authorSelect()

	// 리스트
	public void bookShowList() {
		for (int i = 0; i < bookList.size(); i++) {
			bookList.get(i).showInfo();
		}
	}//authorShowList() 

	// 리스트
	public List<BookVo> bookList() {

		bookSetting();

		try {
			String query = "";
			query += " select author_id,";
			query += " 		  author_name,";
			query += "  	  author_desc";
			query += " from author";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			int id;
			String name;
			String desc;
			while (rs.next()) {

				id = rs.getInt("author_id");
				name = rs.getString("author_name");
				desc = rs.getString("author_desc");

				bookVo = new BookVo();
				bookList.add(bookVo);
			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
		return bookList;
	} //authorList

	// 추가
	public int bookInsert(String name, String desc) {

		int count = -1;
		bookSetting();

		try {
			String query = "";
			query += " insert into author";
			query += " values(null, ?, ?)";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, desc);

			count = pstmt.executeUpdate();
			System.out.println(count + "건 추가 되었습니다.");
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
		return count;

	}//authorInsert()
	public int bookInsert(AuthorVo author) {

		int count = -1;
		bookSetting();

		try {
			String query = "";
			query += " insert into author";
			query += " values(null, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, author.getAuthorName());
			pstmt.setString(2, author.getAuthorDesc());
			count = pstmt.executeUpdate();
			System.out.println(count + "건 추가 되었습니다.");
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
		return count;

	}//authorInsert()

	// 삭제
	public int bookDelete(int num) {
		int count = -1;
		bookSetting();

		try {
			String query = "";
			query += " delete from author";
			query += " where author_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);

			count = pstmt.executeUpdate();
			System.out.println(count + "건 삭제 되었습니다.");
			bookList.remove(num - 1);

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
		return count;
	}//authorDelete()

	public void bookUpdate(String name, String desc, int id) {

		bookSetting();

		try {
			String query = "";
			query += " update author";
			query += " set author_name = ?,";
			query += "     author_desc = ?";
			query += " where author_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, desc);
			pstmt.setInt(3, id);

			//rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			System.out.println("수정되었습니다");
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
	}//authorUpdate()
	
	
}
