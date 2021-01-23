<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="apply.ApplyDAO"%>
<%@ page import="apply.Apply"%>
<%@ page import="category.CategoryDAO" %>
<%@ page import="category.Category" %>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	//sresponse.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

		//글이 유효한지 판별

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

		Bbs bbs = new BbsDAO().getBbs(bbsID);

		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}

		else {
			BbsDAO BbsDAO = new BbsDAO();
			CategoryDAO CategoryDAO = new CategoryDAO();
			ApplyDAO ApplyDAO = new ApplyDAO();
			int result = BbsDAO.delete(bbsID);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} 
			
			else {
				//글삭제시 그 글이 applytable에 존재한다면 삭제되야함.
				int result2 = ApplyDAO.delete(bbsID);
				if(result2 == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('apply table에서 삭제 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs_"+CategoryDAO.getCategoryName(bbs.getCategoryID())+".jsp'");	
				script.println("</script>");
				}
			}
		}
	%>
</body>
</html>