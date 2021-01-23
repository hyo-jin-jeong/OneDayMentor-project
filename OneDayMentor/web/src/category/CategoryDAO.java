package category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryDAO {
	
			private Connection conn; // connection:db에접근하게 해주는 객체
			private ResultSet rs;	
			public CategoryDAO() {
				// 생성자를 만들어준다.
				try {
					String dbURL = "jdbc:mysql://localhost:3306/ODM?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
					String dbID = "root";
					String dbPassword = "1234";
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			public String getCategoryName(int id) {
				String SQL="select categoryName from category where categoryID = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, id);
					rs = pstmt.executeQuery();

					if(rs.next()) {
						return rs.getString(1);
					} 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "";	
			}
			
			public String getCategoryKorean(int id) {
				String SQL="select categoryKorean from category where categoryID = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, id);
					rs = pstmt.executeQuery();

					if(rs.next()) {
						return rs.getString(1);
					} 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "";
			}
		
				
	}