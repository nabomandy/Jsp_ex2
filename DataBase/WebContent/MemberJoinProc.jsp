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
	  request.setCharacterEncoding("UTF-8"); //�ѱ�ó��

			//��� �κ��� ������ �о��� �ٽ� �� Ŭ������ ����
			String [] hobby = request.getParameterValues("hobby");
			//�迭�� �ִ� ������ �ϳ��� ��Ʈ������ ����
			String texthobby = "";

			for (int i = 0; i < hobby.length; i++) {
			  texthobby += hobby[i] + " ";
			}
	%>

	<!--useBean�� �̿��Ͽ� �Ѳ����� �����͸� �޾ƿ�  -->
	<jsp:useBean id="mbean" class="model.MenuBean">
		<jsp:setProperty property="*" name="mbean" />
		<!--*�� ��ü�� ���ν�Ű�ÿ�  -->
	</jsp:useBean>

	<%
	  mbean.setHobby(texthobby);
		//���� ��̴� �ּҹ����� ����Ǳ⿡ ���� �迭�� ������ �ϳ��� ��Ʈ������ ������ ������ �ٽ� �Է�

		//�����ͺ��̽� Ŭ���� ��ü ����, -> ��ü������ �ؾ��� �� �ȿ� �޼ҵ� ��밡���ؼ� ����� ��. �׿� ���� ����
		MenuDAO mdao = new MenuDAO();
		mdao.insertMember(mbean);
		
		//ȸ�������� �Ǿ��ٸ� ȸ�������� �����ִ� �������� �̵���Ŵ
		response.sendRedirect("MemberList.jsp");
	%>

	<!-- ����Ŭ�� ���� �Ϸ� !
 -->
	<!-- <h2>����� ���̵��mbean.getId()d() %></h2>
	
	<h2>����� ��̴� <%=mbean.getHobby()%></h2> -->







</body>
</html>