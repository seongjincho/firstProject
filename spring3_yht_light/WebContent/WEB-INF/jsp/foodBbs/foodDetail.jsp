<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>   
<title>Food sharing</title>

<!-- noticeBbs.css -->
<link rel="stylesheet" type="text/css" href="css/foodDetail.css">

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<br><br><br><br><br><br>

 
<h2 align="center">제목:${foodList.title }</h2>



<div id="main" align="center">
<div id="main_container" style="width: 85%;">
<br/><br/>
<hr/>
<div>


<table>
<colgroup>
	<col width="50%"/><col width="50%"/>
</colgroup>
<tr>
	<td valign="top">	
		<div id="left_container" style="margin-right: 20px;">	
		<table>
		<colgroup>
			<col width="30%"/> <col width="30%"/><col width="30%"/>
		</colgroup>
		
		<tr>
			<td colspan="3">
				<div style="margin: 10 10 10 10;" id="mainImgConatiner">
				 ${foodList.fullname }
				</div>
			</td>
		</tr>
		
		<tr>
			
			<c:if test="${not empty attachList }">
			<c:forEach items="${attachList }" var="att" varStatus="vs">
			
			<td width="33%">
				<div style="margin: 10 10 10 10;" id="imageThumb_${vs.index }"> <%--0부터 시작 ~  --%>
						${att.fullname }
				</div>
			</td>
			
			</c:forEach>
			</c:if>
		</tr>
</table>
</div>
</td>
</tr>
</table>
</div>
</div>
</div>
		
		
<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>		
