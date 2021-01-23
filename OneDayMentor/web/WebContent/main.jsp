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
<link href="css/starter-template.css" rel="stylesheet">
<script src="js/ie-emulation-modes-warning.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script><!-- jquery를 사용하는 태그 -->
<link rel="stylesheet" href="aos-master/dist/aos.css">
<script type="text/javascript" src="aos-master/dist/aos.js"></script>

<script>
   function fnMove() {/* Learn More 버튼을 눌렀을 때 이동하게 하는 함수 */
      var offset = $('#divAnimation').offset(); /* id가 learn을 찾아서 offset을 구하는 명령 */
      $('html, body').animate({scrollTop : offset.top-50}, 1000);
   }
   function fnMove2() {/* Learn More 버튼을 눌렀을 때 이동하게 하는 함수 */
      var offset = $("#blockchainnet").offset(); /* id가 learn을 찾아서 offset을 구하는 명령 */
      $('html, body').animate({scrollTop : offset.top}, 1000);
   }
   function fnMove3() {/* Learn More 버튼을 눌렀을 때 이동하게 하는 함수 */
      var offset = $(".wrapDiv2").offset(); /* id가 learn을 찾아서 offset을 구하는 명령 */
      $('html, body').animate({scrollTop : offset.top-50}, 1000);
   }
</script>
<style type="text/css">
footer {
   position: fixed;
   bottom: 0;
   text-align: center;
   font-weight: 800;
   font-size: large;
   height: 30px;
   width: 100%;
/*    background: linear-gradient(to right, #7984c4, #f0c8c4, #f0c8c4); */
   background: white;
}
#learn > a{ /* id="learn" */
   color: white;
   font-weight: bold;
}
a { text-decoration : none !important; }
#learn, .learn > div {
   padding-left:30px;
}
.learn { margin-bottom:50px; }/* class="learn" */
.learn > div { 
   padding-top : 20px; 
   font-size: 15px;
   text-align:center;}
.learn > img {
   display: block;
   margin: 0 auto;
}

.ani-img{
 width:80px;
 height:80px;
 margin-left : 2px;
 margin-right : 2px;
}

