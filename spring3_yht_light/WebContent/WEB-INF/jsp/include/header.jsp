<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Food sharing</title>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	    
	    <!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-144827539-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-144827539-1');
		</script>
  
      <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style type="text/css">
nav{
	z-index: 5 !important;	
}

/* 로그인 로그아웃버튼 */
.loginButton{
  /* background-color: white;  */
  /* color: black;  */
  /* border: 2px solid #ffd426; 
  #e04040*/
 /*  background-color: #f0001e; */
  color: white;
  /* border: 2px solid #f0001e; */
  background-color: #e04040;
  border: 2px solid #e04040;
  font-size: 15px;
  padding: 1px 5px;
  text-align: center;
  text-decoration: none;
 font-family: 'Nanum Gothic', sans-serif;
}

.loginButton:hover {
 /*  background-color: #ffd426; */
/*   background-color: #f0001e;
  color: white; */
    background-color: white;
/*   	color: #f0001e; */
  	color: #e04040;
}


.logoutButton{
/*   background-color: white; 
  color: black;  */
  /* border: 2px solid #ffd426; */
/*   background-color: #f0001e;
  color: white;
  border: 2px solid #f0001e; */
  background-color: #e04040;
  color: white;
  border: 2px solid #e04040;
  font-size: 18px;
  padding: 1px 5px;
  text-align: center;
  text-decoration: none;
 /* font-family: 'Nanum Gothic', sans-serif; */
 font-family: '맑은고딕', malgun gothic,'돋움',Dotum,'Apple SD Gothic Neo',Helvetica,sans-serif;
}

.logoutButton:hover {
  /* background-color: #ffd426; */
/*   background-color: #f0001e;
  color: white; */
    background-color: white;
  	/* color: #f0001e; */
  	color: #e04040;
}

.card{
/* background-color: #2d2d2d; */
   /* background-color: #f0001e; */
   background-color: #e04040;
}
.card-header{
color: #f4cd30;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	// navbar 상단고정
	var pos = $('nav').offset().top;
	
	 $(window).on('scroll',function(){
		 var scroll = $(this).scrollTop();
		 pos = scroll; 
			 $('nav').offset({top:pos});
	 });
	
});
</script>
<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
</head>
<body>

	
<!-- 상단바  -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e04040; width: 100%;" >
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 
	
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left: 5%;">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="main.do">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="noticeBbsList.do" tabindex="-1" aria-disabled="true">Notice</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="foodBbsList.do">Food Sharing</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Mypage
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="mypage_main.do">마이페이지 홈</a>
          <c:if test="${login.id != null }">
          <a class="dropdown-item" href="goUpdate.do">정보수정</a>
          <a class="dropdown-item" href="mypage_like.do">좋아요</a>
          <a class="dropdown-item" href="mypage_join.do">참여중인 모임</a>
     
          <div class="dropdown-divider"></div>
          <c:if test="${login.auth >= 3 }">
          <a class="dropdown-item" href="mypage_admin.do">회원관리</a>
          </c:if>
          <a class="dropdown-item" href="mypage_delete.do">회원탈퇴</a>
          </c:if>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Company
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">         
          <a class="dropdown-item" href="customerService.do">회사소개</a>
          <a class="dropdown-item" href="customerService.do#customerService">고객센터</a>
                                 
        </div> 
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
    
       <c:if test="${login.id != null}">
      	${login.id }님 &nbsp;&nbsp;
      	<input type="button" value="로그아웃" class="loginButton" onclick="location.href='logout.do'">
	  </c:if> 
	  
	  <c:if test="${login.id==null}">
      	<input type="button" value="로그인"  class="logoutButton" onclick="location.href='login.do'">
 	  	<input type="button" value="회원가입"  class="logoutButton" onclick="location.href='regi.do'">
	  
	  </c:if>	
    </form>
    
  </div>
</nav>

</body>
</html>