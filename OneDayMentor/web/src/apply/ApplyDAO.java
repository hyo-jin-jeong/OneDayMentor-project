package apply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ApplyDAO {
   private Connection conn; // connection:db에접근하게 해주는 객체
   private ResultSet rs;

   // mysql 처리부분
   public ApplyDAO() {
      // 생성자를 만들어준다.
      try {
         String dbURL = "jdbc:mysql://localhost:3306/ODM?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // localhost:3306
                                                                                                                        // 포트는
                                                                                                                        // 컴퓨터설치된
                                                                                                                        // mysql주소
         String dbID = "root";
         String dbPassword = "1234";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // bbsID 게시글 번호 가져오는 함수
   public int getNext() {
      String SQL = "SELECT applyID FROM APPLY ORDER BY applyID DESC";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return rs.getInt(1) + 1;
         }
         return 1;// 현재가 첫 번째 게시물인 경우
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // 데이터베이스 오류
   }
   
   // 10개 단위로 지원 목록 반환하는 함수 
   public ArrayList<Apply> getList(int bbsID, int row, int count) {
      String SQL = "select writingTitle, mentorID, writingContent, applyAvailable, applyID "
            + "from apply where bbsID = ? order by applyID desc limit ?, ?";

      ArrayList<Apply> list = new ArrayList<Apply>();
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setInt(1, bbsID);
         pstmt.setInt(2, row);
         pstmt.setInt(3, count);

         rs = pstmt.executeQuery();
         while (rs.next()) {
            Apply apply = new Apply();
            apply.setWritingTitle(rs.getString(1));
            apply.setMentorID(rs.getString(2));
            apply.setWritingContent(rs.getString(3));
            apply.setApplyAvailable(rs.getInt(4));
            apply.setApplyID(rs.getInt(5));
            list.add(apply);
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
      return list; // 열개 뽑아온 게시글 리스트 리턴
   }
   // 지원하는 함수
   public int apply(int bbsID, int categoryID, String menteeID, String mentorID, String writingTitle,
         String writingContent, int applyAvailable) {
      String SQL = "INSERT INTO APPLY VALUES(?,?,?,?,?,?,?,?)";

      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, getNext());
         pstmt.setInt(2, bbsID);
         pstmt.setInt(3, categoryID);
         pstmt.setString(4, menteeID);
         pstmt.setString(5, mentorID);
         pstmt.setString(6, writingTitle);
         pstmt.setString(7, writingContent);
         pstmt.setInt(8, 0);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // db오류
   }

   // 10 단위 페이징 처리를 위한 함수
   public boolean nextPage(int pageNumber, int bbsID) {
      int count = 0;
      String SQL = "SELECT writingTitle FROM apply where bbsID=? limit ?,?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         pstmt.setInt(2, pageNumber * 10);
         pstmt.setInt(3, 11);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            count++;
            if (count == 11)
               return true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }

   // 같은 글에 멘토신청 중복 못하게 하기
   public int cancel(int bbsID, String mentorID) { // 멘토가 신청 취소
      String SQL = "DELETE FROM APPLY WHERE bbsID = ? and mentorID = ?";

      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         pstmt.setString(2, mentorID);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int overlap(int bbsID, String menteeID, String mentorID) {
      String SQL = "select applyID from apply where bbsID = ? and menteeID = ? and mentorID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         pstmt.setString(2, menteeID);
         pstmt.setString(3, mentorID);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1;// 처음 지원일때
   }

   public Apply content(int applyID) {
      String SQL = "select writingTitle, writingContent from apply where applyID = ?";
      Apply apply = new Apply();
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, applyID);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            apply.setWritingTitle(rs.getString(1));
            apply.setWritingContent(rs.getString(2));
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return apply;// 처음 지원일때
   }

   public int delete(int bbsID) {
      String SQL = "delete from apply where bbsID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // 데베 오류
   }

   public int getApplyCount(int bbsID) {
      String SQL = "select count(applyID) from apply where bbsID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            return rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -1; // 데베 오류
   }

   public int getApplyAvailable(int bbsID) {
      String SQL = "select applyAvailable from apply where bbsID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            return rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return -1;
   }
   

   public Apply getApply(int bbsID) {
      String SQL = "select * from apply where bbsID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, bbsID);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            Apply apply = new Apply();
            apply.setApplyID(rs.getInt(1));
            apply.setBbsID(rs.getInt(2));
            apply.setCategoryID(rs.getInt(3));
            apply.setMenteeID(rs.getString(4));
            apply.setMentorID(rs.getString(5));
            apply.setWritingTitle(rs.getString(6));
            apply.setWritingContent(rs.getString(7));
            apply.setApplyAvailable(rs.getInt(8));
            return apply;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public int contact(int applyID) {
      String SQL = "update apply set applyAvailable = 1 where applyAvailable = 0 and applyID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setInt(1, applyID);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }

      return -1;
   }

   public int getApplyID(String menteeID, String mentorID, int bbsID) {
      String SQL = "select applyID "
            + "from apply "
            + "where menteeID = ? and mentorID = ? and bbsID = ?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, menteeID);
         pstmt.setString(2, mentorID);
         pstmt.setInt(3, bbsID);
          rs = pstmt.executeQuery();
          if (rs.next()) {
              return rs.getInt(1);
          }
            
      } catch (Exception e) {
            e.printStackTrace();
         }
      
      return -1;
   }
   
   public int getApplyID2(String userID, int bbsID) {
      String SQL = "select applyID "
               + "from apply "
               + "where (menteeID = ? or mentorID = ?) and bbsID = ?";
         try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userID);
            pstmt.setInt(3, bbsID);
             rs = pstmt.executeQuery();
             if (rs.next()) {
                 return rs.getInt(1);
             }
               
         } catch (Exception e) {
               e.printStackTrace();
            }
         
         return -1;
      }
   
   public boolean isAvailable(int bbsID) {	// applyAvailable이 1이면 true 0이면 false
	   String SQL = "select count(*) from apply where bbsID = ? and applyAvailable = 1";
         try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
             rs = pstmt.executeQuery();
             if (rs.next()) {
            	 if(rs.getInt(1) != 0)
            		 return true;
             }
               
         } catch (Exception e) {
               e.printStackTrace();
            }
	   return false;
   }
   
   public boolean isMentee(int applyID, String userID) {	// 멘티이면 true 멘토이면 false
	   String SQL = "select count(*) from apply where applyID = ? and menteeID = ?";
       try {
          PreparedStatement pstmt = conn.prepareStatement(SQL);
          pstmt.setInt(1, applyID);
          pstmt.setString(2, userID);
          rs = pstmt.executeQuery();
           if (rs.next()) {
          	 if(rs.getInt(1) != 0)
          		 return true;
           }
             
       } catch (Exception e) {
             e.printStackTrace();
          }
       
	   return false;
   }
   // applyID로 해당 멘토의 메타마스크 주소 반환하는 함수
   public String getMentorAddress(int applyID) {
	   String SQL = "select userMeta from apply a, user u where a.applyID = ? and a.mentorID = u.userID";
       try {
          PreparedStatement pstmt = conn.prepareStatement(SQL);
          pstmt.setInt(1, applyID);
          rs = pstmt.executeQuery();
           if (rs.next()) {
        	   return rs.getString(1);
           }
             
       } catch (Exception e) {
             e.printStackTrace();
          }
       
	   return "";
   }

}