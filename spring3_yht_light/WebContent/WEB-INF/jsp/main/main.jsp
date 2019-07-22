<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Food sharing</title>


<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


</head>
<body>

      <!-- carousel -->
   <div class="bd-example" style="width: 100%; height:1%; margin-bottom: 10%;" align="center">
      <div id="carouselExampleCaptions" class="carousel slide"
         data-ride="carousel" data-interval="3000">
         <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0"
               class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
         </ol>
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="images/bgi1.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="h5main" align="left">1</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img src="images/bgi2.png" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5  class="h5main" align="left">2</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img src="images/bgi3.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="h5main" align="left">3</h5>
               </div>
            </div>
         </div>
         <a class="carousel-control-prev" href="#carouselExampleCaptions"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carouselExampleCaptions"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
   </div>


<div class="clear"></div>
<div class="space"></div>






게시판 댓글 css
메인 페이지 입니다   (like_cnt , read_cnt 로  게시물 띄우기 )
<div align="center">

<div>댓글</div>
<div>댓글 1</div>
<div>댓글2</div>


</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

</body>
</html>