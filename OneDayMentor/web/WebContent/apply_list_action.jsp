<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="apply.Apply" %>
<%@ page import="apply.ApplyDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
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
</style>
<script>
   function init(){
      var value = window.opener.document.getElementById("apply").value;
      window.location.replace("apply_list.jsp?value="+value);
   }
</script>
<title>JSP 게시판 웹사이트</title>
<body>
   <script type="text/javascript">
      init();
   </script>
   
</body>