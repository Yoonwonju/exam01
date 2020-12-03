<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam_01_02.dto.Member"%>
<%@page import="exam_01_02.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDao memberDao = MemberDao.getInstance();
	int custNo = memberDao.nextCustNo();
	
	/* 원래 타입이 20. 12. 2 오후 9:40
		SimpleDateFormat() 괄호안에서 형식 바꿈
	*/
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String joinDate = sdf.format(new Date());
%>

<h2>홈쇼핑 회원 등록</h2>
	<!-- input의 id : 이름. javaScript에서 getElementById 로 불러올때 사용  -->
	<!-- input의 name : 주민번호. JSP에서 getParameter("")의 값 -->
																	<!-- 보류 :::key:value name:value -->
	<!-- input value 값이 action.jsp의 switch case "" 의 값으로 전달 -->
	
	<!-- form의 id는 .submit() 앞의 getElementById 에 사용 -->
	<form action="./action.jsp" method="post" id="join">
	<!-- name은 ./action.jsp 의 JSP에서 getParameter("")의 값
		value는 case "insert" 를 가리킴  -->
		<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" id="custNo" name="custNo" value="<%=custNo %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" id="custName" name="custName" value=""></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" id="phone" name="phone" value=""></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" id="address" name="address" value=""></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" value="<%=joinDate %>" readonly></td>
			</tr>
			<tr>
				<td>고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" id="grade" name="grade" value=""></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" id="city" name="city" value=""></td>
			</tr>
		</table>
			<div class="btn_group">
				<button type="submit" onclick="register();return false">등록</button>
				<button type="button" onclick="location='./index.jsp?pp=list'">조회</button>
			</div>
	</form>