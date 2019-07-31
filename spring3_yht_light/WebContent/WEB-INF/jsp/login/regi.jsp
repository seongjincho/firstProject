<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="css/_common.css"/>
<link rel="stylesheet" href="css/v1-front.css">

<%--reCaptcha --%>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

<style>
.btn_100_41{
	width: 100px;
	height: 41px;
	font-size: 14px;
}
</style>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<div id="info">
	<div class="container_c active">
		<div class="head">
			<p class="noto">회원가입</p> <br>
		</div>
		<div class="body active">
			<form method="post" id="_frmForm" name="frmForm">
				<div class="insert">
					<div class="id">
						<input type="text" name="id" id="_uid" data-msg="아이디를" placeholder="아이디">
						<p class="frt" onclick="checkId()">중복확인</p>
					</div>
					<div class="pwd">
						<div>
							<input type="password" name="pwd" id="_pwd" class="first"
								data-msg="패스워드를" autocomplete="off" placeholder="비밀번호" maxlength="15">
							<p></p>
						</div>
						<div>
							<input type="password" id="_pwdchk" class="second"
								data-msg="패스워드 확인을" placeholder="비밀번호 확인 " disabled="true" maxlength="15">
							<p></p>
						</div>
					</div>
					<div class="name">
						<input type="text" name="name" id="_name" data-msg="이름을" maxlength="20" placeholder="이름">
					</div>
					<div class="phone">
						<input type="text" name="phone" id="_phone" data-msg="핸드폰을" placeholder="핸드폰">
						<p onclick="checkPhone()" class="frt">중복확인</p>
					</div>
					<div class="email">
						<input type="hidden" name="email" id="_email">
						<input type="text" id="_email1" name="email1" placeholder="이메일">
						@ <input type="text" id="_email2" name="email2">
						<select id="_selemail">
							<option value="" selected>직접입력</option>
							<option value="yht.co.kr">yht.co.kr</option>	
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</select> 
						<p onclick="checkEmail()" class="frt" id="_auth">중복확인</p>
					</div>
					<div id="addressDiv" class="addr" style="margin-bottom: 10%;">
						<input type="text" id="sample2_postcode" placeholder="우편번호" style="width: 295px; margin: 15px 0 9px 0px;">
						<input type="button" class="btn_s_gray btn_100_41" onclick="sample2_execDaumPostcode()" value="주소검색" size="10" style="padding-left: 0 !important;"> <br>
						<input type="text" name="address1" id="sample2_address" placeholder="주소" size="50" data-msg="주소를" style="width: 295px; margin: 0 0 9px 0px;">
						<input type="text" name="address2" id="sample2_detailAddress" placeholder="상세주소" size="25" data-msg="상세주소를">
					 	<input type="hidden" id="sample2_extraAddress" placeholder="참고항목" size="20">
					</div>
				</div>
				
			</form>
			<div class="button_r" style="margin-top: 10%;">
				<button class="joinButton btn_s_gray btn_205" onclick="location.href='main.do'">
					메인화면
				</button>
				<button class="joinButton btn_s_blue btn_205" id="_btnRegi">
					회원가입
				</button>
			</div>
		</div>		
		<%--reCaptcha --%>
		<div class="g-recaptcha" data-sitekey="6LdGebAUAAAAADkG-bxUYUW5qEvdIcelr78sXTe6"></div>
	</div>
</div>

<script>
var checkIdGb = ""
var checkPhoneGb = ""
var checkPw1Gb = ""
var checkPw2Gb = ""
var checkEmailGb = ""
	
$('#_btnRegi').click(function() {
	var id = $("input[name=id]").val()
	
	if(id == ""){
		checkIdGb = "Y"
	}
	
	if(checkIdGb != "Y"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	} else if(checkPw1Gb != "Y"){
		alert("비밀번호를 다시 입력해주세요.");
		return false;
	} else if(checkPw2Gb != "Y"){
		alert("비밀번호를 다시 입력해주세요.");
		return false;
	} else if($("input[name=name]").val().length < 1){
		alert("이름을 입력해주세요.");
		return false;
	} else if(checkPhoneGb != "Y"){
		alert("핸드폰 중복체크를 해주세요.");
		return false;
	} else if(checkEmailGb != "Y"){
		alert("이메일 중복체크를 해주세요.");
		return false;
	}  else if($('#sample2_address').val() == ""){
		alert($('#sample2_address').attr("data-msg") + " 입력해주세요");
		return false;
	}else {
		
		var recaptcha = $("#g-recaptcha-response").val();
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
		                    $('#_frmForm').attr("action", "regiAf.do").submit();
		                	alert("이메일이 발송되었습니다.");
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
			
		
	    }); 
		
	}
		
	
	
/* 	$('#_frmForm').attr("action", "regiAf.do").submit();
	alert("이메일이 발송되었습니다."); */
	
});

