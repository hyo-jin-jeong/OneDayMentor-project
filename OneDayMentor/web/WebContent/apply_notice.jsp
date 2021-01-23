<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="chat.ChatDAO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹사이트</title>
<style>
        @keyframes coinMove {
            from {
                transform: translateX(64px);
            }
            to {
                transform: translateX(240px);
            }
        }
        
        #coin {
            animation-name: coinMove;
            animation-duration: 2s;
            animation-iteration-count: infinite;
        }
        span {
        	font-size:18px;
        	font-weight:bold;
        	text-align:center;
        	vertical-align:middle;
        }
        img {
        	vertical-align: middle;
        }
    </style>
<script>
   <%
         String id = request.getParameter("applyID");
         int applyID = Integer.parseInt(id);
         ApplyDAO applyDAO = new ApplyDAO();
         
         applyDAO.contact(applyID);
         ChatDAO chatDAO = new ChatDAO();
         chatDAO.insert(applyID); //chat table에 매칭 시간과 applyID 넣어주기  
   %>
   	
   function closing(time) {
         setTimeout('window.close()', time);
         window.opener.top.location.href="chat_list.jsp";
      }
</script>
</head>
<body onload="closing('3000')">
<div style="line-height:50px; margin-top : 170px;">
	<img src="img/coin.png" alt="coin" width="50px" height="50px" id="coin">
   <br>
   <div style="text-align:center;">
    <img src="img/question.png" alt="mentee" width="64px" height="64px" style="margin-right:100px;">
    <img src="img/savings.png" alt="savings" width="64px" height="64px" style="margin-right:100px;">
    <img src="img/thinking.png" alt="thinking" width="64px" height="64px">
    <br><br><span>ETH가 송금 중입니다...</span>
    </div>
    </div>
	
</body>
</html>