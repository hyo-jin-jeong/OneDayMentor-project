<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="hash.Hash"%>
<%@ page import="hash.HashDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<script lang="javascript" type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script lang="javascript" type="test/javascript" src="./web3.min.js"></script>
<script lang="javascript" type="text/javascript" src="js/payable_abi.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<style>
body {
   background: white;
   font-family: 'LotteMartDream';
   font-style: normal;
   font-weight: 400;
   src:
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
      format('woff2'),
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
      format('woff');
}

@font-face {
   font-family: 'LotteMartDream';
   font-style: normal;
   font-weight: 700;
   src:
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2')
      format('woff2'),
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff')
      format('woff');
}

@font-face {
   font-family: 'LotteMartDream';
   font-style: normal;
   font-weight: 300;
   src:
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2')
      format('woff2'),
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff')
      format('woff');
}

.balloon {
   display: inline-block;
   position: relative;
   background: linear-gradient(to right, #d7dbdd, #e5e7e7);
   height: 70px;
   width: 120px;
   margin: 0 auto 10px;
   border-radius: 10px;
}

.balloon:after {
   content: '';
   position: absolute;
   height: 50px;
   width: 50px;
   border-radius: 25px;
   z-index: -1;
   background: white; /* 말풍선 꼬리 */
   bottom: -20px;
   left: 50px;
}

.balloon:before {
   content: '';
   position: absolute;
   height: 50px;
   width: 50px;
   border-radius: 25px;
   z-index: -1;
   background: linear-gradient(to right, #d7dbdd, #e5e7e7);
   bottom: -15px;
   left: 35px;
}
</style>

<title>JSP 게시판 웹사이트</title>
</head>
<body style="overflow: hidden;">
   <%
      String id = request.getParameter("applyID");
      int applyID = Integer.parseInt(id);
      ApplyDAO applyDAO = new ApplyDAO();
      Apply apply = applyDAO.content(applyID);

      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }

      UserDAO user = new UserDAO();
      String userMeta = user.getMeta(userID); //멘티 메타마스크
      String mentorMeta = user.getMentorMeta(applyID);
      
   
   %>


   <script type="text/javascript">
   function select() {
      var test;
      var m=0;
      var testAddress = '0x561558484085b0d2432C15557cbF83C4B34c4556'
      test = web3js.eth.contract(testAbi.abi).at(testAddress); // 컨트랙트 객체 생성
      var userAddress = '<%=userMeta%>';
      
      window.ethereum.enable();
      web3js.eth.getAccounts(function(err, result) { /* result = 메타마스크 로그인된계정 */
         if (err != null)
               console.log("크롬, 메타마스크 이용");
            if (result.length == 0)
               console.log("메타마스크 로그인 필요");
            else {
               userAddress = userAddress.toString();
               if(userAddress.toLowerCase() == result.toString()){
                    test.send.sendTransaction(web3js.toWei(0.0001),
                           {
                             from : userAddress,
                             to : testAddress,
                             value : web3js.toWei(0.0001)
                          }, function(error, transactionHash) { // set() 호출
                             if (!error){
                                if(transactionHash != null){
                                   
                                   window.location.replace("insert_hash.jsp?userAddress=" + userAddress + "&transactionHash="+ transactionHash + "&applyID="+<%= applyID %>);
                                   <%-- window.location.replace("apply_notice.jsp?applyID=<%=applyID%>"); --%>
                        }
                     } else
                        console.error(error);
                     })
                     } else {
                        alert("가입한 회원 정보 메타마스크 계정으로 로그인하시오.")
                     }
                  }
               });/* getAccounts 닫 */
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
   <div class="container marketing">
      <div class="row"
         style="margin-top: 30px; padding: 20px; width: 300px; height: 500px;">
         <div class="col-lg-4">
            <div class="balloon"
               style="width: 330px; height: 190px; text-align: center; padding: 20px;">
               <h3>
                  <span style="border-bottom: 1px solid black; font-weight: bold"><%=apply.getWritingTitle()%></span>
               </h3>
               <p style="margin-top: 20px;">
                  <%=apply.getWritingContent()%>
               </p>
            </div>
            <div style="text-align: center; margin-top: 20px;">
               <img class="img-circle" src="img/person.png"
                  alt="Generic placeholder image"
                  style="width: 140px; height: 140px; margin-left : 90px;">
            </div>
            <p
               style="position: fixed; top: 5px; left: 6px; display: inline-block;">
               <a class="btn" href="apply_list_action.jsp"
                  style="color: black; font-size: 20px;" role="button">&laquo;back</a>
            </p>
         </div>
         <p style="text-align: center; vertical-align: center;">
            <button class="btn btn-default" onclick="select()"
               style="margin-top: 23px;margin-left : 90px;">Select Mentor</button>
         </p>
      </div>
   </div>
</body>
</html>