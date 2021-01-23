<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="category.CategoryDAO"%>
<%@ page import="chat.ChatDAO"%>
<!DOCTYPE html>
<html>
<head>
<script lang="javascript" type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script lang="javascript" type="test/javascript" src="./web3.min.js"></script>
<script lang="javascript" type="text/javascript"
   src="js/payable_abi.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/mypost.css">
<style>
body {
   background: linear-gradient(to right, #d7dbdd, #e5e7e7, #eff3f4);
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
</style>
</head>
<body style="margin-top: 0px;">
   <div style="display: block; text-align: center;">
      <img src="img/metamaskpng.png" width="300px" height="300px"
         style="maring: 0; padding: 0;"><br>
      <br>
      <div style="font-size: 20px;">
         <b>메타마스크 계좌로 이더를 수령하시겠습니까?</b>
      </div>
      <div>
         (이더 수령은 가스량에 따라 <b>몇 분 가량</b> 소요될 수 있습니다.)
      </div>
      <br>
      <div style="display: inline-block;">
         <button class="btn btn-default" onClick="back()">예</button>
         <button class="btn btn-default" onClick="exit()">아니오</button>
      </div>
   </div>
   <script>
      function back() {
         var value = window.opener.document.getElementById("getMoney").value;
         window.location.replace("money_receive.jsp?applyID=" + value);
      }

      function exit() {
         window.close();
      }
   </script>
</body>
</html>