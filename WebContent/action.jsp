<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="exam_01_02.dto.Member"%>
<%@page import="exam_01_02.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao memberDao = MemberDao.getInstance();
	String action = request.getParameter("action");
	
	/* join.jsp의 input name =""
	int custNo = -1;
	String custName = request.getParameter("custName");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	Date joinDate = request.getParameter("joindate");
	
	String grade = request.getParameter("grade");
	String city = request.getParameter("city"); */
	int custNo = -1;
	String custName = null;
	String phone = null;
	String address = null;
	Date joinDate = null;
	String grade = null;
	String city = null;
	Member member = null;

	switch(action){
		case "insert" :
			custNo = Integer.parseInt(request.getParameter("custNo"));
			custName = request.getParameter("custName");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
			grade = request.getParameter("grade");
			city = request.getParameter("city");
			
			member = new Member(custName, phone, address, grade, city);
			System.out.println("insert member --> " + member);
			memberDao.insertMember(member);
			break;
		
		case "update" :
			custNo = Integer.parseInt(request.getParameter("custNo"));
			custName = request.getParameter("custName");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
			grade = request.getParameter("grade");
			city = request.getParameter("city");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			joinDate = sdf.parse(request.getParameter("joinDate"));
			
			member = new Member(custNo, custName, phone, address, joinDate, grade, city);
			System.out.println("update member --> " + member);
			int updRes = memberDao.updateMember(member);
			System.out.println("updRes --> " + updRes);
			break;
			
		case "delete" :
			custNo = Integer.parseInt(request.getParameter("custNo"));
			custName = request.getParameter("custName");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
			grade = request.getParameter("grade");
			city = request.getParameter("city");
			
			int delRes = memberDao.deleteMember(custNo);
			System.out.println("delRes --> " + delRes);
			break;
	}
%>

<script>
	alert("등록 / 수정 / 삭제되었습니다.");
	location.href="./index.jsp?pp=list";
</script>