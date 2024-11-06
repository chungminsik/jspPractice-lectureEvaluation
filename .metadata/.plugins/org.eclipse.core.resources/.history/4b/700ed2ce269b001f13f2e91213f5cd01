<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="helloworld.user.UserDTO" %>
<%@ page import="helloworld.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userId = null;
	String userPassword= null;
	
	//input 데이터가 있을 때
	if(request.getParameter("userId") != null){
		userId = (String) request.getParameter("userId");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = (String) request.getParameter("userPassword");
	}
	
	//input 데이터가 없을 때
	if(userId == null || userPassword == null){
		PrintWriter script = response.getWriter();
		
		script.print("<script>");
		script.print("alert('입력이 안된 사항이 있습니다');");
		script.print("history.back();");
		script.print("</script>");
		script.close();
		return;
	}
	
	//DAO 객체 만들어서 DB에 저장
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userId, userPassword);
	
	//저장 확인 되면 다시 화면으로 이동
	if(result == 1){
		PrintWriter script = response.getWriter();
		
		script.print("<script>");
		script.print("alert('회원가입에 성공하였습니다');");
		script.print("location.herf = 'index.jsp';");
		script.print("</script>");
		script.close();
		return;
	}
%>