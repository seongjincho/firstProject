<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>  
 
<html>
<head>
<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>
<link rel="stylesheet" type="text/css" href="css/my_donation.css">
</head>
<body>


<c:if test="${login.id == null }">
	<script type="text/javascript">
		 alert("로그인 해 주십시오");
		 location.href='login.do';
	 </script> 
</c:if>  

<div class="mainImg" align="center">	
	<h1 class="headtitle">
	Donation List
	</h1>
</div>
<hr><br>
<div align="center" style=" margin-left: 5%; margin-right: 5%; margin-bottom: 5%;">

<h1 style="margin-bottom: 5%;">
<b style="color:#A7574A;">${login.id }</b>님의 후원 내역
</h1> 

<table style="width: 40%; border: 1px solid black; float: left; margin-right: 30%;">
<colgroup>
<col width="40%"><col width="30%"><col width="30%">
</colgroup>

<thead  id="myDona">
<tr style="border: 1px solid black;">
<th>&nbsp;&nbsp;&nbsp;ID(후원자)</th>  <th>&nbsp;후원금액</th>   <th>&nbsp;후원일자</th>
</tr>
</thead>

<tbody>


<c:if test="${empty my_donation }">
<td colspan="3" align="center">
<font style="font-size: 30pt; color:#A7574A; ">후원 내역이 없습니다 .</font><hr>
</td>
</c:if>

<c:if test="${not empty my_donation }">
	<c:forEach items="${my_donation }" var="dl">
	<tr>	
		<td><hr>&nbsp;&nbsp;&nbsp;${dl.id }( ${dl.name } ) <hr></td> 
		<td><hr>&nbsp;${dl.donation} 원 <hr></td>
		<td><hr>&nbsp;<fmt:formatDate value="${dl.rdate }" pattern="yyyy . MM . dd"/><hr> </td> 	
	</tr>	
	</c:forEach>
</c:if>
</tbody>

</table>

</div>

<br>
<table style="" class="donationInfo">
<tr>
<td>후원횟수 <br><br><td><b>&nbsp;&nbsp;&nbsp;${donationListSize }회</b><br><br></td>
</tr>
<tr>
<td>총 기부금<br><br> </td>
<td><b>&nbsp;&nbsp;&nbsp;\
<c:if test="${not empty myTotalDonation }">${myTotalDonation }</c:if>
<c:if test="${empty myTotalDonation }">0</c:if>
원</b><br><br></td>
</tr>
<tr>
<td colspan="2"><button type="button" class="btn btn-outline-danger" onclick="goDona()"><b>후원하기</b></button></td>
</tr>

</table>




<div style="clear:both"><br><br><br><br><br></div>
	<%-- footer --%>
	
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
 
 <script type="text/javascript">
function goDona() {
	//alert("도네 하기 ! ");
	location.href = "donation_main.do";
}

</script>

</body>
</html>