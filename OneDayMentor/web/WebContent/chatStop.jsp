<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chat.ChatDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   int applyID = Integer.parseInt(request.getParameter("applyID"));
   ChatDAO chatDAO = new ChatDAO();
   chatDAO.stopChat(applyID);
%>

<script>
   window.close();
   window.opener.top.location.href="chat_list.jsp";
</script>
</body>
</html>