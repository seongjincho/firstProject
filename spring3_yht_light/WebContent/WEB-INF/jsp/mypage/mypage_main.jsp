
<%@page import="org.yht.domain.test01.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

<!-- 마이페이지 CSS// -->
<!-- Custom styles for this template -->
<link href="css/mypage.css" rel="stylesheet">

<!-- 개인  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">


<!-- 갤러리 -->
<script src="https://rawgit.com/jasonenglish/jquery-flex/master/jquery.flex.js"></script>
<!-- <script src="js/jquery.flex.js"></script> -->
    
<!-- 아이콘 -->    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:700' rel='stylesheet' type='text/css'>

<!-- 폰트 -->
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>		

<!-- //jquer -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   	
   	<!-- favicon -->
	<link rel="icon" href="images/foodicon.png" sizes="48x48">
	
   	
<title>마이페이지</title>

</head>

	<c:if test="${login.id == null }">
 		<script type="text/javascript">
        alert("로그인 해 주십시오");
        location.href='login.do';
        </script> 
    </c:if>  




<body id="page-top">


	<br>
	
	
	<hr>   <!-- // * 구분 선 -->
<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

	



<!-- Portfolio Grid -->
<div id="portfolio" style="background-color: rgba(237,245,214, 0.6);">
     
    <div class="container"> <!-- // 간격 크게 하고 싶을 경우 이렇게 없애면 됨  -->
      <div class="row">
        <div class="col-lg-12 text-center">
 		  <br><br><br>	
 		  <h2><b><ins><font style="color: blue;">${login.name }</font> 님</ins></b></h2>
          <h2 class="section-heading text-uppercase" style="font-size: 70px"><b>My Page</b></h2>
          <h3 class="section-subheading text-muted" style="font-size: 20px">This is my space.</h3>
          <br>
        </div>
      </div>
      
      <div class="row">
      
        <!--  // 1. 정보수정 -->
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" href="goUpdate.do">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/01-update.jpg" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>정보수정</b></h4>
            <p class="text-muted" style="font-size: 12px">Modify Information</p>
          </div>
        </div>    
      
       <!--  2. 좋아요 -->
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" href="mypage_like.do">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/02-likeList.gif" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>좋아요</b></h4>
            <p class="text-muted" style="font-size: 12px">Like List</p>
          </div>
        </div> 
             
        <!--3.내가 참여한 모임   -->
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" href="mypage_join.do">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/03-togather.png" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>참여중인 모임</b></h4>
            <p class="text-muted" style="font-size: 12px">Party List</p>
          </div>
        </div>    
 
        
       <!--  4. 내가쓴글 -->
<!--         <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" href="#">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/04-dfdf.jpg" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>내가 쓴 글</b></h4>
            <p class="text-muted" style="font-size: 12px">My Post List</p>
          </div>
        </div>  -->
        <!-- 04-togather.png -->
        
        
        
        <!-- // 4. 회원탈퇴 -->
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" href="mypage_delete.do">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/07-fire.gif" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>회원탈퇴</b></h4>
            <p class="text-muted" style="font-size: 12px">Membership Withdrawal</p>
          </div>
        </div>
               
 		
 		

        
<%--                  
      <!--  //  -->
        <div class="col-md-4 col-sm-6 portfolio-item"> 
        <form action="My_write_controller.do" method="post" id="frm">  
        <input type="hidden" value="<%=userid %>" name="id">   
          <a class="portfolio-link" onclick="document.getElementById('frm').submit();">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="images/06-full.jpg" alt="" style="height: 210px; width: 400px;">
          </a>
          <div class="portfolio-caption">
            <h4><b>내가 쓴 글</b></h4>
            <p class="text-muted" style="font-size: 12px">I Wrote</p>
          </div>
        </form>
        </div>  --%>

 
	<!--  관리자(admin) 로그인 -->
	<c:if test="${login.auth == 3}">
	
	
		<!--  // 관리자 : 7.회원리스트 -->
        <div class="col-md-4 col-sm-6 portfolio-item">
        <!-- // 관리자 form -->
          <form action="#" method="post" name="formname">
          <a class="portfolio-link" href="javascript:formname.submit();" >
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
           	<img class="img-fluid" src="images/02-thumbnail.jpg" alt="" style="height: 210px; width: 400px;">
         	
          </a>
          <div class="portfolio-caption">
            <h4><b style="color: #FE9A2E">회원관리</b></h4>
            <p class="text-muted" style="font-size: 12px">Member List</p>
          </div>
          </form>
        </div>
        </c:if>
          
      </div>
    </div>
	<br><br>
</div>


<!--  SNS Icons 
<div class="row">
		<div class="col one">
			<a href="https://ko-kr.facebook.com/" class="btn btn-facebook icon-only"><i class="fa fa-facebook"></i></a>	
			<a href="https://www.youtube.com/?gl=KR" class="btn btn-you-tube icon-only"><i class="fa fa-youtube"></i></a>	
			<a href="https://www.instagram.com/?hl=ko" class="btn btn-instagram icon-only"><i class="fa fa-instagram"></i></a>	
		</div>
</div> -->

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

