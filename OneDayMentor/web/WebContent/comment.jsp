<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="apply.Apply"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript" type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript" type="test/javascript" src="./web3.min.js"></script>
<script language="javascript" type="text/javascript"
   src="js/payable_abi.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 웹사이트</title>

</head>
<body>
   <jsp:include page="bar.jsp" />
   <%
      ApplyDAO applyDAO = new ApplyDAO();
      UserDAO userDAO = new UserDAO();

      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }

      String ID = request.getParameter("bbsID");
      int bbsID = Integer.parseInt(ID);

      String menteeID = request.getParameter("menteeID");
      String mentorID = request.getParameter("mentorID");

      int applyID = applyDAO.getApplyID(menteeID, mentorID, bbsID);

      String mentorMeta = userDAO.getMentorMeta(applyID);
   %>
   <button class="btn btn-default" id="connect" onclick="back()">컨트랙트->멘토
      계정</button>

   <script>

   
   function back() {
      var test;
      var mentorAddress = '<%=mentorMeta%>'

         //var testAddress = '0xB94A5079904Ac5E32E3b0FD1A8d88078DDF0692A' // 스마트 컨트랙트 주소
         //var testAddress = '0x6d302D384404410B7845fc613224495556621F46'
         var testAddress = '0x561558484085b0d2432C15557cbF83C4B34c4556'
         window.ethereum.enable();

         test = web3js.eth.contract(testAbi.abi).at(testAddress);
         

         mentorAddress = mentorAddress.toString();

         test.back.sendTransaction(mentorAddress, web3js.toWei(0.0001), function(error,
               transactionHash) { // set() 호출
            if (!error){
               console.log(transactionHash);
               
            }
            else
               console.error(error);
         })

      }/* select 닫 */

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
   </script>

</body>
</html>