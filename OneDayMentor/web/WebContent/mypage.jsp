<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="category.CategoryDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/mypost.css">
<style type="text/css">
a {
   text-decoration: none !important;
}

th, td {
   width: 100%;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

table {
   table-layout: fixed;
}

#pencilimg:hover{
 -webkit-transform:rotate(30deg);
}

#applyimg:hover{
 -webkit-transform:rotate(30deg);
}
</style>
<script type="text/javascript">
   function popup(e) {
	   document.getElementById("apply").value = e.currentTarget.value;
	   var url = "apply_list_action.jsp";
	   var name = "apply_list";
	   var option = "width=400, height=480, left=100, location=no";
	   window.open(url, name, option);
   }
</script>
<title>JSP 게시판 웹사이트</title>
</head>
<body >
   <jsp:include page="bar.jsp" />

   <%
      request.setCharacterEncoding("utf-8");
      int n = 1;
      if (request.getParameter("n") != null) {
         n = Integer.parseInt(request.getParameter("n"));
      }
   %>

   <script>
      $('ul.tabs li').ready(function() {

         var tab_id = "tab-" +
   <%=n%>
      ;

         $('ul.tabs li').removeClass('current');
         $('.tab-content').removeClass('current');

         $("#" +
   <%=n%>
      ).addClass('current');
         $("#" + tab_id).addClass('current');
      })
   </script>

   <%
      //로긴한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      int pageNumber = 0; //기본 페이지 넘버
      //페이지넘버값이 있을때
      if (request.getParameter("pageNumber") != null) {
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
      int pageNumber2 = 0;
      if (request.getParameter("pageNumber2") != null) {
         pageNumber2 = Integer.parseInt(request.getParameter("pageNumber2"));
      }

      CategoryDAO category = new CategoryDAO();
   %>
   
	<div style="height: 300px; margin-bottom: 50px;">
		<img src="img/purple.jpg" style="width: 100%; height: 100%;">
	</div>
	<div style="font-size:60px; color:white;  margin-left : 20px;
	position: absolute; top: 180px; left : 500px; z-index : 1;">
		<b>my page</b>
	</div>
	
	
   <div class="container" style="position: relative; top: 40px;">
      <ul class="tabs" style="text-align:center;">
         <li class="tab-link current" data-tab="tab-1" id="1" style="font-size: 20px;"><b>write </b><img id="pencilimg" src="img/pencil.png" style="width:50px;height:50px;"></li>
         
         <li class="tab-link" data-tab="tab-2" id="2" style="font-size: 20px;"><b>Apply </b><img id="applyimg" src="img/apply.png" style="width:50px;height:50px;"></li>
      </ul>
      <div id="tab-1" class="tab-content current">
         <div style="padding: 20px;">
            <div class="row">
               <form name="form" method="post">
               
               
                  <table class="table table-striped"
                     style="text-align: center; vertical-align: middle;">
                     <thead style="background-color: #3d3d3d;">
                        <tr style="height: 55px;">
                           <!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Title</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Writer</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Date</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;">Category</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74; color: white; text-align: center;"></th>
                        </tr>
                     </thead>
                     <tbody>
                        <%
                           ApplyDAO applyDAO = new ApplyDAO();
                           BbsDAO bbsDAO = new BbsDAO();
                           ArrayList<Bbs> list = bbsDAO.getList2(userID, pageNumber * 10, 10); // 전체 글 목록

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
                           <!-- 한국어로 게시판 이름 남기기 -->
                           <td><%=category.getCategoryKorean(list.get(i).getCategoryID())%></td>
                           <td>
                           <%
                           if(applyDAO.getApplyAvailable(list.get(i).getBbsID()) == 0) {
                           %><button id="apply" name="applys" type="button"
                                 value="<%=list.get(i).getBbsID()%>" class="btn btn-primary"
                                 onClick="popup(event)" style="height: 30px;">Applicant List</button>

                              <input type="hidden" id="<%=list.get(i).getBbsID()%>"
                              value="<%=applyDAO.isAvailable(list.get(i).getBbsID())%>">
							
							<%
                           }
							%>
                           </td>
                        </tr>
                        <%
                           }
                        %>
                        <tr style="background-color: #4d4d74;; height: 0.5px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                        
                     </tbody>
                  </table>
               </form>


               <!-- 페이지 넘기기 -->
               <div style="text-align: center;">
                  <%
                     if (pageNumber != 0) {
                  %>
                  <a href="mypage.jsp?pageNumber=<%=pageNumber - 1%>&n=1"
                     style="display: inline-block; font-size: 25px; color: #4d4d74;"><b>&laquo;</b></a>
                  <%
                     }
                  %>
                  <div style="display: inline-block; font-size: 20px; margin: 10px;"><%=pageNumber + 1%></div>
                  <%
                     if (bbsDAO.nextPage2(pageNumber, userID)) {
                  %>
                  <a href="mypage.jsp?pageNumber=<%=pageNumber + 1%>&n=1"
                     style="display: inline-block; font-size: 25px; color: #4d4d74;"><b>&raquo;</b></a>
                  <%
                     }
                  %>
               </div>



            </div>
         </div>
      </div>


      <div id="tab-2" class="tab-content">
         <div style="padding: 20px;">
            <div class="row">
               <form name="form" method="post">
                  <table class="table table-striped"
                     style="text-align: center; vertical-align: middle;">
                     <thead style="background-color: #3d3d3d;">
                        <tr style="height: 55px;">
                           <!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74;; color: white; text-align: center;">Title</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74;; color: white; text-align: center;">Writer</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74;; color: white; text-align: center;">Date</th>
                           <th
								style="font-size: 15px; vertical-align: middle; background-color: #4d4d74;; color: white; text-align: center;">Category</th>
                        </tr>
                     </thead>
                     <tbody>
                        <%
                           BbsDAO bbsDAO_2 = new BbsDAO();
                           ArrayList<Bbs> list_2 = bbsDAO_2.getList4(userID, pageNumber2 * 10, 10); // 전체 글 목록

                           for (int i = 0; i < list_2.size(); i++) {
                        %>
                        <tr>
                           <%
                              if (session.getAttribute("userID") != null) { //회원일때만 글제목 누르면 넘어감
                           %>
                           <td><a href="view.jsp?bbsID=<%=list_2.get(i).getBbsID()%>">
                                 <%=list_2.get(i).getBbsTitle()%></a></td>
                           <%
                              } else { //비회원일때 글제목 못누름
                           %>
                           <td><%=list_2.get(i).getBbsTitle()%></td>

                           <%
                              }
                           %>
                           <td><%=list_2.get(i).getUserID()%></td>
                           <td><%=list_2.get(i).getBbsDate().substring(0, 11) + list_2.get(i).getBbsDate().substring(11, 13)
                  + "시" + list_2.get(i).getBbsDate().substring(14, 16) + "분"%></td>
                           <td><%=category.getCategoryKorean(list_2.get(i).getCategoryID())%></td>
                        </tr>
                        <%
                           }
                        %>
                         <tr style="background-color: #4d4d74;; height: 0.5px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                     </tbody>
                  </table>
               </form>
               <!-- 페이지 넘기기 -->
               <div style="text-align: center;">
                  <%
                     if (pageNumber2 != 0) {
                  %>
                  <a href="mypage.jsp?pageNumber2=<%=pageNumber2 - 1%>&n=2"
                     style="display: inline-block; font-size: 25px; color: #f49987;"><b>&laquo;</b></a>
                  <%
                     }
                  %>
                  <div style="display: inline-block; font-size: 20px; margin: 10px;"><%=pageNumber2 + 1%></div>
                  <%
                     if (bbsDAO.nextPage4(pageNumber2, userID)) {
                  %>
                  <a href="mypage.jsp?pageNumber2=<%=pageNumber2 + 1%>&n=2"
                     style="display: inline-block; font-size: 25px; color: #f49987;"><b>&raquo;</b></a>
                  <%
                     }
                  %>
               </div>
            </div>
         </div>
      </div>
      </div>


      <script>
         $(document).ready(function() {
            $('ul.tabs li').click(function() {

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