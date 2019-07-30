<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/v1-front.css"/>
<link rel="stylesheet" href="css/_common.css"/>

<c:if test="${(empty login) or (login.id eq '') }">
	<%
		session.invalidate();	// 세션이 보유한 모든 속성 제거
	%>
	<script>
	alert("로그인 해 주십시오");
	location.href = "login.do";
	</script>
</c:if>

<!-- hearder -->
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

	
<div id="login">
	<div class="container_c">
		<div class="head">
			<p class="noto">비밀번호 확인</p>
		</div>
		<hr><br><br>
		<div class="body">
			<form action="goUpdateAF.do" method="post" id="_frmForm" name="frmForm">
				<input type="hidden" name="id" value="${login.id }">
				<input type="password" name="pwd" id="_pwd" data-msg="비밀번호를" placeholder="비밀번호">
			</form>
			<br><br><br>
			<div class="button_r">
				<button type="button" id="_cancle" class="btn_s_gray btn_205">취소</button>
				<button type="button" id="_btn" class="btn_s_blue btn_205">확인</button>
			</div>
		</div>
	</div>
</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

<script>
$('#_btn').click(function() {
	var pwd = $('#_pwd').val();
	if(pwd == "") {
		alert($('#_pwd').attr("data-msg") + " 입력해주세요");
		$('#_pwd').focus();
		return false;
	} else {
		//$('#_frmForm').attr("action", "myInfoGoAf.do").submit();
		$('#_frmForm').submit();
	}
});

$('#_cancle').click(function() {
	location.href = "login.do";
});
</script>