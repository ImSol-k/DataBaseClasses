package com.javaex.ex02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorDao {

	private List<AuthorVo> authorList = new ArrayList<AuthorVo>();
	private AuthorVo author;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private void authorSetting() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/book_db";
			conn = DriverManager.getConnection(url, "book", "book");
			// String url = "jdbc:mysql://192.168.0.43:3306/book_db";
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 

	}
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
	}

	// 불러오기
	public void authorSelect() {
		try {
			authorSetting();
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

				author = new AuthorVo(id, name, desc);
				authorList.add(author);
			}
			System.out.println("==================================================");
			for (int i = 0; i < authorList.size(); i++) {
				authorList.get(i).showInfo();

			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		close();
	}

	// 리스트
	public void authorShowList() {
		for (int i = 0; i < authorList.size(); i++) {
			authorList.get(i).showInfo();
		}
	}

	public List<AuthorVo> authorList() {

		try {
			authorSetting();
			authorSetting();
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

				author = new AuthorVo(id, name, desc);
				authorList.add(author);
			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		close();
		return authorList;
	} // List

	// 추가
	public int AuthorInsert(String name, String desc) {

		int count = -1;
		try {
			authorSetting();

			String query = "";
			int n = authorList.size() + 1;
			query += " insert into author";
			query += " values(null, ?, ?)";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, desc);

			count = pstmt.executeUpdate();
			System.out.println();
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		close();
		return count;

	}// insert

	// 삭제
	public void authorDelete(int num) {
		try {
			authorSetting();

			String query = "";
			query += " delete from author";
			query += " where author_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);

			int count = pstmt.executeUpdate();
			System.out.println(count + "건 삭제 되었습니다.");
			authorList.remove(num - 1);

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		close();
	}

	public void authorUpdate(String name, String desc, int id) {

		try {
			authorSetting();

			String query = "";
			query += " update author";
			query += " set author_name = ?,";
			query += "     author_desc = ?";
			query += " where author_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, desc);
			pstmt.setInt(3, id);

			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} 
		close();
	}

}
