<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/dashboard.css">
<link href="css/starter-template.css" rel="stylesheet">
<script src="js/ie-emulation-modes-warning.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

<title>JSP 게시판 웹사이트</title>
<style>
   body { font-family: 'LotteMartDream'; font-style: normal;
   font-weight: 400;
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') 
   format('woff2'),
   url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff'); }
   @font-face { font-family: 'LotteMartDream'; 
   font-style: normal; 
   font-weight: 700;
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); } @font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'),
   url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); }
   .bold { font-weight : bold;   }
   select {
   width: 100px;
   padding: .4em .5em;
   border: 1px solid #999;
   font-family: inherit;
   background: url('img/arrow.jpg') no-repeat 100% 50%;
   background-color: white;
   border-radius: 0px;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   }

   select::-ms-expand {
   display: none;
   }
</style>

</head>
   <%
   request.setCharacterEncoding("utf-8");
   %>
<body>
   <%
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
   %>

   <!-- 네비게이션  -->
    <nav class="navbar navbar-inverse navbar-fixed-top"  style="background: white">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" style="font-size:25px;">One Day Mentor</a>
        </div>
        
        <div id="navbar" class="collapse navbar-collapse pull-right">
          <ul class="nav navbar-nav">
               <%
                  if (userID == null) {
               %>
             
               <%
                  } else {
               %>
               <li><a href="mobile_chat_list.jsp">Chat</a></li>
               <li><a href="mobile_logoutAction.jsp">Log Out</a></li>
               <%
                  }
               %>
          </ul>
        </div><!--/.nav-collapse -->        
      </div>
    </nav>
   <!-- /.carousel -->
   <!-- 애니매이션 담당 JQUERY -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 부트스트랩 JS  -->
   <script src="js/bootstrap.js"></script>
</body>
</html>