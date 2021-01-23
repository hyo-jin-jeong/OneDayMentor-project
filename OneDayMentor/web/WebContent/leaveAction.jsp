<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
      <%
      String userID = null;
      if(session.getAttribute("userID") != null){
         userID = (String) session.getAttribute("userID");
      }
      
      UserDAO userDAO = new UserDAO(); //인스턴스생성
      int result = userDAO.leave(userID);
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('탈퇴 실패')");
         script.println("history.back()");
         script.println("</script>");
      }
      else{
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('정상적으로 탈퇴 성공')");
         session.invalidate();
         script.println("location.href = 'main.jsp'");
         script.println("</script>");
      }
      %>
</body>
</html>