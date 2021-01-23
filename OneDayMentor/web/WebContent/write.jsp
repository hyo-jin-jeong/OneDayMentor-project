<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width initial-scale=1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>$.include('js/scroll.js');</script>
<title>JSP 게시판 웹사이트</title>
</head>

<body>

	<jsp:include page="bar.jsp" />
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		int CID = 0;
		//페이지넘버값이 있을때
		if (request.getParameter("CID") != null) {
			CID = Integer.parseInt(request.getParameter("CID"));
		}
	%>
	<!-- 게시판 -->
	<div class="container main">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">Writing Form</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>
							<%
							switch(CID){
							case 1:%>
								<select name="categoryID" style="width:14em;">
								<option value="1" selected="selected">블록체인</option>
								<option value="2">경제, 경영</option>
								<option value="3">법, 법률</option>
								<option value="4">어학, 외국어</option>
								<option value="5">TOEIC</option>
								<option value="6">C, C++</option>
								<option value="7">HTML/CSS/Javascript</option>
								<option value="8">Java</option>
								<option value="9">하드웨어</option>
								<option value="10">전기, 전자</option>
								<option value="11">음악</option>
								<option value="12">미술, 애니메이션</option>
								<option value="13">기타</option>
								</select>
								<%
								break;
							case 2:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2" selected="selected">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 3:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3" selected="selected">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 4:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4" selected="selected">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 5:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5" selected="selected">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 6:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6" selected="selected">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 7:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7" selected="selected">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 8:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8" selected="selected">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 9:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9" selected="selected">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 10:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10" selected="selected">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 11:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11" selected="selected">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 12:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12" selected="selected">미술, 애니메이션</option>
							<option value="13">기타</option>
							</select>
							<%
							break;
							case 13:%>
							<select name="categoryID" style="width:14em;">
							<option value="1">블록체인</option>
							<option value="2">경제, 경영</option>
							<option value="3">법, 법률</option>
							<option value="4">어학, 외국어</option>
							<option value="5">TOEIC</option>
							<option value="6">C, C++</option>
							<option value="7">HTML/CSS/Javascript</option>
							<option value="8">Java</option>
							<option value="9">하드웨어</option>
							<option value="10">전기, 전자</option>
							<option value="11">음악</option>
							<option value="12">미술, 애니메이션</option>
							<option value="13" selected="selected">기타</option>
							</select>
							<%
							break;
							}%>
							</td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="Title" name="bbsTitle" maxlength="30" autofocus/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Content"
									name="bbsContent" maxlength="2048" style="height: 350px; resize:none;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="Cancel" onclick="window.history.back()" style="margin-left:2px;"/>
				<input type="submit" class="btn btn-primary pull-right" value="Write" />
			</form>
			
		</div>
	</div>

</body>
</html>