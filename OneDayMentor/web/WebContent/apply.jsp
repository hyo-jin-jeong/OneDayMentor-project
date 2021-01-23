<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="apply.ApplyDAO" %>
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
	<jsp:include page="bar.jsp"/>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
		
		String menteeID = null;
		if (request.getParameter("menteeID") != null) {
			menteeID = request.getParameter("menteeID");
			}
		
		ApplyDAO ApplyDAO = new ApplyDAO();
		int result = ApplyDAO.overlap(bbsID, menteeID, userID);
		if(result==-1){
	%>

	<!-- 게시판 -->
	<div class="container main">
		<div class="row">
			<form method="post" action="applyAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">Applying Form</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="Title" name="writingTitle" maxlength="40" autofocus/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Korean Max : 150, English Max : 300."
									name="writingContent" maxlength="300" style="height: 250px; resize:none;"></textarea></td>

						</tr>
					</tbody>
				</table>
				<input type="hidden" name="bbsID" value="<%=bbsID%>">
				<input type="hidden" name="menteeID" value="<%=menteeID%>">
				<input type="button" class="btn btn-primary pull-right" value="Cancel" onclick="window.history.back()" style="margin-left:2px;"/>
				<input type="submit" class="btn btn-primary pull-right" value="Apply" />
			</form>
		</div>
	</div>
<%
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('한 글에 지원 중복 금지')");
			script.println("history.back()");
			script.println("</script>");

		}
%>
</body>
</html>