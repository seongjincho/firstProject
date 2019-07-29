<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
.carousel-item {

    height: 700px; 

}

.noto1{
	font-family: 'Noto Sans KR';
	letter-spacing: -1px;
	font-size: 100pt;
	
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}



</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Food sharing</title>




<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


</head>
<body>
<!-- <hr> -->
      <!-- carousel -->
   <div class="bd-example"  align="center">
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
               <img width="100%" height="100%" src="images/bgi1.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="noto1" align="left" style="padding-bottom: 25%;">Food Sharing</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img width="100%" height="100%" src="images/bgi2.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="noto1" align="left">홀로  한끼를 <br>해결해야 할 때</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img width="100%" height="100%" src="images/bgi3.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="noto1" align="left" style="padding-bottom: 5%;">Food Sharing해서 먹자</h5>
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
<!-- <hr> -->

<%-- footer --%>
<div>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</div>
</body>
</html>