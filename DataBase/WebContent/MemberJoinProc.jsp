<%@page import="model.MenuBean"%>
<%@page import="model.MenuDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
	  request.setCharacterEncoding("UTF-8"); //한글처리

			//취미 부분은 별도로 읽어드려 다시 빈 클래스에 저장
			String [] hobby = request.getParameterValues("hobby");
			//배열에 있는 내용을 하나의 스트링으로 저장
			String texthobby = "";

			for (int i = 0; i < hobby.length; i++) {
			  texthobby += hobby[i] + " ";
			}
	%>

	<!--useBean을 이용하여 한꺼번에 데이터를 받아옴  -->
	<jsp:useBean id="mbean" class="model.MenuBean">
		<jsp:setProperty property="*" name="mbean" />
		<!--*는 전체를 맵핑시키시오  -->
	</jsp:useBean>

	<%
	  mbean.setHobby(texthobby);
		//기존 취미는 주소번지가 저장되기에 위에 배열의 내용을 하나의 스트링으로 저장한 변수를 다시 입력

		//데이터베이스 클래스 객체 생성, -> 객체생성을 해야지 그 안에 메소드 사용가능해서 만드는 거. 그외 이유 없음
		MenuDAO mdao = new MenuDAO();
		mdao.insertMember(mbean);
		
		//회원가입이 되었다면 회워정보를 보여주는 페이지로 이동시킴
		response.sendRedirect("MemberList.jsp");
	%>

	<!-- 오라클에 접속 완료 !
 -->
	<!-- <h2>당신의 아이디는mbean.getId()d() %></h2>
	
	<h2>당신의 취미는 <%=mbean.getHobby()%></h2> -->







</body>
</html>