/* 비밀번호 유효성 판단 */
$(".first").keyup(function(){
	var pw = $(this).val();
	var pw2 = $(".second").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	var str_space = /\s/;
	
	if(pw.length < 6 || 15 < pw.length){
		$(".pwd div:nth-child(1)>p").text("6자리 ~ 15자리 이내로 입력해주세요.");
		checkPw1Gb = 'N'
	} else if(str_space.exec(pw)){
		$(".pwd div:nth-child(1)>p").text("비밀번호는 공백없이 입력해주세요.");
		checkPw1Gb = 'N'
	} else if(num < 0 || eng < 0 || spe < 0){
		$(".pwd div:nth-child(1)>p").text("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		checkPw1Gb = 'N'
	} else{
		$(".pwd div:nth-child(1)>p").text("사용 가능한 비밀번호입니다.");
		$(".second").attr("disabled", false);
		$(".pwd div:nth-child(2)").css("background-color", "white");
		checkPw1Gb = 'Y'
	}
	
	if((pw2.length > 0) && (pw != pw2)){
		$(".pwd div:nth-child(2)>p").text("비밀번호가 서로 다릅니다.");
		checkPw2Gb = 'N'
	} else if((pw2.length > 0) && (pw = pw2)){
		$(".pwd div:nth-child(2)>p").text("비밀번호가 같습니다.");
		checkPw2Gb = 'Y'
	}
});

/* 비밀번호 일치 확인  */
$(".second").keyup(function(){
	var pw1 = $(".first").val()
	var pw2 = $(this).val()
	
	if(pw1 == pw2){
		$(".pwd div:nth-child(2)>p").text("비밀번호가 같습니다.");
		checkPw2Gb = 'Y'
	} else{
		$(".pwd div:nth-child(2)>p").text("비밀번호가 서로 다릅니다.");
		checkPw2Gb = 'N'
	}
});

function checkId(){
	
	var id = $('#_uid').val();
	var str_space = /\s/;
	
	//alert("아이디체크");
	
	if(id.length < 1){
		alert("아이디를 입력해 주세요.");
		$("#_uid").focus();
		return false;
	} else if(str_space.exec(id)){
		alert("아이디는 공백없이 입력해주세요.");
		$("#_uid").val("");
		$("#_uid").focus();
		return false;
	}
	
	// var id = $("input[name=id]").val();
	
	$.ajax({
		url: "idcheck.do",
		type: "post",
		data: {"id" : id },
		success:function(data){
			
			//alert("아이디체크 ajx 진입!");
			if($.trim(data) == "OK"){
				
				alert("사용 가능한 아이디입니다.");
				checkIdGb = "Y"
				
			} else{
				
				alert("이미 등록된 아이디입니다.");
				$('#_uid').val("");
				
			}
		},
		error:function(r, s, err){
			
			alert("error");
			
		}
	});
}

// 이메일 확인
function checkEmail() {
	
	//alert("이메일 체크!");
	
	var email = $('#_email1').val().trim() + "@" + $('#_email2').val().trim();
	$('#_email').val(email);
	
	if(email.trim() == "@" || $("#_email1").val() == "") {
		
		alert("이메일을 입력해주세요");
		$('#_email1').focus();
		
	} else {
		$.ajax({
			url:"emailcheck.do",
			type:"post",
			data: {"email" : email},
			success:function(data) {
				
				//alert("이메일 체크 ajax 진입!");
				
				if($.trim(data) == "OK"){
					
					alert("사용 가능한 이메일입니다.");
					checkEmailGb = "Y"
					
				} else{
					
					alert("이미 등록된 이메일입니다.");
					$('#_email1').val("");
					
				}
			},
			error:function(r, s, err) {
				alert("error");
			}
		});
	}
}

// 핸드폰 확인
function checkPhone(){
	
	//alert("핸드폰 확인");
	
	var phoneNo1 = $("#_phone").val();
	if($.isNumeric(phoneNo1)){
	} else{
		alert("핸드폰은 숫자를 입력해주세요");
		return false;
	}

	$.ajax({
		url:"phonecheck.do",
		type:"post",
		data: {"phone" : phoneNo1 },
		success:function(data) {
			
			//alert("핸드폰 체크 ajax 진입!");
			
			if($.trim(data) == "OK"){
				
				alert("사용 가능한 핸드폰입니다.");
				checkPhoneGb = "Y"
				
			} else{
				
				alert("이미 등록된 핸드폰입니다.");
				$('#_phone').val("");
				
			}
		},
		error:function(r, s, err) {
			alert("error");
		}
	});
}

// 메일 select
$('#_selemail').change(function() {
	checkEmailGb = "N"
	
	$('#_selemail option:selected').each(function() {
		if($(this).val() == "") {	// 직접 입력인 경우
			$('#_email2').val("");
			$('#_email2').attr("disabled", false);
		} else {
			$('#_email2').val($(this).text());	// 선택값 입력
			$('#_email2').attr("disabled", true);	// 비활성화
		}
	});
});

/* 아이디 바꾸면 다시 중복확인 하도록 */
$("input[name=id]").change(function(){
	checkIdGb = "N"
});
$("input[name=email1]").change(function(){
	checkEmailGb = "N"
});
$("input[name=email2]").change(function(){
	checkEmailGb = "N"
});
$("input[name=phone]").change(function(){
	checkPhoneGb = "N"
});
</script>

<!-- 다음 주소 API -->
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>