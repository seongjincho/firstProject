<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%--reCaptcha --%>
<!-- <script src="https://www.google.com/recaptcha/api.js" async defer></script> -->


<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">



<link rel="stylesheet" href="css/v1-front.css"/>
<link rel="stylesheet" href="css/_common.css"/> 
<%-- <script type="text/javascript" src="<c:url value='/js/yht_common.js' />"> </script> --%>

<div id="login" >
	<div class="container_c">
		<div class="head">
			<p class="noto">로그인</p>
		</div>
		<div class="body">
			<div class="member">
				<form action="loginAf.do" name="frmForm" id="_frmForm" method="post">
					<div class="enter">
						<input type="text" id="_uid" name="id" class="id" data-msg="ID를" placeholder="아이디" autocomplete="off">
						<p></p>
						<input type="password" id="_pwd" name="pwd" data-msg="패스워드를" placeholder="비밀번호" autocomplete="off">
						<p></p>
					</div>
					<div class="all">
						<p onclick="checkAll(this)" style="position: relative;">
							<img src="./images/check.png" style="position: absolute; right: 0px; top: 0px;">
						</p> 
							<input type="checkbox" id="idSaveCheck" style="display: none;" onclick="checkAll(this)">
						<p onclick="checkAll(this)">
							아이디 저장
						</p>
						<ul>
							<li>
								<a href="#none" id="_btnRegi" title="회원가입">회원가입</a>
								&nbsp; | &nbsp;
							</li>
							<li>
								<a href="#none" id="_findId">아이디 , 비밀번호 찾기</a>
							</li>
							<!-- <li>
								<a href="#none" id="_findPwd" title="비밀번호찾기">비밀번호 찾기</a>
							</li> -->
						</ul>
					</div>
				</form>
				<br><br>
				<button class="joinButton btn_s_blue btn_240" id="_btnLogin">
					로그인
				</button>
				
				<button class="joinButton btn_s_gray btn_240" onclick="goHome()" >홈으로</button>

			</div>
		</div>
		
		<%--reCaptcha --%>
	    <!-- <div class="g-recaptcha" data-sitekey="6LdGebAUAAAAADkG-bxUYUW5qEvdIcelr78sXTe6"></div> -->
    	<!-- <button type="button" class="btn_s_blue" onclick="goCaptcha()">제출</button> -->



		
	</div>
</div>

<script>
/*  아이디 저장 */
var allChked = "N"
function checkAll(obj) {
	var chk = $(obj).prop("checked");
	
	if(allChked == "N") {
		$(".all img").css("top", "-20px");
		$("input[type=checkbox]").prop("checked", true);
		allChked = "Y";
		var userInputId = $("input[name='id']").val();
		setCookie("userInputId", userInputId, 7);
	} else {
		$(".all img").css("top", "0");
		$("input[type=checkbox]").prop("checked", false);
		allChked = "N";
		deleteCookie("userInputId");
	}
}
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감
	var userInputId = getCookie("userInputId");
	$("input[name='id']").val(userInputId);
	
	if($("input[name='id']").val() != "") {	
		// 그전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$("#idSaveCheck").attr("checked", true);	// ID 저장하기를 체크 상태로 두기
		$(".all img").css("top", "-20px");
		allChked = "Y";
	}
	
	$("#idSaveCheck").change(function() {
		// ID 저장하기 체크했을 때
		if($("#idSaveCheck").is(":checked")){
			var userInputId = $("input[name='id']").val();
			setCookie("userInputId", userInputId, 7);	// 7일 동안 쿠키 보관	
		} else {	// ID 저장하기 체크 해제 시,
			deleteCookie("userInputId");
		}
	});
	
	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장
	$("input[name='id']").keyup(function(){
		// ID 입력 칸에 ID를 입력할 때
		if($("#idSaveCheck").is(":checked")){
			// ID 저장하기를 체크한 상태라면
			var userInputId = $("input[name='id']").val();
			setCookie("userInputId", userInputId, 7);	// 7일 동안 쿠키 보관
		}
	});
});

function setCookie(cookieName, value, exdays){
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null)? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() -1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName){
	cookieName = cookieName + "=";
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}


</script>

<script>
$('#_btnLogin').click(function() {
	if($('#_uid').val() == "") {
		
		alert($('#_uid').attr("data-msg") + " 입력해 주세요");
		$('#_uid').focus();
		
	} else if($('#_pwd').val() == "") {
		
		alert($('#_pwd').attr("data-msg") + " 입력해 주세요");
		$('#_pwd').focus();
		
	} else {
		
/* 		var recaptcha = $("#g-recaptcha-response").val();
		//alert(recaptcha);
		
	    $.ajax({
	        url: "VerifyRecaptcha.do",
	        type: "post",
	        data: {recaptcha:recaptcha },
	        success: function(data) {
	        	
		        //alert(data);
		        
		            switch (data) {
		                case 0:
		                    alert("자동 로그인 방지 봇 통과");
		                    $('#_frmForm').attr("target", "_self").submit();
		                    break;
		
		                case 1:
		                    alert("자동 로그인 방지 봇을 확인 한뒤 진행 해 주세요.");
		                    break;
		
		                default:
		                    alert("자동 로그인 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
		                    break;
		            }
	        },
			error:function(r, s, err){
				
				alert("error");
				
			}
			
		
	    }); */
		
		$('#_frmForm').attr("target", "_self").submit();
		
		
	}
});
$('#_uid').keypress(function(event){
	if(event.which == "13"){
		event.preventDefault();
		$('#_pwd').focus();
	}
});
$('#_pwd').keypress(function(event){
	if(event.which == "13"){
		event.preventDefault();
		$('#_btnLogin').click();
	}
});

$('#_btnRegi').click(function() {
	location.href = "regi.do";
});

$('#_findId').click(function() {
	location.href = "findIdAndPwd.do";
});

function goHome() {
	//alert("홈으로");
	location.href = "main.do";
}



</script>