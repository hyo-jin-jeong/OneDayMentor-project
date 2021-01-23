<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="chat.ChatDAO"%>
<%@ page import="chat.Chat" %>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width initial-scale=1">
<title>JavaScript MQTT WebSocket Example</title>
<%
   request.setCharacterEncoding("UTF-8");

   int applyID = 0;
   int matchingMin = 0;
   int matchingSec = 0;
   
   if(request.getParameter("applyID") != null){
      applyID = Integer.parseInt(request.getParameter("applyID"));
   }
   
   if(request.getParameter("matchingMin") != null){
      matchingMin = Integer.parseInt(request.getParameter("matchingMin"));
   }
   
   
   if(request.getParameter("matchingSec") != null){
      matchingSec = Integer.parseInt(request.getParameter("matchingSec"));
   }
   
%>
<style>
* {
   margin: 0;
   padding: 0;
}

.dateTop {
   position: relative;
   display: block;
   text-align: center;
   background-color: #c4c4c4;
   width: auto;
   padding: 5px;
   margin: 0 auto;
   color: white;
   border-radius: 15px;
}

.my_message>.tooltip {
   position: relative;
   display: block;
   background-color: #f0c8c4;
   width: 160px;
   left: 50%;
   top: 10px;
   margin-top: 20px;
   margin-bottom: 20px;
   bottom: 40px;
   border-radius: 10px;
   padding: 10px;
   color: white;
   border: 1px solid black;
}

.my_message>.date {
   display: block;
   text-align: right;
   margin-right: 20px;
   font-size: 12px;
}

.you_message>.tooltip {
   position: relative;
   display: block;
   background-color: #7984c4;
   width: 160px;
   left: 10%;
   top: 10px;
   margin-top: 20px;
   margin-bottom: 20px;
   border-radius: 10px;
   bottom: 40px;
   padding: 10px;
   color: white;
   border: 1px solid black;
}

.you_message>.date {
   display: block;
   text-align: left;
   margin-left: 20px;
   font-size: 12px;
}

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
</style>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js"
   type="text/javascript"></script>
