package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
   // dao : 데이터베이스 접근 객체의 약자
         private Connection conn; // connection:db에접근하게 해주는 객체
         private ResultSet rs;

         // mysql 처리부분
         public BbsDAO() {
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
         

         //bbsID 게시글 번호 가져오는 함수
            public int getNext() { 
               String SQL = "SELECT bbsID FROM Bbs ORDER BY bbsID DESC ";
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  rs = pstmt.executeQuery();
                  if(rs.next()) {
                     return rs.getInt(1) + 1;
                  }
                  return 1;//현재가 첫 번째 게시물인 경우
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return -1; //데이터베이스 오류
            }
            
            
            //실제로 글을 작성하는 함수
            public int write(String bbsTitle, String userID, String bbsContent, int categoryID) { 
               String SQL = "INSERT INTO Bbs VALUES(?, ?, ?, ?, ?, ?, ?)";

               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setInt(1, getNext());
                  pstmt.setString(2, bbsTitle);
                  pstmt.setString(3, userID);
                  pstmt.setString(4, getDate());
                  pstmt.setString(5, bbsContent);
                  pstmt.setInt(6,1);
                  pstmt.setInt(7, categoryID);
                  return pstmt.executeUpdate();
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return -1; //데이터베이스 오류
            }
            
            
            public int getCount(int categoryID) {
               String SQL = "select count(bbsID) from bbs where categoryID = ?";
               int count = 0;
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setInt(1,  categoryID);
                  rs = pstmt.executeQuery();
                  if(rs.next())
                     count = rs.getInt(1);
                  System.out.println(count);

               } catch (Exception e) {
                  e.printStackTrace();
               }

               return count; //열개 뽑아온 게시글 리스트 리턴
   
            }
            
            
            //카테고리별 게시글 불러오는 함수
            public ArrayList<Bbs> getList(int categoryID, int row, int count){
               String SQL = "select bbsID, bbsTitle, userID, bbsDate, categoryID from bbs where categoryID = ? order by bbsDate desc limit ?, ?";
               
               ArrayList<Bbs> list = new ArrayList<Bbs>();
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  
                  pstmt.setInt(1, categoryID);
                  pstmt.setInt(2, row);
                  pstmt.setInt(3, count);
                  
                  rs = pstmt.executeQuery();
                  while (rs.next()) {
                     Bbs bbs = new Bbs();
                     bbs.setBbsID(rs.getInt(1));
                     bbs.setBbsTitle(rs.getString(2));
                     bbs.setUserID(rs.getString(3));
                     bbs.setBbsDate(rs.getString(4));
                     bbs.setCategoryID(rs.getInt(5));
                     list.add(bbs);
                  }

               } catch (Exception e) {
                  e.printStackTrace();
               }
               return list; //열개 뽑아온 게시글 리스트 리턴
            }
            
            //유저별 게시글 불러오는 함수 //마이페이지에서
            public ArrayList<Bbs> getList2(String userID, int row, int count){
               String SQL = "select bbsID, bbsTitle, userID, bbsDate, categoryID from bbs where userID = ? order by bbsDate desc limit ?, ?";
               
               ArrayList<Bbs> list = new ArrayList<Bbs>();
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  
                  pstmt.setString(1, userID);
                  pstmt.setInt(2, row);
                  pstmt.setInt(3, count);
                  
                  rs = pstmt.executeQuery();
                  while (rs.next()) {
                     Bbs bbs = new Bbs();
                     bbs.setBbsID(rs.getInt(1));
                     bbs.setBbsTitle(rs.getString(2));
                     bbs.setUserID(rs.getString(3));
                     bbs.setBbsDate(rs.getString(4));
                     bbs.setCategoryID(rs.getInt(5));
                     list.add(bbs);
                  }

               } catch (Exception e) {
                  e.printStackTrace();
               }
               return list; //열개 뽑아온 게시글 리스트 리턴
            }
           
              
         public ArrayList<Bbs> getList3(String type, String search, int row, int count){
        		//String SQL = "select bbsID, bbsTitle, userID, bbsDate, categoryID from bbs where bbsTitle like ? order by bbsDate desc limit ?, ?";
         String SQL = null;
          if (type.equals("제목"))
             SQL = "SELECT bbsID, bbsTitle, userID, bbsDate, categoryID from bbs where bbsTitle like ? order by bbsDate desc limit ?, ?";
          else
             SQL = "SELECT bbsID, bbsTitle, userID, bbsDate, categoryID from bbs where bbsContent like ? order by bbsDate desc limit ?, ?";
          
          ArrayList<Bbs> list = new ArrayList<Bbs>();
          try {
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             
             pstmt.setString(1, "%" + search + "%");
             pstmt.setInt(2, row);
             pstmt.setInt(3, count);
             
             rs = pstmt.executeQuery();
             while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setCategoryID(rs.getInt(5));
                list.add(bbs);
             }

          } catch (Exception e) {
             e.printStackTrace();
          }
          return list; //열개 뽑아온 게시글 리스트 리턴
       }
         
         //마이페이지 지원된글 bbsID넘기면 그 bbs list만 출력
         public ArrayList<Bbs> getList4(String mentorID, int row, int count){
             String SQL = "select b.bbsID, b.bbsTitle, b.userID, b.bbsDate, b.categoryID "
             		+ "from bbs b, apply a where a.mentorID = ? and b.userID = a.menteeID and b.bbsID=a.bbsID and "
             		+ "b.categoryID=a.categoryID order by a.applyID desc limit ?, ?";
             
             ArrayList<Bbs> list = new ArrayList<Bbs>();
             try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                
                pstmt.setString(1, mentorID);
                pstmt.setInt(2, row);
                pstmt.setInt(3, count);
                
                rs = pstmt.executeQuery();
                while (rs.next()) {
                   Bbs bbs = new Bbs();
                   bbs.setBbsID(rs.getInt(1));
                   bbs.setBbsTitle(rs.getString(2));
                   bbs.setUserID(rs.getString(3));
                   bbs.setBbsDate(rs.getString(4));
                   bbs.setCategoryID(rs.getInt(5));
                   list.add(bbs);
                }

             } catch (Exception e) {
                e.printStackTrace();
             }
             return list; //열개 뽑아온 게시글 리스트 리턴
          }

         public ArrayList<Bbs> getList5(String id, int row, int count){
             String SQL = "select b.bbsID, b.bbsTitle, b.userID, b.bbsDate, b.categoryID "
             		+ "from bbs b, apply a "
             		+ "where (a.mentorID = ? or a.menteeID=?) and a.applyAvailable=1 and b.userID = a.menteeID and b.bbsID=a.bbsID and "
             		+ "b.categoryID=a.categoryID "
             		+ "order by a.applyID desc limit ?, ?";
             
             ArrayList<Bbs> list = new ArrayList<Bbs>();
             try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                
                pstmt.setString(1, id);
                pstmt.setString(2, id);
                pstmt.setInt(3, row);
                pstmt.setInt(4, count);
                
                rs = pstmt.executeQuery();
                while (rs.next()) {
                   Bbs bbs = new Bbs();
                   bbs.setBbsID(rs.getInt(1));
                   bbs.setBbsTitle(rs.getString(2));
                   bbs.setUserID(rs.getString(3));
                   bbs.setBbsDate(rs.getString(4));
                   bbs.setCategoryID(rs.getInt(5));
                   list.add(bbs);
                }

             } catch (Exception e) {
                e.printStackTrace();
             }
             return list; //열개 뽑아온 게시글 리스트 리턴
          }
         
         
            //10 단위 페이징 처리를 위한 함수 //게시물에서
            public boolean nextPage (int pageNumber,int categoryID) {
               int count=0;
               String SQL = "SELECT bbsID FROM bbs where categoryID=? limit ?,?";
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setInt(1,  categoryID);
                  pstmt.setInt(2, pageNumber*10);
                  pstmt.setInt(3, 11);
                  rs = pstmt.executeQuery();
                  while(rs.next()) {
                     count++;
                     if(count == 11)
                        return true;
                  }
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return false;       
            }
            
            //10 단위 페이징 처리를 위한 함수 //마이페이지에서
            public boolean nextPage2 (int pageNumber, String userID) {
               int count=0;
               String SQL = "SELECT bbsID FROM bbs where userID=? limit ?,?";
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setString(1,  userID);
                  pstmt.setInt(2, pageNumber*10);
                  pstmt.setInt(3, 11);
                  rs = pstmt.executeQuery();
                  while(rs.next()) {
                     count++;
                     if(count == 11)
                        return true;
                  }
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return false;       
            }
            
          //10 단위 페이징 처리를 위한 함수 //검색할때
            public boolean nextPage3 (int searchType, int pageNumber,String search) {
               int count=0;
               String SQL = null;
               if(searchType == 0) {
                   SQL = "SELECT bbsID FROM bbs where bbsTitle like ? limit ?,?";
               }
               else {
            	   SQL = "SELECT bbsID FROM bbs where bbsContent like ? limit ?,?";
               }
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setString(1, "%" + search + "%");
                  pstmt.setInt(2, pageNumber*10);
                  pstmt.setInt(3, 11);
                  rs = pstmt.executeQuery();
                  while(rs.next()) {
                     count++;
                     if(count == 11)
                        return true;
                  }
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return false;       
            }
            
            public boolean nextPage4(int pageNumber, String mentorID) {
                int count = 0;
                String SQL = "SELECT applyID FROM apply where mentorID=? limit ?,?";
                try {
                   PreparedStatement pstmt = conn.prepareStatement(SQL);
                   pstmt.setString(1, mentorID);
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
            
            public boolean nextPage5(int pageNumber, String id) {
                int count = 0;
                String SQL = "SELECT applyID FROM apply where (mentorID=? or menteeID =?) and applyAvailable=1 limit ?,?";
                try {
                   PreparedStatement pstmt = conn.prepareStatement(SQL);
                   pstmt.setString(1, id);
                   pstmt.setString(2, id);
                   pstmt.setInt(3, pageNumber * 8);
                   pstmt.setInt(4, 9);
                   rs = pstmt.executeQuery();
                   while (rs.next()) {
                      count++;
                      if (count == 9)
                         return true;
                   }
                } catch (Exception e) {
                   e.printStackTrace();
                }
                return false;
             }

            
            public Bbs getBbs(int bbsID) {
               String SQL = "SELECT * FROM Bbs WHERE bbsID = ?";

               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setInt(1, bbsID);
                  rs = pstmt.executeQuery();

                  if (rs.next()) {
                     Bbs bbs = new Bbs();
                     bbs.setBbsID(rs.getInt(1));
                     bbs.setBbsTitle(rs.getString(2));
                     bbs.setUserID(rs.getString(3));
                     bbs.setBbsDate(rs.getString(4));
                     bbs.setBbsContent(rs.getString(5));
                     bbs.setBbsAvailable(rs.getInt(6));
                     bbs.setCategoryID(rs.getInt(7));
                     return bbs;
                  }
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return null;
            }
            
            //수정 함수
            public int update(int bbsID, String bbsTitle, String bbsContent) {
               String SQL = "UPDATE Bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";

               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);
                  pstmt.setString(1, bbsTitle);
                  pstmt.setString(2, bbsContent);
                  pstmt.setInt(3, bbsID);
                  return pstmt.executeUpdate();
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return -1; // 데이터베이스 오류
            }
            
            //삭제 함수
            public int delete(int bbsID) {
               String SQL = "DELETE FROM Bbs WHERE bbsID = ?";
               try {
                  PreparedStatement pstmt = conn.prepareStatement(SQL);   
                  pstmt.setInt(1, bbsID);
                  return pstmt.executeUpdate();
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return -1; // 데이터베이스 오류
            }
            
           
            
   }