<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="category.CategoryDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
<style>
th, td {
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

table {
	table-layout: fixed;
	text-align: center;
}
</style>
</head>
<body>
   <%
      request.setCharacterEncoding("utf-8");
         
         String searchType = "";
         String search="";
         
         
       int pageNumber = 0; //기본 페이지 넘버
     //페이지넘버값이 있을때
     if (request.getParameter("pageNumber") != null) {
           pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
     }

         
   %>
   <jsp:include page="bar.jsp" />
   
   <div class="main">
   <div class="container">
      <div class="row">
      <div style="text-align:center;">
            <form method="post" class="form-inline">
                  <select name="searchType">
                     <option value="1" selected="selected">Title</option>
                     <option value="2">Content</option>
                  </select>
                  <input id="search" type="text" name="search" class="form-control" placeholder="Search..." style="margin: 10px; width: 200px"
                  autofocus>
                  <input type="submit" style="margin: 10px;" value="SEARCH" class="btn btn-primary">
             </form>
             <%
             if(request.getParameter("searchType") != null && request.getParameter("search") != null){ //form 넘어왔을때
               search = request.getParameter("search");
                
                if(search== ""){
                  PrintWriter script = response.getWriter();
                  script.println("<script>");
                  script.println("alert('내용을 입력하세요')");
                  script.println("history.back()");
                  script.println("</script>");
                }
                if(request.getParameter("searchType").equals("1")){
                   searchType="Title";
                }
                else if(request.getParameter("searchType").equals("2")){
                   searchType="Content";
                }%>
                <span style="font-weight:bold;"><%=searchType %> <%=search %>의 검색결과</span>  
      </div>
      
         <table class="table table-striped" 
         style="margin-left: 10%; width: 80%; border-top: 1px solid #dddddd; padding: 20px; border-bottom: 1px solid #dddddd; table-layout: fixed;">
            <thead style="background-color: #3d3d3d;">
				<tr style="height: 55px;">
                  <!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
                  <th
					style="font-size: 15px; vertical-align: middle; background-color: #3b3b5a; color: white; text-align: center;">Title</th>
                  <th
					style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Writer</th>
                  <th
					style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Date</th>
                  <th
					style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Category</th>
               </tr>
            </thead>
            <tbody>
               <%
                  BbsDAO bbsDAO = new BbsDAO();
                  CategoryDAO categoryDAO = new CategoryDAO();

                  ArrayList<Bbs> list;

              
                  
                  if(searchType == "제목") {
                     list = bbsDAO.getList3(searchType, search, pageNumber*10, 10);
                  }
                  
                  else{
                     list = bbsDAO.getList3(searchType, search, pageNumber*10, 10);
                  }
                     for (int i = 0; i < list.size(); i++) {
               %>
               <tr>

                  <%
                     if (session.getAttribute("userID") != null) { //회원일때만 글제목 누르면 넘어감
                  %>
                        <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
                        <%=list.get(i).getBbsTitle()%></a></td>
                  <%
                     }else{ //비회원일때 글제목 못누름
                  %>
                     <td><%=list.get(i).getBbsTitle()%></td>
                     
                  <%
                     }
                  %>
                  <td><%=list.get(i).getUserID()%></td>
                  <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
                  + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
                  <td><%=categoryDAO.getCategoryKorean(list.get(i).getCategoryID())%></td>
               </tr>
               <%
                  }
               %>  
               <tr style="background-color: #4d4d74; height: 0.5px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
				</tr>
            </tbody>
         </table>


        <!-- 페이지 넘기기 -->
         <%
           int type; 
               
            if (pageNumber != 0) {
         %>
            <a href="searchAction.jsp?pageNumber=<%=pageNumber - 1%>&search=<%= search %>&searchType=<%=searchType %>"
                  class="btn btn-success btn-arrow-left">이전</a>
         <%
            }
            
         if(searchType == "제목"){
            type = 1;
         }
         else{
            type = 2;
         }
         
          if (bbsDAO.nextPage3(type, pageNumber, search)) {
         %>
               <a href="searchAction.jsp?pageNumber=<%=pageNumber + 1%>&search=<%= search %>&searchType=<%=searchType %>"
                  class="btn btn-success btn-arrow-left">다음</a>
         <%
          }
         %> 
      </div>
   </div>
</div>
      <%
             }
        %>
   
</body>
</html>