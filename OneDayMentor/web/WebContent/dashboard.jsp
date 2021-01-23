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
<meta name="viewport" content="width=device-width initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="aos-master/dist/aos.css">
<script type="text/javascript" src="aos-master/dist/aos.js"></script>
<title>JSP 게시판 웹사이트</title>
<style>
body {
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

.bold {
   font-weight: bold;
}

th, td {
   width: 100%;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

table {
   table-layout: fixed;
   text-align: center;
}
</style>
</head>
<body>
<script>
    AOS.init();
  </script>
   <%
      session.setMaxInactiveInterval(60 * 60);
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      UserDAO userDAO = new UserDAO();
      String userMeta = userDAO.getMeta(userID);

      HashDAO hashDAO = new HashDAO();
      ArrayList<Hash> list = new ArrayList<Hash>(); // DB에서 불러온 리스트
      ArrayList<Hash> list2 = new ArrayList<Hash>(); // 사용할 리스트
      list = hashDAO.getHash(userMeta);
      if (list != null) {
         for (int i = 0; i < list.size(); i++) {
            list2.add(i, list.get(i));
         }
      }
   %>
   <script>
   var hashes = new Array();   // Transaction hash 배열
   var dates = new Array();   // Transaction date 배열
   
   function loading() {
      console.log("<%=userMeta%>");
      var test;
         web3js.eth.getBalance('<%=userMeta%>',
               function(error, result) {
                  if (!error) {
                     var balance = result;
                     console.log(balance.toNumber());
                     document.getElementById("balance").innerHTML += balance.toNumber()/1000000000000000000 + "ETH<br>";
                  } else {

                  }
               });

         web3js.eth.getTransactionCount('<%=userMeta%>', function(error,result) {
            if (!error) {
               var count = result;
               console.log(count);
               document.getElementById("count").innerHTML += count
                     + "<br>";
            }
         });
         
         var size = parseInt(<%=list2.size()%>);
         var meta;
         <%for (int i = 0; i < list2.size(); i++) {%>
         hash = '<%=list2.get(i).getHash()%>'
         <%-- date = '<%=list2.get(i).getDate().substring(0, 11) + list2.get(i).getDate().substring(11, 13) + "시"
            + list2.get(i).getDate().substring(14, 16) + "분"%>' --%>
      date = '<%=list2.get(i).getDate().substring(0, 11)%>'
         console.log(date);
         hashes.push(hash);
         dates.push(date);
         <%}%>
         
         for(var i = 0; i < hashes.length; i++) {
            web3js.eth.getTransaction(hashes[i], function(error, result) {
                 if (!error) {
                   var values = new Array();
                   values[0] = "0";   // No.
                   values[1] =   result.hash;// Transaction Hash
                   values[2] =   result.blockNumber;// Block Number
                   values[3] = "0";   // Date
                   values[4] =   result.from;// From
                   values[5] =   result.to;// To
                   values[6] =   result.value / 1000000000000000000 + " ETH";// Value
                   values[7] =   result.gas / 1000000000 + " ETH";// Gas
                   var tbody = document.getElementById("tbody");
                    var tr = document.createElement("tr");
                   
                    for(var j = 0; j < values.length; j++) {
                       var td = document.createElement("td");
                       if(j == 0){
                          td.setAttribute("name", "no");
                          console.log(td.getAttribute("name"));
                       }
                       if(j == 3){
                          td.setAttribute("name", "date");
                          console.log(td.getAttribute("name"));
                       }
                       td.innerHTML += values[j];
                       td.title = values[j];
                       tr.appendChild(td);
                    }
                    tbody.appendChild(tr);
                    changing();
                 } else {
                 }
              }); 
         }
      }
   function changing() {
      var tds1 = document.getElementsByName("no");
      var tds2 = document.getElementsByName("date");
        for (var i = 0; i < hashes.length; i++) {
               tds1[i].innerHTML = i + 1;
               tds1[i].title = i + 1;
              tds2[i].innerHTML = dates[i];
             tds2[i].title = dates[i];
            }
        }
   </script>
   <script>
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
         loading();
      });
   </script>
   <div class="container" data-aos="fade-zoom-in" data-aos-offset="200" data-aos-easing="ease-in-sine" data-aos-duration="1000" style="position: relative;">
      <div style="background-image: url('img/purple.jpg'); padding: 10px; font-size: 300%; font-weight: 650; text-align: center; margin-bottom: 30px;"><b style="color: white;">Transaction List</b></div>
      <div style="background-color: white; border: 2px solid #4d4d74; border-radius: 10px; padding: 15px; text-align: center;">
      <div id="balance" style="font-size: 170%; font-weight: 500;"><b style="font-size: 30px; color: #4d4d74; font-weight: bold;">My balance</b> : </div>
      <div id="count" style="font-size: 170%; font-weight: 500;"><b style="font-size: 30px; color: #4d4d74; font-weight: bold;">Total Transaction</b> : </div>
      </div>
      <br>
      <table class="table table-striped"
         style="table-layout: fixed;">
         <thead style="background-color: #3d3d3d;">
            <tr style="height: 40px; font-size: 16px;">
               <!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
               <th style="background-color: #3b3b5a; color : white; text-align: center; width: 70px;">No.</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">Transaction
                  Hash</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">Block
                  Num</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">Date</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">From</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">To</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">Value</th>
               <th style="background-color: #4d4d74;color : white; text-align: center;">Gas</th>
            </tr>
         </thead>
         <tbody id="tbody">

         </tbody>
         <tr style="background-color : #4d4d74; height:0.5px"><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      </table>
   </div>
</body>
</html>