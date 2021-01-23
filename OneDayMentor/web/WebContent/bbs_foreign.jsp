<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
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
<link href="aos-master/dist/aos.css" rel="stylesheet">
<script src="aos-master/dist/aos.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>$.include('js/scroll.js');</script>
<title>One Day Mentor</title>
</head>
<style>
#menuContent{
padding: 5px;
}
#menuDiv{
margin-top: 120px; text-align : left;
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
	top: 60px;
	z-index: 1;
	background-image: url("img/right-arrow.png");
	background-size: 75%;
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
	background-image:
		url("img/close.png");
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
.active {
	background-color: lightgray;
}

html{
 background-size : 140% 50%;}
 
 #pencilimg:hover{
-webkit-transform:rotate(30deg);
}
</style>
<body>
	<jsp:include page="bar.jsp" />
	<%
		//로긴한사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		int pageNumber = 0; //기본 페이지 넘버
		int CID = 4;

		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<script>
		AOS.init();
	</script>
	<div data-aos="zoom-out" data-aos-duration="1000" style="height:250px; background-image:url('img/board.jpg'); background-size:100% 250px; background-repeat:no-repeat;">
		<div
			style="font-size: 40px; color: white; text-shadow: 1px 1px 1px black; position: absolute; top: 110px; left: 490px; z-index: 1;">
			<b>어학, 외국어 게시판</b>
		</div>
		
	</div>
	<div class="btn1"></div>

	<div onclick="history.back();" class="page_cover"></div>

	<div id="menu">
		<div onclick="history.back();" class="close"></div>
		<div id="menuDiv">
			<ul id="menuContent" class="nav">
				<li><a href="bbs_blockchain.jsp">블록체인</a></li>
				<br>
				<li><a href="bbs_economy.jsp">경제, 경영</a></li>
				<li><a href="bbs_law.jsp">법, 법률</a></li>
				<br>
				<li class="active"><a href="bbs_foreign.jsp">어학, 외국어</a></li>
				<li><a href="bbs_toeic.jsp">TOEIC</a></li>
				<br>
				<li><a href="bbs_clang.jsp">C, C++</a></li>
				<li><a href="bbs_html.jsp">HTML/CSS/Javascript</a></li>
				<li><a href="bbs_java.jsp">Java</a></li>
				<li><a href="bbs_hardware.jsp">하드웨어</a></li>
				<li><a href="bbs_electronic.jsp">전기, 전자</a></li>
				<br>
				<li><a href="bbs_music.jsp">음악</a></li>
				<li><a href="bbs_art.jsp">미술, 애니메이션</a></li>
				<br>
				<li><a href="bbs_etc.jsp">기타</a></li>
			</ul>
		</div>
	</div>

	<!-- 게시판 -->
	<div class="main">
		<div class="main">
			<div class="row">
			
			
			<div style="text-align: center;">
					
					<!-- 회원만넘어가도록 -->
					<%
						//if logined userID라는 변수에 해당 아이디가 담기고 if not null
						if (session.getAttribute("userID") != null) {
					%>

					<a href="write.jsp?CID=<%=CID%>" 
						style="margin-left: 10px; color : black; font-size: 20px;"><b>write </b><img id="pencilimg" src="img/pencil.png" style="width:50px;height:50px;"></a>
					<%
						} else {
					%>

					<a
						href="javascript:if(confirm('로그인 하세요'))location.href='login.jsp';"
						style="margin-left: 10px; color : black; font-size: 20px;"><b>write</b><img id="pencilimg" src="img/pencil.png" style="width:50px;height:50px;"></a>
					<%
						}
					%>
				</div>
				<table class="table table-striped"
					style="margin-left: 10%;margin-top : 20px;  width: 80%; border-top: 1px solid #dddddd; padding: 20px; border-bottom: 1px solid #dddddd; table-layout: fixed;">
					<thead style="background-color: #3d3d3d;">
						<tr style="height: 55px;">
							<!-- <th style="background-color: #eeeeee; text-align: center;">번호</th> -->
							<th
								style="font-size : 15px;vertical-align : middle;background-color: #142c57; color : white; text-align: center; width: 150px;">No.</th>
							<th style="font-size : 15px;vertical-align : middle;background-color: #1e3c74;color : white; text-align: center;">Title</th>
							<th style="font-size : 15px;vertical-align : middle;background-color:#1e3c74;color : white; text-align: center;">Writer</th>
							<th style="font-size : 15px;vertical-align : middle;background-color: #1e3c74;color : white; text-align: center;">Date</th>
						</tr>
					</thead>
					
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(CID, pageNumber * 10, 10);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=bbsDAO.getCount(CID) - pageNumber * 10 - i%></td>
							<%-- <td><%=list.get(i).getBbsID()%></td> --%>
							<%
								if (session.getAttribute("userID") != null) { //회원일때만 글제목 누르면 넘어감
							%>
							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
									<%=list.get(i).getBbsTitle()%></a></td>
							<%
								} else { //비회원일때 글제목 못누름
							%>
							<td><%=list.get(i).getBbsTitle()%></td>

							<%
								}
							%>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						</tr>
						
						<%
							}
						%>
						<tr style="background-color : #1e3c74; height:0.5px"><td></td><td></td><td></td><td></td></tr>
					</tbody>
				</table>


				<!-- 페이지 넘기기 -->
				<div style="text-align: center;">
					<%
						if (pageNumber != 0) {
					%>
					<a href="bbs_foreign.jsp?pageNumber=<%=pageNumber - 1%>"
						style="display: inline-block; font-size: 25px; color: #1e3c74;"><b>&laquo;</b></a>
					<%
						}
					%>
					<div style="display: inline-block; font-size: 20px; margin: 10px;"><%=pageNumber + 1%></div>
					<%
						if (bbsDAO.nextPage(pageNumber, CID)) {
					%>

					<a href="bbs_foreign.jsp?pageNumber=<%=pageNumber + 1%>"
						style="display: inline-block; font-size: 25px; color: #1e3c74;"><b>&raquo;</b></a>
					<%
						}
					%>
					
				</div>



			</div>
		</div>
	</div>
	<script>
		$(".btn1").click(function() {
			$("#menu,.page_cover,html").addClass("open");
			window.location.hash = "#open";
		});

		window.onhashchange = function() {
			if (location.hash != "#open") {
				$("#menu,.page_cover,html").removeClass("open");
			}
		};
	</script>
</body>
</html>