<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<meta name="viewport" content="width=devide-width" initial-scale="1">
<!-- 스타일 시트 참조 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
 <jsp:include page="bar.jsp"/>

 <!-- login form -->
   <div class="container main">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <!-- 점보트론 -->
         <div class="jumbotron" style="padding-top: 20px;">
            <!-- 로그인 정보를 숨기면서 전송 post -->
            <form method="post" action="loginAction.jsp">
               <h3 style="text-align: center">Login</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="ID"
                     name="userID" maxlength="20" autofocus>
               </div>
               
               <div class="form-group">
               <input type="password" class="form-control" placeholder="PW" name="userPassword" maxlength="20">
               </div>
               <input type="submit" style="margin-bottom : 15px" class="btn btn-primary form-control" value="Login">
            </form>
            
         </div>
      </div>
   </div>
   
</body>
</html>