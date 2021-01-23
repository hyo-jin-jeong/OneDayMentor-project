<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="category.CategoryDAO" %>
<%@ page import="category.Category" %>
<%@ page import="apply.ApplyDAO" %>
<%@ page import="apply.Apply" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 웹사이트</title>
</head>

<body>
   <jsp:include page="bar.jsp" />
   <%
      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
         String userID = null;
         if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
         }

         int bbsID = 0;
         if (request.getParameter("bbsID") != null) {
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
         }

         if (bbsID == 0) { //번호가 존재해야 글 볼 수 있음
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다.')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
         }
         
         Bbs bbs = new BbsDAO().getBbs(bbsID);
         CategoryDAO CategoryDAO = new CategoryDAO();
         ApplyDAO ApplyDAO = new ApplyDAO();
         Apply apply = new ApplyDAO().getApply(bbsID);
   %>



   <!-- 게시판 -->
   <div class="container main">
      <div class="row">
         <table class="table table-striped"
            style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="3"
                     style="background-color: #eeeeee; text-align: center;"><%=CategoryDAO.getCategoryKorean(bbs.getCategoryID()) %> 게시판 글 보기</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="width: 20%;">Title</td>
                  <td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br/>")%></td>
               </tr>
               <tr>
                  <td>Writer</td>
                  <td colspan="2"><%=bbs.getUserID()%></td>
               </tr>
               <tr>
                  <td>Date</td>
                  <td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
               + bbs.getBbsDate().substring(14, 16) + "분"%></td>
               </tr>
               <tr>
                  <td>Number of Applicants</td>
                  <td colspan="2">현재 <%=ApplyDAO.getApplyCount(bbs.getBbsID()) %>명 지원했습니다.</td>
               </tr>
               <tr>
                  <td>Content</td>
                  <td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
               .replaceAll("\n", "<br/>")%>
                  </td>
               </tr>
            </tbody>
         </table>
         
         <a href="bbs_<%=CategoryDAO.getCategoryName(bbs.getCategoryID())%>.jsp" class="btn btn-primary">List</a>
         <%
            if (!userID.equals(bbs.getUserID())) {
         %>
               <!-- <input type="button" value="멘토신청" class="btn btn-primary" onclick="popup();"> -->
               <a href="apply.jsp?bbsID=<%=bbsID%>&menteeID=<%=bbs.getUserID()%>" class="btn btn-primary">Apply</a>   
               
         <% 
            }
         %>
         
         <%
            //글작성자 본인일시 수정 삭제 가능 
            if (userID != null && userID.equals(bbs.getUserID())) {
         %>
               <a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">Update</a>
               <a onclick="return confirm('정말로 삭제하시겠습니까?')"
               href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">Delete</a>
         <%
            }
         %>
         
      </div>
   </div>
</body>
</html>