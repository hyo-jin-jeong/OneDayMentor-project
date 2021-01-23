<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chat.Chat"%>
<%@ page import="chat.ChatDAO"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<title>JavaScript MQTT WebSocket Example</title>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;

	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
%>
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
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js"
	type="text/javascript"></script>
</head>

<body>
	
<script>
	var applyStr = window.opener.document.getElementById("chat").value;
	var apply = applyStr.split("/");
	
	var applyID = apply[0];
	var startTime = apply[1];
	
	var matchingMin = startTime.substring(14,16);
	var matchingSec = startTime.substring(17,19);
	var checkTime = new Date(); //검사하는 시간
	
	var checkTimeHou = checkTime.getHours();
	var checkTimeMin = checkTime.getMinutes();
	var checkTimeSec = checkTime.getSeconds();
	
/* 	var matchingHou = apply[1].substring(11,13);
	var matchingMin = apply[1].substring(14,16); 
	var matchingSec = apply[1].substring(17,19); 
	
	console.log("check : " + checkTimeHou + checkTimeMin + ", " + checkTimeSec);
	console.log("match : " + matchingHou + matchingMin + ", " + matchingSec); */
	
	if(matchingMin == checkTimeMin){ //분 안바뀜
	      if(matchingSec < checkTimeSec && checkTimeSec - matchingSec > 30){
	            console.log("1 꺼집니다");
	            window.location.replace("mobile_chatStop.jsp?applyID="+ applyID);
	      }
	      else{
	    	  window.location.replace("mobile_chat.jsp?applyID=" + applyID + "&matchingMin="+ matchingMin + "&matchingSec=" + matchingSec);
	    	  }
	}
	   
	else if(checkTimeMin - matchingMin > 0){//분 바뀌는 경우
	   var time = checkTimeMin - matchingMin;
	      if(matchingSec > checkTimeSec && (checkTimeSec + 60*time) - matchingSec > 30){
	         console.log("2 꺼집니다.");
	         window.location.replace("mobile_chatStop.jsp?applyID="+ applyID);
	      }
	      else{
	    	  window.location.replace("mobile_chat.jsp?applyID=" + applyID + "&matchingMin="+ matchingMin + "&matchingSec=" + matchingSec);
	      }
	}// 나중에 59분과 0분 상황도 생각해야 됨


</script>	
	
</body>
</html>