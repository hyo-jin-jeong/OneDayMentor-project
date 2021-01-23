<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="hash.Hash" %>
<%@ page import="hash.HashDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div id="t"></div>
<%
session.setMaxInactiveInterval(60*60);
String userAddress = request.getParameter("userAddress");
String transactionHash = request.getParameter("transactionHash");
String applyID = null;
if(request.getParameter("applyID") !=null){
	applyID = (String) request.getParameter("applyID");
	
}
HashDAO hashDAO = new HashDAO();
hashDAO.insert(userAddress, transactionHash);
%>
<script>
window.addEventListener('load', function() {
	window.location.replace("apply_notice.jsp?applyID=" + <%= applyID %>);
});
</script>


</body>
</html>