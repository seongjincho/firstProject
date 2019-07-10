
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 개인  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 갤러리 -->
<script src="https://rawgit.com/jasonenglish/jquery-flex/master/jquery.flex.js"></script>
<!-- <script src="js/jquery.flex.js"></script> -->

<!-- 아이콘 -->    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>





<!-- // 폰트CSS -->
<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">

<title>회원탈퇴</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- <!-- Custom styles for this template -->
<link href="css/business-casual.min.css" rel="stylesheet"> -->
  
<!-- 정보수정 CSS -->
<link href="css/update.css" rel="stylesheet">

<!-- favicon -->
	<link rel="icon" href="images/foodicon.png" sizes="48x48">
	
</head>

<body>

	<c:if test="${login.id == null }">
 		<script type="text/javascript">
        alert("로그인 해 주십시오");
        location.href='login.do';
        </script> 
    </c:if>  


<!-- hearder -->
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<form action="mypage_delete.do" method="post" onsubmit="return checkpwd()" name="deleteform">
<input type="hidden" name="id" value="${login.id }">
<br><br>
	<section class="page-section clearfix">
    <div class="container">
      <div class="intro">
        <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="./img/portfolio/regix1.jpg" alt="">
        <div class="intro-text left-0 text-center bg-faded p-5 rounded" style="background-color: rgba(213,213,213, 0.9); font-family: 'Gugi', cursive;">
          <h2 class="section-heading mb-4" style="font-family: 'Gugi', cursive;">
            <span class="section-heading-upper" style="font-family: 'Gugi', cursive; font-size: 25px;"><label style="color: blue;"><ins>[${login.name }]</ins></label> 님 </span>
            <span class="section-heading-lower" style="font-size: 40px; font-weight: bolder;">정말 탈퇴 하시겠습니까?</span>
          </h2>
          <br>
          <h5 style="font-family: 'Gugi', cursive;">비밀번호를 입력해 주세요</h5>
          <input type="password" class="form-control" placeholder="Password" name="pwd">
          <div class="intro-button mx-auto">
          	<button type="button" class="btn btn-secondary btn-lg" onclick="window.location='mypage_main.do'" style="width: 30%">취소</button>
            &nbsp;&nbsp;&nbsp;
           	<button type="submit" class="btn btn-primary btn-lg" style="width: 30%">탈퇴</button>
          </div>
        </div>
      </div>
    </div>
	</section>
<br><br>
</form>


<script type="text/javascript">
// 비밀번호 미 입력시 경고창 
function checkpwd() {
	
	if(!document.deleteform.pwd.value) {
		alert("비밀번호를 입력하지 않았습니다.");
		return false;
	}
	
}

</script>




	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>


</body>

</html>