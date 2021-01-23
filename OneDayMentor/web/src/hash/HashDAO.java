package hash;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HashDAO {
	// dao : 데이터베이스 접근 객체의 약자로서
	   // 실질적으로 db에서 회원정보 불러오거나 db에 회원정보 넣을때

	   private Connection conn; // connection:db에접근하게 해주는 객체
	   private ResultSet rs;

	   // mysql에 접속해 주는 부분

	   public HashDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함
	      try {
	         String dbURL = "jdbc:mysql://localhost:3306/ODM?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // localhost:3306                                                                                                         // mysql주소
	         String dbID = "root";
	         String dbPassword = "1234";
	         Class.forName("com.mysql.jdbc.Driver");
	         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	      } catch (Exception e) {
	         e.printStackTrace(); // 오류가 무엇인지 출력
	      }
	   }
	 //현재의 시간을 가져오는 함수
       public String getDate() { 
          String SQL = "SELECT NOW()";
          try {
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             rs = pstmt.executeQuery();
             if(rs.next()) {
                return rs.getString(1);
             }

          } catch (Exception e) {
             e.printStackTrace();
          }

          return ""; //데이터베이스 오류

       }
       
       // hash 테이블에 넣는 함수
       public int insert(String userMeta, String hash) { 
          String SQL = "INSERT INTO hash VALUES(?, ?, ?)";

          try {
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             pstmt.setString(1, userMeta);
             pstmt.setString(2, hash);
             pstmt.setString(3, getDate());
             return pstmt.executeUpdate();
          } catch (Exception e) {
             e.printStackTrace();
          }
          return -1; //데이터베이스 오류
       }
	   
	/*
	 * public ArrayList<String> getHash(String userMeta) { String SQL =
	 * "select hash from hash where userMeta = ?"; ArrayList<String> hashes = new
	 * ArrayList<String>();
	 * 
	 * try { PreparedStatement pstmt = conn.prepareStatement(SQL);
	 * pstmt.setString(1, userMeta); rs = pstmt.executeQuery(); while (rs.next()) {
	 * hashes.add(rs.getString(1)); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return hashes; }
	 */
       public ArrayList<Hash> getHash(String userMeta) {
		   String SQL = "select hash, date from hash where userMeta = ?";
		   ArrayList<Hash> hashes = new ArrayList<Hash>();
		   
		   try {
	              PreparedStatement pstmt = conn.prepareStatement(SQL);
	              pstmt.setString(1, userMeta);
	              rs = pstmt.executeQuery();
	              while (rs.next()) {
	            	 Hash hash = new Hash();
	                 hash.setHash(rs.getString(1));
	                 hash.setDate(rs.getString(2));
	                 hashes.add(hash);
	              }

	           } catch (Exception e) {
	              e.printStackTrace();
	           }
		   return hashes;
	   }  
	   
	 
}
