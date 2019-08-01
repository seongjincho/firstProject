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
<th><h1>참여자 정보</h1><hr><br><br></th>
</tr>

<tr>
<c:if test="${not empty food_joinlist }">
<c:forEach items="${food_joinlist }" var="fj" varStatus="vs">
<c:if test="${vs.count%2 == 0 }">
</tr>
<tr>
</c:if>
<td><h2>${vs.count }&nbsp;/&nbsp;<b><a href="#none" onclick="showMemberInfo( '${fj.id }' )">${fj.id }</a></b></h2> 


<div id="showMember${fj.id }">

</div>



<hr><br>
<%-- ${fj.id }는 문자열이라 ''필요  --%>
</td>


</tr>
</c:forEach>
</c:if>



</table>





</div>
<br><br>
<div style="clear:both"></div>
<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>


<script type="text/javascript">
function showMemberInfo(id) {
	
	//alert("참여자정보");
	//alert(id);
	
	
	$.ajax({
		url:"showMemberInfo.do",
		type: "post",
		data:{id:id},
		success:function(data){  // 참여자  아이디, 이름 , 전화번호 가져오기 
			
			//alert("참여자 정보 획득 성공");
		
			var mem = data.list;
			var str = "";
/* 			str += "<br><h3>참여자 정보</h3>";
			str += "<p>아이디: " + mem.id + "</p>";
			str += "<p>이름: " + mem.name + "</p>";
			str += "<p>이메일: " + mem.email + "</p>";
			str += "<p>전화번호: " + mem.phone + "</p>"; */
			str += "      -아이디:  " + mem.id + "\n";
			str += "      -이름:  " + mem.name + "\n";
			str += "      -이메일:  " + mem.email + "\n";
			str += "      -전화번호:  " + mem.phone + "\n";
			
			
			alert(str);
			//$("#showMember" + id).append(str);
		},
		error:function(r, s, err){
			
			alert("error");
			
		}
		
	
	});
	
}

</script>

</body>
</html>