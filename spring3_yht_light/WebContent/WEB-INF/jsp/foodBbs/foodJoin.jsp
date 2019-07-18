<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
</head>
<body>

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<br><br>
<div align="center">



<table>
<tr>
<th>참여자 ID<hr><br><br></th>
</tr>

<c:if test="${not empty food_joinlist }">
<c:forEach items="${food_joinlist }" var="fj" varStatus="vs">
<tr>
<td>${vs.count }&nbsp;/&nbsp;<b>${fj.id }</b> <hr><br></td>
</tr>
</c:forEach>
</c:if>



</table>





</div>
<br><br>

<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</body>
</html>