<script type="text/javascript" lang="javascript">
   var mqtt;
   var reconnectTimeout = 5000;
   var host = "125.177.20.54";
   var port = 9001; // Websocket port는 9001, MQTT 기본 port는 1883
   var client = parseInt(Math.random() * 100, 10).toString();

   var applyID;
   
   var nowDate;
   var nowTime;
   
   var checkTime;
   var checkTimeSec;
   var checkTimeMin;
   
   var matchingMin;
   var matchingSec;
   
   function onConnectionLost() {
      document.getElementById("message").innerHTML = "Connection Lost";
      connected_flag = 0;
   }
   function onMessageArrived(msg) { // 메세지 왔을 때
      nowTime = new Date();
      var time = nowTime.getHours() + "시 " + nowTime.getMinutes() + "분 "
            + nowTime.getSeconds() + "초";
      var message = msg.payloadString;
      cid = message.split(":");
      if (cid[0] == client) {
         console.log(cid[0] + " : " + cid[1]);
         document.getElementById("area").innerHTML += '<div class="my_message">'
               + '<div class="tooltip">'
               + cid[1]
               + "   "
               + '</div>'
               + '<div class="date">'
               + '<span style="color:#999999">'
               + time + '</span>' + '</div>' + '</div>';
               

      } else {
         console.log(cid[0] + " : " + cid[1]);
         document.getElementById("area").innerHTML += '<div class="you_message">'
            + '<div class="tooltip">'
            + cid[1]
            + "   "
            + '</div>'
            + '<div class="date">'
            + '<span style="color:#999999">'
            + time + '</span>' + '</div>' + '</div>';
         
      }
      var divdiv = document.getElementById("area");
      if (divdiv.style.overflow == "auto") {
         divdiv.scrollTop = divdiv.scrollHeight + 10;
      }
   }
   function onConnected(recon, url) {
      console.log(" in onConnected " + reconn);
   }

   function MQTTconnect() {
      console.log("connecting to " + host + " " + port);
      mqtt = new Paho.MQTT.Client(host, port, client);
      console.log("client : " + client);
      console.log(mqtt);
      var options = {
         timeout : 1,
         onSuccess : onConnect,
         onFailure : onFailure,
      };

      mqtt.onConnectionLost = onConnectionLost;
      mqtt.onMessageArrived = onMessageArrived;
      mqtt.onConnected = onConnected;

      mqtt.connect(options); //connect

      nowDate = new Date();
   }

   function onConnect() {
         applyID = '<%=applyID%>';
      
         // Once a connection has been made, make a subscription and send a message.mqtt.subscribe(applyID);
         mqtt.subscribe(applyID);
         console.log("Connected");
         console.log("topic : " + applyID);
         console.log("matchingMin:" + <%=matchingMin%>);
         console.log("matchingSec:" + <%=matchingSec%>);
      
         var date = document.createElement("div");
         date.setAttribute("class", "dateTop");
         date.innerHTML += "Subscribe to " + applyID + "<br>" + nowDate.getFullYear() + "년 " + (nowDate.getMonth() + 1)
         + "월 " + nowDate.getDate() + "일<br>";
         document.getElementById("area").appendChild(date);
      }

   function onFailure(message) { // 연결 실패
      console.log("Connection Attempt to Host " + host + "Failed");
      document.getElementById("area").innerHTML += "Failed";
      setTimeout(MQTTconnect, reconnectTimeout);
   }

   function pub() { // publish
      if (document.getElementById("message").value == "")
         alert('내용을 입력해주세요.');
      else {
         value1 = client + ":" + document.getElementById("message").value;
         message = new Paho.MQTT.Message(value1);
         message.destinationName = applyID;
         mqtt.send(message);

         document.getElementById("message").value = "";
      }
   }
   function enter() {
      var keyCode = event.keyCode;
      if (keyCode == 13) {
         pub();
      }
   }
   
   function timeCheck(){
      checkTime = new Date(); //검사하는 시간 초
      
      checkTimeHou = checkTime.getHours();
      checkTimeMin = checkTime.getMinutes();
      checkTimeSec = checkTime.getSeconds();
      
      matchingMin = <%=matchingMin%>;
      matchingSec = <%=matchingSec%>;
       
      console.log("check : " + checkTimeMin + "," + checkTimeSec);
      console.log("match : " + matchingMin + "," + matchingSec);
      
      if(matchingMin == checkTimeMin){ //분 안바뀜
            if(matchingSec < checkTimeSec && checkTimeSec - matchingSec > 30){
                  console.log("1 꺼집니다");
                  window.location.replace("mobile_chatStop.jsp?applyID="+ applyID);
            }
            else {
               console.log("1ㄱㅊ");
            }
      }
         else if(checkTimeMin - matchingMin > 0){
         var time = checkTimeMin - matchingMin;
            if(matchingSec > checkTimeSec && (checkTimeSec + 60*time) - matchingSec > 30){
               console.log("2 꺼집니다.");
               window.location.replace("mobile_chatStop.jsp?applyID="+ applyID);
            }
            else {
               console.log("2ㄱㅊ");
            }
         }//59분과 0분 상황도 생각해야 됨
   }
</script>
</head>
<body style="width: 97%" onload="setInterval(timeCheck, 1000)">
   <script>
      MQTTconnect();
   </script>
   <div id="area"
      style=" word-break: break-all; word-wrap: break-word; margin: 5px; width: 100%; height: 80vh; overflow: auto;">

   </div>
   <p id=""></p>
   <br />
   <div style="width: 100%; margin: 10px;">
      <input id="message" type="text" name="message" autofocus
         style="width: 97%; height: 40px; font-size: 13px; word-break: break-all; word-wrap: break-word;"
         onkeyPress="enter(this)">
   </div>
</body>
</html>