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
<link rel="stylesheet" type="text/css" href="css/donation_list.css">

<%--차트 --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


</head>
<body>

<%-- 
<c:if test="${login.id == null }">
	<script type="text/javascript">
		 alert("로그인 해 주십시오");
		 location.href='login.do';
	 </script> 
</c:if>  --%>


<div class="mainImg" align="center">
<h1 class="headtitle">
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyy/MM/dd" var="nowDay" />
${nowDay }<br><br> 현재  누적 금액:
<c:if test="${not empty totalDonation }">\ ${totalDonation }원</c:if>
<c:if test="${empty totalDonation }">\0&nbsp;원</c:if> <br><br>
감사합니다
</h1>
</div>	
<hr>

<div align="center" style="margin-top:3%; margin-left: 5%; margin-right: 5%; margin-bottom: 5%;">

<h1 style="margin-bottom: 5%;">후원 내역</h1> 



<table style="width: 50%; border: 1px solid black;">
<colgroup>
<col width="40%"><col width="30%"><col width="30%">
</colgroup>

<thead>
<tr style="border: 1px solid black;">
<th>&nbsp;&nbsp;&nbsp;ID(후원자)</th>  <th>&nbsp;후원금액</th>   <th>&nbsp;후원일자</th>
</tr>
</thead>

<tbody>


<c:if test="${empty donationList }">
<td colspan="3" align="center">
<font style="font-size: 30pt; color:#A7574A; ">후원 내역이 없습니다 .</font><hr>
</td>
</c:if>

<c:if test="${not empty donationList }">
	<c:forEach items="${donationList }" var="dl">
	<tr>	
		<td><hr>&nbsp;&nbsp;&nbsp;${dl.id }( ${dl.name } ) <hr></td> 
		<td><hr>&nbsp;${dl.donation} 원 <hr></td>
		<td><hr>&nbsp;<fmt:formatDate value="${dl.rdate }" pattern="yyyy . MM . dd"/><hr> </td> 	
	</tr>	
	</c:forEach>
</c:if>
</tbody>

</table>


<br>

<button type="button" class="btn btn-outline-danger" onclick="goDona()"><b>후원하기</b></button>

</div>

<br>
<hr>
<br>
<%--차트 --%>
<div id="container" style="min-width: 310px; max-width: 100%; height: 250px; margin: 0 auto"></div>





<div style="clear:both"><br><br><br><br><br></div>
	<%-- footer --%>
	
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

<script type="text/javascript">
function goDona() {
	//alert("도네 하기 ! ");
	location.href = "donation_main.do";
}

</script>

<%--차트 --%>
<script type="text/javascript">
Highcharts.chart('container', {
	/* var myDonation = $("#myDonation").val(); */
	  chart: {
	    type: 'bar'
	  },
	  title: {
	    text: '${nowDay }까지의 후원금 현황'
	  },
	  xAxis: {
	    categories: ['총 후원금']
	  },
	  yAxis: {
	    min: 0,
	    title: {
	      text: ''
	    }
	  },
	  legend: {
	    reversed: true
	  },
	  plotOptions: {
	    series: {
	      stacking: 'normal'
	    }
	  },
	  
	  series: [{
	    name: '\\ ${totalDonation } 원',
	    data: [${totalDonation }]
	  }]
	  
	});

</script>


</body>

</html>