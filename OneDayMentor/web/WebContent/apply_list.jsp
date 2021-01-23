<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹사이트</title>

<style>

body { font-family: 'LotteMartDream'; font-style: normal;
   font-weight: 400;
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'),
   url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); }
   @font-face { font-family: 'LotteMartDream'; font-style: normal;
   font-weight: 700;
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2')
   format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); } @font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); }


</style>
</head>
<body>
   <%
      int pageNumber; //기본 페이지 넘버
   %>
   <%
      String value = request.getParameter("value");
      int bbsID = Integer.parseInt(value);
      String n = request.getParameter("pageNumber");
      if (n == null) {
         pageNumber = 0;
      } else {
         pageNumber = Integer.parseInt(n);
      }
   %>
<script>
   function show(e) {
       var id = e.currentTarget.value;
        window.location.replace("apply_content.jsp?applyID="+ id);
   }
</script>
   <%
      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
%>
  
   <!-- 게시판 -->
   <div class="container" style="margin: 5px">
      <div class="row">
            <table class="table table-striped"
					style="margin-left: 10%; width: 80%; border-top: 1px solid #dddddd; padding: 20px; border-bottom: 1px solid #dddddd; table-layout: fixed;">               
				<thead>
                  <tr>
                     <th colspan="2"
                         style="background-color:#4d4d74; color : white; text-align: center;">List of Mentor Applicants</th>
                  </tr>
               </thead>
               <tbody>
                  <%
                     ApplyDAO applyDAO = new ApplyDAO();
                     ArrayList<Apply> list = applyDAO.getList(bbsID, pageNumber * 10, 10);
                     for (int i = 0; i < list.size(); i++) {
                  %>
               
                  <tr>
                     <td style="padding-left:15px;"><%=list.get(i).getWritingTitle()%></td>
                     <td style="text-align: right;">
                     <button onClick="show(event)" value="<%=list.get(i).getApplyID()%>">View Content</button></td>
                     <%
                        }
                     %>
                  </tr>
               </tbody>
            </table>


            <!-- 페이지 넘기기 -->
            <div style="text-align: center;">
               <%
                  if (pageNumber != 0) {
               %>
               <a
                  href="apply_list_change.jsp?pageNumber=<%=pageNumber - 1%>&bbsID=<%=bbsID%>"
                  class="btn btn-arrow-left">&#171;</a>

               <%
                  }
               %>
               <div class="btn btn-arrow-left" style="text-align: center;"><%=pageNumber + 1%></div>
               <%
                  if (applyDAO.nextPage(pageNumber, bbsID)) {
               %>

               <a
                  href="apply_list_change.jsp?pageNumber=<%=pageNumber + 1%>&bbsID=<%=bbsID%>"
                  class="btn btn-arrow-left">&#187;</a>
               <%
                  }
               %>
            </div>

      </div>
   </div>

</body>
</html>