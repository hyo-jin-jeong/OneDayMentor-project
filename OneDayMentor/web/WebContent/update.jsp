<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
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

			//로그인 안한 경우
			if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
			}

			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
			}

			//작성한 사람이 같은지
			Bbs bbs = new BbsDAO().getBbs(bbsID);
			if (!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
			}
	%>



	<!-- 게시판 -->
	<div class="container main">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%> ">
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
							<td><input type="text" class="form-control"
								placeholder="Title" name="bbsTitle" maxlength="50"
								value="<%=bbs.getBbsTitle()%>"></td>
						</tr>

						<tr>
							<td><textarea class="form-control" placeholder="Content"
									name="bbsContent" maxlength="2048" style="height: 350px; resize:none;"><%=bbs.getBbsContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="Cancel" onclick="window.history.back()" style="margin-left:2px;"/>
				<input type="submit" class="btn btn-primary pull-right" value="Update">
			</form>
			
		</div>
	</div>


</body>
</html>