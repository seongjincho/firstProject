<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
nav{
	z-index: 5 !important;	
}

/* 로그인 로그아웃버튼 */
.loginButton{
  background-color: white; 
  color: black; 
  border: 2px solid #ffd426;
  font-size: 15px;
  padding: 1px 5px;
  text-align: center;
  text-decoration: none;
 font-family: 'Nanum Gothic', sans-serif;
}

.loginButton:hover {
  background-color: #ffd426;
  color: white;
}


.logoutButton{
  background-color: white; 
  color: black; 
  border: 2px solid #ffd426;
  font-size: 15px;
  padding: 1px 5px;
  text-align: center;
  text-decoration: none;
 font-family: 'Nanum Gothic', sans-serif;
}

.logoutButton:hover {
  background-color: #ffd426;
  color: white;
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
</head>
<body>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
	
<!-- 상단바  -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ffc107">
  <a href="#"><img id="newicon" src="images/foodicon.png" width="70px" height="70px"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="main.do">Home <span class="sr-only">(current)</span></a>
      </li>
<!--       <li class="nav-item">
        <a class="nav-link" href="bbs_rec_list.do">Receipe</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="#">Sharing</a>
      </li>
<!--        <li class="nav-item">
        <a class="nav-link" href="mall_getBbsPagingList.do" tabindex="-1" aria-disabled="true">Mall</a>
      </li> -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Mypage
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">마이페이지 홈</a>
          <c:if test="${login.id != null }">
          <a class="dropdown-item" href="#">비번변경</a>
          <a class="dropdown-item" href="#">정보수정</a>
        <!--   <a class="dropdown-item" href="My_write_controller.do">내가쓴글</a> -->
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="">회원탈퇴</a>
          </c:if>
        </div>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
    
<%--       <c:if test="${login.id != null}">
      	${login.id }님 &nbsp;&nbsp;
      	point [<b style="color:deepskyblue;">${login.point }</b>]P&nbsp;&nbsp;
      	<input type="button" value="로그아웃" class="loginButton" onclick="">
	  </c:if> --%>
	  
	  <c:if test="${login.id==null}">
      	<input type="button" value="로그인"  class="logoutButton" onclick="location.href='login.do'">
 	  	<input type="button" value="회원가입"  class="logoutButton" onclick="location.href='regi.do'">
	  
	  </c:if>	
    </form>
    
  </div>
</nav>
</body>
</html>