.dollar{
   position:absolute;
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

.coin{
   position:absolute;
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}
.smartcontract, .mentor, .bank, .mentor2{
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

.downarrow{
   animation-delay:1s;
   animation-duration:1s;
   animation-timing-function:linear;
   -webkit-animation-fill-mode:forwards;
}

.note,.noteimg{
   position:absolute;
   animation-delay:1s;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

#movingBtn, #storeBtn, #movingBtn2, #cardBtn{
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:0.5s;
   -webkit-animation-fill-mode:forwards;
}

.cardBtn2{
   animation-delay:1s;
   animation-timing-function:linear;
   animation-duration:0.5s;
   -webkit-animation-fill-mode:forwards;
}

.record, .downarrow1{
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

.movingimg{
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}
.coin1, .dollar2{
   position:absolute;
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

.cardBtn3{
   animation-delay:now;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;

}
.banktext{
   animation-delay:1s;
   animation-timing-function:linear;
   animation-duration:1s;
   -webkit-animation-fill-mode:forwards;
}

@-webkit-keyframes boxDelay{
  from{
  left: 280px;
  }
  to{
  left:600px;
  }
}

@-webkit-keyframes fadein { 
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}

@-webkit-keyframes fadein2 { 
    from {
        opacity:1;
    }
    to {
        opacity:0;
    }
}

@-webkit-keyframes moving{
  0%{
  transform: translateY(0px);
  }
  25%{
  transform: translate(-70px,70px);
  width : 90px;
  height : 90px;
  }
  50%{
  transform: translate(-100px,150px);
   width : 100px;
  height : 100px;
  }
  75%{
  transform: translate(30px,230px);
   width : 110px;
  height : 110px;
  }
  100%{
  transform: translate(135px,350px);
   width : 120px;
  height : 120px;
  }
}
@-webkit-keyframes boxDelay2{
  from{
  left: 600px;
  }
  to{
  left:920px;
  }
}
/*수정*/
@FONT-FACE {
      font-family: "arlrdbd";
      src: url("fonts/arlrdbd.ttf");
   }
   @FONT-FACE {
      font-family: "font2";
      src: url("fonts/interpark_m.ttf");
   }
   @FONT-FACE {
      font-family: "font3";
      src: url("fonts/font3.ttf");
   }
    @font-face { font-family: 'LotteMartDream'; 
   font-style: normal; 
   font-weight: 700;
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamBold.woff') format('woff'); } @font-face { font-family: 'LotteMartDream'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'),
   url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff'); }
.caption1 {
   font-family: "arlrdbd";
   font-size: 55px;
}
.caption2, .caption3 {
   font-family: "font2";
   font-size: 28px;
}

</style>
<title>JSP 게시판 웹사이트</title>
</head>


<body style="background: white">
<script>
    AOS.init();
  </script>
   <%
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
   %>
   <jsp:include page="bar.jsp" />

   <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>

      <div class="carousel-inner" role="listbox" data-aos="fade-zoom-in" data-aos-offset="200" data-aos-easing="ease-in-sine" data-aos-duration="1000">


         <div class="item active" style="background-size:100% 100%; background-image: url(img/banner1.gif);">
            <div class="container">
               <div class="carousel-caption">
                  <div style="width : 100%; margin-bottom: 230px; text-align:left; color: white;">
                  <div class="caption1" style="display: inline-block;">One Day Mentor</div><br><br>
                  <div class="caption2" style="display: inline-block;">블록체인 기반 소액 가상화폐 거래를 통한<br></div>
                  <div class="caption3" style="display: inline-block; text-align: right;">일일 멘토링 웹 서비스</div>                  
                  </div>
               </div>
            </div>
         </div>
         
         <div class="item" style="background-size:100% 100%; background-image: url(img/banner1.gif);">
            <div class="container">
               <div class="carousel-caption" style="color: white; margin-left: 60px; margin-bottom: 25%; padding:0px; width:700px;">      
                  <h1 style=" font-size: 55px; font-weight: bold;">What is a Blockchain?</h1>
                  <div></div>
               </div>
               <p style="margin-left:420px; margin-top : 300px">
                  <button style="background-color: white; color: #4d4d74; font-weight: bold; margin-left:100px; margin-bottom :120px" class="btn btn-lg btn-primary" onclick="fnMove()">Learn more</button>
               </p>
               
            </div>
         </div>


         <%
            if (userID == null) {
         %>

         
         <div class="item" style=" background-size:100% 100%; background-image: url(img/banner1.gif);">
            <div class="container">
               <div class="carousel-caption" style="color: white; margin-left: 50px; margin-bottom: 25%; padding:0px; width:100%;">
                  <h1 style="color: white; font-size: 55px; font-weight: bold; text-align: left;">Go to sign up for membership</h1>
               </div>
               <p style="margin-left:420px; margin-top : 300px; text-align: left;">
                  <a style="background-color: white; color: #4d4d74; font-weight: bold; margin-left:100px; margin-bottom :120px;" class="btn btn-lg btn-primary" href="join.jsp" role="button">Join with us</a>
               </p>
            </div>
         </div>
      </div>

      <%
         } else if (userID != null) { //로그인 되어있을때
      %>
      
      
      <div class="item" style="background-size:100% 100%; background-image: url(img/banner1.gif);">
         <div class="container">
            <div class="carousel-caption" style="color: white; margin-left: 50px; margin-bottom: 25%; padding:0px; width:100%;">
               <h1 style="color: white; font-size: 55px; font-weight: bold; text-align: left;">Go to find Mentor or Mentee</h1>
            </div>
            <p style="margin-left:420px; margin-top : 300px; text-align: left;">
               <a style="background-color: white; color: #4d4d74; font-weight: bold; margin-left:100px; margin-bottom : 120px" class="btn btn-lg btn-primary" href="bbs_blockchain.jsp" role="button">Let's looking for</a>
            </p>
         </div>
      </div>
   </div>
   <%
      }
   %>
   
   <a class="left carousel-control" href="#myCarousel" role="button"
      data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
      aria-hidden="true"></span> <span class="sr-only">Previous</span>
   </a>

   <a class="right carousel-control" href="#myCarousel" role="button"
      data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
      aria-hidden="true"></span> <span class="sr-only">Next</span>
   </a>
   
   <div id = "divAnimation" class="container main" style="margin-top:150px; border-radius : 80px; box-shadow : 10px 10px rgb(184,184,200);
   background:#384062; width : 80%; height:2000px; color: white;" data-aos="fade-zoom-in" data-aos-offset="200" data-aos-easing="ease-in-sine" data-aos-duration="1000">
      <div class="wrapDiv1">
         <div style="font-size:30px; margin-top:10px;margin-bottom:10px; text-align:center;">
            <b>기존 은행 시스템</b>
         </div>
          <button id="cardBtn" style="background: none; border: none; font-size:20px;"><b>① Click</b></button>
          <img style="margin-left : 5px;margin-top: 40px;" src="img/dollar.png" alt="dollar" width="65px" height="65px" class="dollar">
          <button class="cardBtn2" style="opacity:0;margin-left : 350px;background: none; border: none; font-size:20px;"><b>② Click</b></button>   
            
            <div style="text-align:center;margin-top: 10px;">
               <div  style="margin-top:90px;">
                  <div>
                     <img class="ani-img" src="img/question.png" alt="mentee">
                         <span  style="font-size:40px;">-------------</span>
                         <img class="ani-img" src="img/bank.png" alt="bank">
                         <span style="font-size:40px;">-------------</span>
                     <img class="ani-img" src="img/thinking.png" alt="thinking">
                     <div>
                        <span style="font-size:20px;"><b>멘티</b></span>
                   
                         <span class="bank" style="font-size:20px;opacity:0; margin-left : 90px;"><b>은행으로 송금</b></span>
                         <span  style="font-size:20px; margin-left : 100px; margin-right : 100px;">은행</span>
                         
                         <span class="mentor2" style="font-size:20px;opacity:0; margin-right : 90px;"><b>멘토에게 송금</b></span>
                         <span style=" font-size:20px;"><b>멘토</b></span>
                     </div>
                  </div>
                  <div class="banktext" style="font-size:40px; opacity : 0; color:#ffc403; text-shadow : 6px 6px black;
                  margin-top : 80px;">
                     <b>은행에서 거래장부 기록 => 중앙집중형</b>
                  </div>
               </div>
            </div>
         
      </div>
      
      <div class="wrapDiv2" style="margin-top:210px">
         <div style="font-size:30px; margin-top:30px;margin-bottom:10px; text-align:center;">
            <b>블록체인 송금 시뮬레이션</b>
         </div>
          <button id="movingBtn" style="background: none; border: none; font-size:20px;"><b>① Click</b></button>
          <img style="margin-left : 5px;margin-top: 40px;" src="img/coin.png" alt="coin" width="65px" height="65px" class="coin">
          <button id="movingBtn2" style="opacity:0;margin-left : 350px;background: none; border: none; font-size:20px;"><b>④ Click</b></button>
                    
          <div style="text-align:center;margin-top: 10px;">
          
             <div style="margin-top:90px;">
             <div>
              <img class="ani-img" src="img/question.png" alt="mentee">
                <span  style="font-size:40px;">-------------</span>
                <img class="ani-img" src="img/savings.png" alt="savings">
                <span style="font-size:40px;">-------------</span>
                <img class="ani-img" src="img/thinking.png" alt="thinking">
                
                <div>
                
                <span style="font-size:20px; margin-right : 60px;"><b>멘티</b></span>
                
                <span class="smartcontract" style="font-size:20px;opacity:0;margin-right : 200px;"><b>스마트컨트랙트로 송금</b></span>
                <span class="mentor" style="font-size:20px;opacity:0;margin-right : 90px;"><b>멘토에게 송금</b></span>
                <span style=" font-size:20px;margin-right : 10px;"><b>멘토</b></span>
                </div>
             </div>
               
             </div>
             <img style="margin-right:380px; margin-top:20px; color : white;display:inline-block; opacity:0;"src="img/downarrow.png" alt="downarrow" width="64px" height="64px" class="downarrow">
             
             <img style="margin-left:250px;margin-top:20px; display:block;opacity:0;" class="noteimg" src="img/note.png" alt="note"width="80px" height="80px">
            
                         
             <div class="record">
                <span style="margin-left:338px; margin-top:30px; display:block; opacity:0; font-size: 30px;" class="note"><b>거래 기록</b>
                <br>
                <button id="networkBtn" style="background: none; border: none; font-size:20px;" onclick="fnMove2()"><b>② Click</b></button>
                </span>
             </div>
             
             <div class="text3" style="display:inline-block;font-size:20px; opacity:0;">
                <button id="storeBtn" style="margin-right : 150px;background: none; border: none; font-size:20px;"
                onclick="fnMove3()"><b>③ Click</b></button><br>
                <b>블록체인 네트워크에 거래내역 저장</b>
             </div>
               
               <img id="blockchainnet"style="margin-top:200px;"src="img/blockchainnetwork.png">
         </div>
      
      </div>
         
   </div>
   
   <!-- Learn More 클릭시 -->
   <div class="container main" style="margin-top:200px; border-radius : 80px; box-shadow : 10px 10px rgb(184,184,200);
   background:#384062; color : white;width : 80%;">
      
      <div class="learn">
         <h2 id="learn" style="color : white;"><a>Meatamask</a></h2>
            <img src="img/Metamask2.png">
            <div>
               이 서비스는 <b style="color : #1976b8; font-size:1.2em;">블록체인</b>을 사용하는 서비스이기 때문에 여우모양의 '메타마스크'를 깔아주어야 한다.<br/>
               메타마스크 설치 경로는 <a href="https://metamask.io/" target="_blank;"><span style="font-size:17px; font-weight:bold;">여기</span></a>를 누르면 된다.
               크롬(혹은 FireFox, Opera) 확장 프로그램으로 설치해주면 완성!
            </div>
      </div>
   </div>
   <footer>By MENTORS</footer>
   <script>
    $(function(){
       $('#cardBtn').click(function(){ 
            //기존은행 1번버튼 클릭시
            $('.dollar').css('-webkit-animation-name','boxDelay'); //카드 움직이기
            $('.bank').css('-webkit-animation-name','fadein'); //현금 첫번째 텍스트 띄우기
            $('#cardBtn').css('-webkit-animation-name','fadein2');
            $('.cardBtn2').css('-webkit-animation-name','fadein'); //2번버튼 생김
            
           
        });
       
       $('.cardBtn2').click(function(){ 
         //기존은행 2번버튼 클릭시
         
          $('.cardBtn2').addClass('cardBtn3');
           $('.cardBtn3').removeClass('cardBtn2');
         $('.dollar').addClass('dollar2');
         $('.dollar2').removeClass('dollar');
         $('.dollar2').css('-webkit-animation-name','boxDelay2');
         $('.mentor2').css('-webkit-animation-name','fadein'); //현금 두번째 텍스트 띄우기(멘토에게 송금)
         
         
         $('.cardBtn3').css('-webkit-animation-name','fadein2');
         $('.banktext').css('-webkit-animation-name','fadein');
         
         var offset = $(".wrapDiv2").offset(); /* id가 learn을 찾아서 offset을 구하는 명령 */
         $('html, body').delay(4000).animate({scrollTop : offset.top-30}, 2000);
            
         
        });
       
        $('#movingBtn').click(function(){ 
            //1번버튼 클릭시
            $('.coin').css('-webkit-animation-name','boxDelay'); //동전 움직이기
           $('.smartcontract').css('-webkit-animation-name','fadein');            
           $('.downarrow').css('-webkit-animation-name','fadein'); //화살표생기기
           $('.noteimg').css('-webkit-animation-name','fadein');//장부생김
            $('.note').css('-webkit-animation-name','fadein');//장부텍스트생김
            $('#movingBtn').css('-webkit-animation-name','fadein2'); //1번버튼 사라짐
           
        });
        
        $('#networkBtn').click(function(){
           $('.downarrow').addClass('downarrow1'); 
           $('.downarrow1').removeClass('downarrow');
           
           /* $('.record').css('-webkit-animation-name', 'fadein2'); */
           $('.downarrow1').remove();
           $('.record').remove();
           
           $('.noteimg').addClass('movingimg');
           $('.movingimg').removeClass('noteimg');
           $('.movingimg').css('opacity','1');
           $('.movingimg').css('-webkit-animation-name','moving');
         
           $('.text3').css('opacity','1');
           
        });
        
        $('#storeBtn').click(function(){
            $('#storeBtn').css('-webkit-animation-name','fadein2'); //3번버튼 사라짐

           $('#movingBtn2').css('opacity','1');
        });
        
        $('#movingBtn2').click(function(){
            $('.coin').addClass('coin1');
            $('.coin1').removeClass('coin');
            $('.coin1').css('-webkit-animation-name','boxDelay2'); //동전 움직이기 
            $('.mentor').css('-webkit-animation-name','fadein');
            $('#movingBtn2').css('-webkit-animation-name','fadein2'); //4번버튼 사라짐
           
            var offset = $("#learn").offset(); /* id가 learn을 찾아서 offset을 구하는 명령 */
            $('html, body').delay(4000).animate({scrollTop : offset.top}, 2000);
        })
      });
   </script>
   <footer>By MENTORS</footer>
</body>
</html>