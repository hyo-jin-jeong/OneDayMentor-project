<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
   <jsp:include page="bar.jsp"/>
   
   <!-- 로긴폼 -->
   <div class="container main">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <!-- 점보트론 -->
         <div class="jumbotron" style="padding-top: 20px;">
            <!-- 로그인 정보를 숨기면서 전송post -->
            <form method="post" action="joinAction.jsp">
               <h3 style="text-align: center;">Join</h3>
               <div class="form-group">
               <!-- 아이디는 영문 대,소문자 또는 숫자로 시작하고 끝나야함. -->
                  <input type="text" class="form-control" placeholder="ID"
                     name="userID" maxlength="20" autofocus>
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="PW"
                     name="userPassword" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Name"
                     name="userName" maxlength="20">
               </div>
               <div class="form-group" style="text-align: center;">
                  <div class="btn-group" data-toggle="buttons">
                     <label class="btn btn-primary active"> <input
                        type="radio" name="userGender" autocomplete="off" value="Male"
                        checked>Male
                     </label> <label class="btn btn-primary"> <input type="radio"
                        name="userGender" autocomplete="off" value="Female">Female
                     </label>
                  </div>
               </div>
               <div class="form-group">
                  <input type="email" class="form-control" placeholder="E-mail"
                     name="userEmail" maxlength="50">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="Metamask Account"
                     name="userMeta" maxlength="50">
               </div>

               <input type="submit" class="btn btn-primary form-control"
                  value="Join">
            </form>
         </div>
      </div>
   </div>

</body>
</html>