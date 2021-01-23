<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="hash.Hash"%>
<%@ page import="hash.HashDAO"%>
<%@ page import="java.util.ArrayList"%>
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
    @FONT-FACE {
      font-family: "arlrdbd";
      src: url("fonts/arlrdbd.ttf");
   }
   
   .bar { transition : transfor .3s; }
   .bar.hide { transform: translateY(-100%); }
</style>
<script type="text/javascript">
function dashboard(e){
   document.getElementById("dashboard").value = e.currentTarget.value;
   var url = "dashboard.jsp";
   var name = "dashboard";
   var option = "width=1200, height=550, top=30, left=30, location=no";
    window.open(url, name, option);
    }
    
    var last_top = 0;
    $(window).scroll(function() {
       var this_top = $(this).scrollTop();
       if (this_top > last_top) {
           $(".bar").addClass("hide");
        } else {
           $(".bar").removeClass("hide");
        }
        last_top = this_top;
    });
</script>
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
    <nav class="navbar navbar-inverse navbar-fixed-top bar" style="background: white">
      <div class="container-fluid " >
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp" style="font-size:35px; font-family: arlrdbd; font-weight: bold;">One Day Mentor</a>
        </div>
        
        <div id="navbar" class="collapse navbar-collapse pull-right" style="font-size: 18px;">
          <ul class="nav navbar-nav">
          
          
               <li><a href="bbs_blockchain.jsp">Board</a></li>
               <li><a href="searchAction.jsp">Search</a></li>
               <%
                  if (userID == null) {
               %>
               
               <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Connect<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="login.jsp">Login</a></li>
                     <li><a href="join.jsp">Join Us</a></li>
                  </ul>
                </li>
               <%
                  } else {
               %>
               <li class="dropdown">
                   <a href="#" class="dropdown-toggle"
                  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manage<span class="caret"></span></a>
                  <ul class="dropdown-menu pull-right" style="text-align:center; ">
                     <li><img src="img/QR.jpg" style="width:100px; height:100px;" ></li>
                     <li class="bold"><div style="border-radius: 20px; margin-left: 15px; margin-right: 15px; font-size: 17px;">ID:&nbsp;&nbsp;&nbsp;<%= (String)session.getAttribute("userID")%></div></li>
                     <li><a href="mypage.jsp">My Page</a></li>
                     <li><a href="chat_list.jsp">Chat</a></li>
                     <button style="padding: 0; border: none; background: none;" type="button" value="<%=userID %>" onclick="dashboard(event)" id="dashboard">
                     Dashboard</button>
                     <li><a href="logoutAction.jsp">Logout</a></li>
                     <li><a onclick="return confirm('정말 탈퇴하시겠습니까?')" href="leaveAction.jsp">Leave</a></li>
                  </ul>
                </li>
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