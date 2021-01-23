<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/carousel.css" rel="stylesheet">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
   <jsp:include page="bar.jsp"/>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
	%>
   
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner" role="listbox">
      
      <div class="item active">
          <div class="container">
          <img src="img/welcome.png">
            <div class="carousel-caption" style="margin-left : 400px;">
              <h1>홈페이지 가이드</h1>
              <p>사용 전에 읽어보기</p>
              <p><a class="btn btn-lg btn-primary" href="learn.jsp" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
      
     
        <div class="item">
          <div class="container">
          	<img src="img/mentor.png">
            <div class="carousel-caption" style="margin-left : 400px;">
              <h1>멘토-멘티 매칭</h1>
              <p>사용법 익혔다면 회원가입하러 가기</p>
              <p><a class="btn btn-lg btn-primary" href="join.jsp" role="button">Join with us</a></p>
            </div>
          </div>
        </div>
      
      
       <div class="item">
          <div class="container">
          	<img src="img/mentor.png">
            <div class="carousel-caption" style="margin-left : 400px;">
              <h1>멘토-멘티 매칭</h1>
              <p>멘토 또는 멘티 구하러 가기</p>
              <p><a class="btn btn-lg btn-primary" href="bbs_clang.jsp" role="button">Let's looking for</a></p>
            </div>
          </div>
        </div>
      </div>
  
      </div>
      
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
 
</body>
</html>