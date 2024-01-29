package com.javaex.author;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorSelect {

	public static void main(String[] args) {
		
		List<AuthorVo> authorList = new ArrayList<AuthorVo>();

		// 0. import java.sql.*;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JDBC 드라이버 (Oracle) 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2. Connection 얻어오기
			String url = "jdbc:mysql://localhost:3306/book_db";
			conn = DriverManager.getConnection(url, "book", "book");

			// 3. SQL문 준비 / 바인딩 / 실행
			//준비
			String query = "";
			query += " select author_id,";
			query += " 		  author_name,";
			query += "  	  author_desc";
			query += " from author";
			//바인딩
			pstmt = conn.prepareStatement(query);
			//실행
			rs = pstmt.executeQuery();

			// 4.결과처리
			int id;
			String name;
			String desc;
			while(rs.next()) {
				
				id = rs.getInt("author_id");
				name = rs.getString("author_name");
				desc = rs.getString("author_desc");
				
				AuthorVo v0= new AuthorVo(id, name, desc);
				authorList.add(v0);
			}
			
			for (int i = 0; i < authorList.size(); i++) {
				//System.out.println(authorList.get(i).toString());
				authorList.get(i).showInfo();
				
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			// 5. 자원정리
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

	}

}
