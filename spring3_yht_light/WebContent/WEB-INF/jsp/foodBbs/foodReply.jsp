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
</head>
<body>


<div align="center">

<form action="">

<table border="3">
<tr>
<th>댓</th>
<th>글</th>
</tr>
<tr>
<td>12123</td>
<td>124124124</td>
</tr>
</table>
<br>

<c:if test="${not empty joinList }">
<%-- onclick으로 ajax로 참여했는지 확인 후 alert창으로 띄우기  --%>
<input type="button" id="reply" name="reply" onclick="" value="댓글작성">
</c:if>

</form>

</div>
</body>
</html>