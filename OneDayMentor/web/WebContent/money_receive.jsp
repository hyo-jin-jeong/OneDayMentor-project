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
<title>One Day Mentor</title>
<style>
        @keyframes coinMove {
            from {
                transform: translateX(175px);
            }
            to {
                transform: translateX(345px);
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
    <script lang="javascript" type="text/javascript"
   src="js/payable_abi.js"></script>
<script>
   function closing(time) {
         setTimeout('window.close()', time);
         window.opener.top.location.href="chat_list.jsp";
   }
   window.addEventListener('load', function() {
      // Web3가 브라우저에 주입되었는지 확인(MetaMask)
      if (typeof web3 !== 'undefined') {
         // MetaMask의 프로바이더 사용               
         web3js = new Web3(web3.currentProvider);
         console.log("metamask 설치 O");
      } else {
         // 사용자가 Metamask를 설치하지 않은 경우에 대해 처리
         // 사용자들에게 Metamask를 설치하라는 등의 메세지를 보여줄 것
         console.log("metamask 설치 X");
      }
      // 접근 권한 승인
      // 앱 시작
   });
   function back() {
      <%ApplyDAO applyDAO = new ApplyDAO();
      int applyID = Integer.parseInt(request.getParameter("applyID"));
      ChatDAO chatDAO = new ChatDAO();%>
      
      var test;
      var mentorAddress = '<%=applyDAO.getMentorAddress(applyID)%>'
      var testAddress = '0x561558484085b0d2432C15557cbF83C4B34c4556'
      window.ethereum.enable();
     console.log("dd");
      test = web3js.eth.contract(testAbi.abi).at(testAddress);

      mentorAddress = mentorAddress.toString();
      
      test.back.sendTransaction(mentorAddress, web3js.toWei(0.0001),
            function(error, transactionHash) { // set() 호출
               if (!error) {
                  console.log(transactionHash);
                  if (transactionHash != null) {
                      <%
                         chatDAO.stopEthReceipt(applyID);
                      %>
                     closing('5000');
                  }
               } else
                  console.error(error);
            })

   }

   function exit() {
      window.close();
   }

</script>
</head>
<body onload="back()">
<div style="line-height:50px;  margin-top : 170px;">
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
