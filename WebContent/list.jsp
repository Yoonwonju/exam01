<%@page import="exam_01_02.dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="exam_01_02.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 아래에서 쓸 값들을 가져옴 */
	MemberDao memberDao = MemberDao.getInstance();
	List<Member> list = memberDao.selectMemberByAll();
%>

<h2>회원목록조회 / 수정</h2>
<table border="1">
	<colgroup>
		<col width="10%"><col width="15%"><col width="15%"><col width="30%">
		<col width="10%"><col width="10%"><col width="10%">
	</colgroup>
	<thead>
		<td>회원번호</td><td>회원성명</td><td>전화번호</td><td>주소</td>
		<td>가입일자</td><td>고객등급</td><td>거주지역</td>
	</thead>
	<tbody>
		<%
			for(Member mList : list){
		%>
				<tr>
					<td><a href="index.jsp?pp=update&custNo=<%=mList.getCustNo() %>"><%=mList.getCustNo() %> </a></td>
					<%-- <td><a href="index.jsp?pp=update"><%=mList.getCustNo() %> </a></td> --%>
					<td><%=mList.getCustName() %> </td>
					<td><%=mList.getPhone() %> </td>
					<td><%=mList.getAddress() %> </td>
					<td><%=mList.getJoinDate() %> </td>
					<td>
					 <%if(mList.getGrade().equals("A")){
						 %>VIP<%
					 }else if(mList.getGrade().equals("B")){
						 %>일반<%
					 }else{
						 %>직원<%
					 } %>
					</td>
					<td><%=mList.getCity() %> </td>
				</tr>
		<%
			}
		%>
	</tbody>

</table>
	