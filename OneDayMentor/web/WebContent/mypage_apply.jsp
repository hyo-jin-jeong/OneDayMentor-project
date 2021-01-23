<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/mypost.css">
<style type="text/css">
a, a:hover {
   color: #000000;
   text-decoration: none;
}
</style>


<script type="text/javascript" src="jquery-3.1.1.min.js"></script>

<title>jsp 게시판 웹사이트</title>

</head>

<body>
   <jsp:include page="bar.jsp" />

   <%
      //로긴한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      
      int pageNumber2 = 0; //기본 페이지 넘버
      //페이지넘버값이 있을때
      if (request.getParameter("pageNumbe2") != null) {
         pageNumber2 = Integer.parseInt(request.getParameter("pageNumber2"));
      }
      
   %>
   <div class="container" style="position: relative; top: 40px;">
      <ul class="tabs">
         <li class="tab-link" data-tab="tab-1"><a href="mypage_write.jsp">작성글</a></li>
         <li class="tab-link current" data-tab="tab-2"><a href="mypage_apply.jsp">지원글</a></li>
      </ul>
      
   <!-- 작성글 -->
      <div id="tab-1" class="tab-content current">
         
      </div>
      
      <div id="tab-2" class="tab-content">
	      <div style="padding: 20px;">
	            <div class="row">
	            <form name="form" method="post">
	               <table class="table table-striped"
	                  style="text-align: center; border: 1px solid #dddddd">
	                  <thead>
	                     <tr>
	                        <!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
	                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
	                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
	                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
	                        <th style="background-color: #eeeeee; text-align: center;"></th>
	                     </tr>
	                  </thead>
	                  <tbody>
	                     <%
	                        BbsDAO bbsDAO = new BbsDAO();
	                        ArrayList<Bbs> list = bbsDAO.getList2(userID, pageNumber2 * 10, 10); // 전체 글 목록
	
	                        for (int i = 0; i < list.size(); i++) {
	                     %>
	                     <tr>
	                        <%
	                           if (session.getAttribute("userID") != null) { //회원일때만 글제목 누르면 넘어감
	                        %>
	                        <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
	                              <%=list.get(i).getBbsTitle()%></a></td>
	                        <%
	                           } else { //비회원일때 글제목 못누름
	                        %>
	                        <td><%=list.get(i).getBbsTitle()%></td>
	
	                        <%
	                           }
	                        %>
	                        <td><%=list.get(i).getUserID()%></td>
	                        <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
	                  + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
	                    
	                                 
	                      </tr>
	                                 
	                     <%
	                        }
	                     %>
	                  </tbody>
	               </table>
	               </form>
	
	
	               <!-- 페이지 넘기기 -->
	
	               <%
	                  if (pageNumber2 != 0) {
	               %>
	               <a href="mypage_apply.jsp?pageNumber=<%=pageNumber2 - 1%>"
	                  class="btn btn-success btn-arrow-left">이전</a>
	               <%
	                  }
	                  if (bbsDAO.nextPage2(pageNumber2, userID)) {
	               %>
	               <a href="mypag_apply.jsp?pageNumber=<%=pageNumber2 + 1%>"
	                  class="btn btn-success btn-arrow-left">다음</a>
	               <%
	                  }
	               %>
	            </div>
	         </div>
	      </div>
   </div>


   <script>
      $(document).ready(function() {
         $('ul.tabs li a').click(function() {
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');

            $(this).addClass('current');
            $("#" + tab_id).addClass('current');
         })

      })
   </script>
</body>
</html>