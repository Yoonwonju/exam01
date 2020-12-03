<%@page import="exam_01_02.dto.Sale"%>
<%@page import="java.util.List"%>
<%@page import="exam_01_02.dao.SaleDao"%>
<%@page import="exam_01_02.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDao memberDao = MemberDao.getInstance();
	SaleDao saleDao = SaleDao.getInstance();
	
	List<Sale> list = saleDao.selectSaleByAll();
	
	

%>

<h2>회원매출조회</h2>

<table border="1">
	<thead>
		<td>회원번호</td><td>회원성명</td><td>고객등급</td><td>매출</td>
	</thead>
	<tbody>
		<%
			for(Sale sList : list){
		%>
			<tr>
				<td><%=sList.getCustNo() %></td>
				<td><%=sList.getCustName() %></td>
				<td><%=sList.getGrade() %></td>
				<td><%=sList.getTotal() %></td>
			</tr>
		<%
		}
		 %>
		
	</tbody>
	
	


</table>
