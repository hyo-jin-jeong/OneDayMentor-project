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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/mypost.css">
<style type="text/css">
#menuContent {
	padding: 5px;
}

#menuDiv {
	margin-top: 120px;
	text-align: left;
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

html.open {
	overflow: hidden;
}

.btn1 {
	width: 50px;
	height: 50px;
	position: absolute;
	left: 0px;
	top: 50px;
	z-index: 1;
	background-image: url("img/right-arrow.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

.close {
	width: 50px;
	height: 50px;
	position: absolute;
	left: 0px;
	top: 50px;
	background-image: url("img/close.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

#menu {
	width: 150px;
	height: 100%;
	position: fixed;
	top: 0px;
	left: -152px;
	z-index: 10;
	border: 1px solid #c9c9c9;
	background-color: white;
	text-align: center;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
}

#menu.open {
	width: 250px;
	left: 0px;
}

.page_cover.open {
	display: block;
}

.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	right: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}

html {
	background-size: 140% 90%;
}

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body {
	width : 100vw;
	
	display: flex;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

/*- - - - - - C O N T A C T - C A R D S - - - - - */
.card {
	width: 200px;
	
	height : 50vh;
	/* ⬅ Size - Small (width: 200px), Medium (width: 225px), Large (width: 250px) */
	overflow: hidden;
	background-color: #FFFFFF;
	border-radius: 15px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	text-align: center;
	-webkit-transition: .1s ease-in-out;
	transition: .1s ease-in-out;
}

.card:first-of-type {
	margin-right: 25px;
}

.card:hover{
      margin-top: -10px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.4);
   }
.banner {
	height: 100px;
	width: 100%;
	padding-top: 30px;
	background-color: #FAFAFA;
	background-size: cover;
	background-position: center;
}

.card:first-of-type .banner {
	background-image:
		url("https://pbs.twimg.com/profile_banners/1026096500902903809/1556969620/1500x500");
}

.avatar {
	height: 100px;
	width: 100px;
	margin: auto;
	background-size: cover;
	background-position: center;
	background-color: #F1F1F1;
	border-radius: 100%;
}

.card:nth-child(1) .avatar {

}

h3, a, i {
	font-family: 'Roboto', sans-serif;
	font-weight: lighter;
	-webkit-transition: .1s ease-in-out;
	transition: .1s ease-in-out;
}

h3 {
	margin-top: 45px;
	margin-bottom: 5px;
	font-size: 18px;
	color: #212121;
}

a {
	display: block;
	padding: 5px 0px;
	font-size: 14px;
	color: #9E9E9E;
	text-decoration: none;
}

a:hover {
	background-color: #FAFAFA;
	color: inherit;
}

ul {
	margin-top: 10px;
	padding: 15px 0px;
	background-color: #FAFAFA;
}

ul a {
	display: inline;
	margin-right: 10px;
}

ul a:last-of-type {
	margin-right: 0px;
}

ul a i:hover {
	transform: scale(1.5);
}

body {
	margin: 0;
	width: 100%;
	height: 100vh;
	font-family: "Exo", sans-serif;
	color: #fff;
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
}

@keyframes gradientBG {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

.container {
	width: 100%;
	position: absolute;
	top: 35%;
	text-align: center;
}

h1 {
	font-weight: 300;
}

h3 {
	color: #eee;
	font-weight: 100;
}

h5 {
	color:#eee;
	font-weight:300;
}

a,
a:hover {
	text-decoration: none;
	color: #ddd;
}


</style>
<script type="text/javascript">
	function popup(e) {
		document.getElementById("chat").value = e.currentTarget.value;
		var url = "chat_open.jsp";
		var name = "chat";
		var option = "width=500, height=680, top=100, left=100, location=no";
		window.open(url, name, option);
	}

	function popup2(e) {
		document.getElementById("getMoney").value = e.currentTarget.value; // applyID
		var url = "money_open.jsp";
		var name = "money";
		var option = "width=500, height=680, top=100, left=100, location=no";
		window.open(url, name, option);
	}
</script>

</head>
<body >
	<jsp:include page="mobile_bar.jsp" />
	<%
		//로긴한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber3 = 0;
		if (request.getParameter("pageNumber3") != null) {
			pageNumber3 = Integer.parseInt(request.getParameter("pageNumber3"));
		}

		CategoryDAO category = new CategoryDAO();
	%>



	<!-- Three columns of text below the carousel -->

	
	
	<div class="main">
	<div style="width:100%;height: 100px; margin-top : 60px;margin-left:90px;margin-bottom : 20px;">
		
				<div style="background-color : white;width:200px;height : 100px;vertical-align : middle;
				 opacity:1;font-size:40px;text-align:center;display:table-cell;
				 border-radius : 30px;">
					<b>CHAT LIST</b>
				</div>
	</div>
		<div class="main" style="margin-left : 55px;">
		
			<div class="row">
			
			
				<%
					ApplyDAO applyDAO = new ApplyDAO();
					BbsDAO bbsDAO_3 = new BbsDAO();
					ChatDAO chatDAO = new ChatDAO();

					ArrayList<Bbs> list_3 = bbsDAO_3.getList5(userID, pageNumber3 * 8, 8); // 전체 글 목록

					for (int i = 0; i < list_3.size(); i++) {
						
						int id = applyDAO.getApplyID2(userID, list_3.get(i).getBbsID());
				%>



				<div class="row card"
					style="height:340px;margin-right: 30px; margin-left: 30px; margin-top: 40px; margin-bottom: 40px; display: inline-block;">
					<div class="col-lg-4 banner" style="width:100%;height: 450px;">
							
						<%
							if (chatDAO.getAvailable(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 0) {
									//chat room 일때
						%>
						<div class="avatar"style="align:center;"><img src="img/circle.png" alt="Generic placeholder image"
							width="70px" height="70px" style="margin-top:15px"></div>
						<%
							} else if (chatDAO.getAvailable(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 1
										&& !applyDAO.isMentee(id, userID)
										&& chatDAO.getEthReceipt(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 0) {
									//채팅 끝났고, 멘토가 돈 안받았을 때
						%>
						<div class="avatar"><img src="img/receivemoney.png" alt="Generic placeholder image"
							width="70" height="70"style="margin-top:15px"></div>

						<%
							} else {
									//멘토가 돈 받았고, 채팅 끝났을때
						%>
						<div class="avatar"><img src="img/check.png" alt="Generic placeholder image"
							width="60" height="60"style="margin-top:20px"></div>
						<%
							}
						%>
						
							<%
								

									if (applyDAO.isMentee(id, userID)) {
							%><h4 style="margin-left : 55px; width:50px;">멘티</h4>
							<%
								} else { // 멘토일 때
							%><h4 style="margin-left : 55px;width:50px">멘토</h4>
							<%
								}
							%>



						<div style="align:center; ">
							<%
								if (session.getAttribute("userID") != null) { //회원일때만 글제목 누르면 넘어감
							%>
							
								<%=list_3.get(i).getBbsTitle()%>
							
							<%
								} else { //비회원일때 글제목 못누름
							%>
							<h2 style="margin-left : 55px;"><%=list_3.get(i).getBbsTitle()%></h2>

							<%
								}
							%>
							<p style="width: 150px; margin-left : 10px;"><%=list_3.get(i).getBbsDate().substring(0, 11) + list_3.get(i).getBbsDate().substring(11, 13)
						+ "시" + list_3.get(i).getBbsDate().substring(14, 16) + "분"%></p>
							<p style="margin-left : 58px;width:50px;"><%=category.getCategoryKorean(list_3.get(i).getCategoryID())%></p>

							
							<%
									if (chatDAO.getAvailable(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 0) {
								%>

								<button type="button" id="chat" name="chat2"
									value="<%=applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())%>/<%=chatDAO.compareTime(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID()))%>"
									class="btn btn-primary" onClick="popup(event)"
									style="height: 30px;margin-left : 3px; margin-right: 8px;">chat</button>
								<%
									} else if (chatDAO.getAvailable(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 1
												&& !applyDAO.isMentee(id, userID)
												&& chatDAO.getEthReceipt(applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())) == 0) {
								%>

							<button type="button" id="getMoney"
								value="<%=applyDAO.getApplyID2(userID, list_3.get(i).getBbsID())%>"
								class="btn btn-primary" style="height: 30px; margin-left : 50px;margin-right: 8px;"
								onClick="popup2(event)">Ether</button>
							<%
								}
							%>
						
								

						</div>
						<!-- 이미지 빼고 콘텐츠들 -->
					</div>
					<!-- /.col-lg-4 -->
				</div>

				<%
					} /* for문 끝 */
				%>




				<div style="text-align: center;">
					<%
						if (pageNumber3 != 0) {
					%>
					<a href="chat_list.jsp?pageNumber3=<%=pageNumber3 - 1%>&n=3"
						style="display: inline-block; font-size: 25px; color: #f49987;"><b>&laquo;</b></a>
					<%
						}
					%>
					<div style="display: inline-block; font-size: 20px; margin: 10px;"><%=pageNumber3 + 1%></div>
					<%
						if (bbsDAO_3.nextPage5(pageNumber3, userID)) {
					%>
					<a href="chat_list.jsp?pageNumber3=<%=pageNumber3 + 1%>&n=3"
						style="display: inline-block; font-size: 25px; color: #f49987;"><b>&raquo;</b></a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

</body>
</html>