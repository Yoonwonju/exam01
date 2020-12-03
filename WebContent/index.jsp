<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/top.jsp"/>
<jsp:include page="include/nav.jsp"/>
<jsp:include page='${empty param.pp ? "home.jsp" : param.pp += ".jsp"  }'/>
<!-- pp가 없으면 home.jsp로 가고 pp가 있으면 pp.jsp로 이동 -->
<!-- <td><a href="index.jsp?pp=join"> 회원등록 </a></td> -->
<jsp:include page="include/footer.jsp"/>
