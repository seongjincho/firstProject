<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
</head>
<body>

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<br><br>
<div align="center">
<h1>관리자 페이지</h1>
<!-- ${mem} -->


<!-- <th>회원</th> <th>이름</th> <th>Email</th> 
<th>주소</th> <th>전화번호</th> <th>회원권한</th> 
<th>이메일인증</th> <th>탈퇴여부</th> <th>메뉴</th>

 -->
 <form id="updateFrm" name="updateFrm" action="memberUpdateAf.do" method="post" style="margin-top: 5%;">
 
<table>
<tr>
<th>회원아이디 &nbsp;&nbsp;</th>
<th><input type="text" id="id" name="id" value="${mem.id }" readonly="readonly"></th>
</tr> 

<tr>
<th>이름 &nbsp;&nbsp;</th>
<th><input type="text" id="name" name="name" value="${mem.name }" readonly="readonly"></th>
</tr>

<tr>
<th>비밀번호 &nbsp;&nbsp;</th>
<th><input type="password" id="pwd" name="pwd" value="" ></th>
</tr>


<tr>
<th>회원권한 &nbsp;&nbsp;</th>
<th>
	<select id="auth" name="auth">
	<option value="" selected="selected">선택</option>
	<option value="1">일반회원</option>
	<option value="3">관리자</option>
	</select>
</th>
</tr>

<tr>
<th>이메일인증 &nbsp;&nbsp;</th>
<th>
	<select id="authstatus" name="authstatus">
	<option value="" selected="selected">선택</option>
	<option value="0">미인증</option>
	<option value="1">인증</option>
	</select>
</th>
</tr>

<tr>
<th>회원 상태 &nbsp;&nbsp;</th>
<th>
	<select id="del" name="del">
	<option value="" selected="selected">선택</option>
	<option value="0">정상</option>
	<option value="1">탈퇴</option>
	</select>
</th>
</tr>

</table>
<br><br>
<input type="button" onclick="goUpdate()" value="회원 수정 요청">
&nbsp;&nbsp;
<input type="button" onclick="goBack()" value="목록">
</form>




</div>
<br><br>

<%-- 
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/> --%>


<script type="text/javascript">

function goUpdate() {
	//alert("회원관리 수정 진입");
	
	var auth = $("#auth").val(); 
	var authstatus = $("#authstatus").val();
	var del = $("#del").val();
	var pwd = $("#pwd").val();
	
	//alert(auth + " " + authstatus + " " + del);
	
	if(auth == ""){
		
		alert("회원 권한을 선택해주세요");
		$("#auth").focus();
		return false;
		
	}else if(authstatus == ""){
		
		alert("이메일 인증을 선택해주세요");
		$("#authstatus").focus();
		return false;
		
	}else if(del == ""){
		
		alert("회원 상태 선택해주세요");
		$("#del").focus();
		return false;
	}else if(pwd == ""){
		var pwd = "${mem.pwd }";
		$("#pwd").val(pwd);
		
	}
	
	//alert(pwd);
	
//	$("#updateFrm").submit();

	  var updateData = $("form[name=updateFrm]").serialize();
	   // alert(updateData);
	  
	    $.ajax({
	        type : 'post',
	        url : 'memberUpdateAf.do',
	        data : updateData,
			success:function(data){
				
				if(data.trim() == "OK"){
					
					alert("관리자 멤버  수정 성공");
					opener.parent.location.reload();
					window.close();
					
				}else {
					
					alert("관리자 멤버  수정 실패");
					
				}
				
			},
			error:function(r, s, err){
				alert("error");
			}
				
		}); 
	 
	
}

function goBack() {
	//alert("목록으로 !");
	opener.parent.location.reload();
	window.close();
}

</script>



</body>
</html>