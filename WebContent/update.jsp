<%@page import="java.util.List"%>
<%@page import="exam_01_02.dto.Member"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam_01_02.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDao memberDao = MemberDao.getInstance();
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	Member member = memberDao.selectMemberByNo(custNo);

	/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String joinDate = sdf.format(new Date()); */
	/* Date joinDate = sdf.parse(request.getParameter("joinDate")); */
	
%>

<h2>홈쇼핑 회원 정보 수정</h2>
	<form action="./action.jsp" method="post" id="update" name="">
		<input type="hidden" name="action" value="update" >
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="text" id="custNo" name="custNo" value="<%=member.getCustNo() %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" id="custName" name="custName" value="<%=member.getCustName() %>"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" id="phone" name="phone" value="<%=member.getPhone() %>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" id="address" name="address" value="<%=member.getAddress() %>" ></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" id="joinDate" name="joinDate" value="<%=member.getJoinDate() %>" readonly> </td>
			</tr>
			<tr>
				<td>고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" id="grade" name="grade" value="<%=member.getGrade() %>" ></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" id="city" name="city" value="<%=member.getCity() %>" ></td>
			</tr>
		</table>
			<button type="submit" onclick="update();return false">수정</button>
			<button type="button" onclick="location='./index.jsp?pp=action&action=delete&custNo=<%=custNo %>'">삭제</button>
			<button type="button" onclick="location='./index.jsp?pp=list'">목록</button>
	</form>