<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.customers{background: url(images/customer.jpg) no-repeat top center; width: 100%;height: 450px;}
.h1title{text-align:center; letter-spacing:1.2rem; color:white; font-size:60px; padding-top:245px; font-weight:700;
    font-family: "CorpidC1s-Regular"!important;}
.customers2{background: url(images/bg_company_visual.jpg) no-repeat top center; width: 100%;height: 450px;}    
    
/*hero*/
.hero {background:url(images/bg_company_vision.jpg) no-repeat top center; width:100%; height:595px;}
.hero .text_wrap {font-size:0; overflow:hidden; text-align:center;}
.hero .text_wrap .title_st3 {padding-top:150px;}
.hero .text_wrap .title_st3 span {display:block; font-size:20px; margin-bottom:5px; font-family:"NanumSquareR"}
.hero .text_wrap .text1 {font-size:24px; color:#d61f26; margin-top:60px;}
.hero .text_wrap .text1 span {display:inline-block; vertical-align:top; font-size:0;}
.hero .text_wrap .text2 {font-size:18px; line-height:28px; margin-top:13px;}
.hero .text_wrap .text2 span {font-family:"NanumSquareR"; color:#d61f26; border-bottom:1px solid #d61f26;}
.hero .text_wrap ul {font-size:0;}
.hero .text_wrap ul li {width:100%; display:inline-block; margin-right:25px; padding-top:154px; text-align:center; width:370px; vertical-align:top;}
.hero .text_wrap ul li:last-child {margin-right:0;}
.hero .text_wrap ul li.vision2 {width:410px;}
.hero .text_wrap ul li > span {display:block; margin:27px 0 15px 0;}
.hero .text_wrap ul li p.title {font-size:26px; color:#333;}
.hero .text_wrap ul li.vision2 p.title {font-family:"NanumSquareB"; font-size:22px;}
.hero .text_wrap ul li p.text {font-size:16px; font-family:"NanumSquareL"; color:#333; line-height:26px; letter-spacing:-0.02rem;}
.hero .text_wrap ul li p.text span {color:#d61f26; font-family:"NanumSquareB"; border-bottom:1px solid #d61f26;}    
    

</style>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e95843617e74d0c3683cc8d8a73f71af&libraries=services,clusterer,drawing"></script>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<title>Insert title here</title>
</head>
<body>

<div class="customers" align="center">
<h1 class="h1title">Food Sharing</h1>
</div>	 


<div class="section hero" id="hero">
    <div class="content">
        <div class="text_wrap">
            <p class="title_st3">
                <span>국내 푸드쉐어링의 선두주자</span>
                Food Sharing!
            </p>
            <p class="text1"><span><img src="images/text_marks3.png" alt="" /></span>푸드쉐어링 시장을 개척합니다<span><img src="images/text_marks4.png" alt="" /></span></p>
            <p class="text2">마곡나루역에 본사를 둔 <a href="#none"><span>Food Sharing</span></a>는  현재 글로벌 **개 국가에서 **개 브랜드를 운영하며<br/>
                글로벌 푸드테크 산업을 이끌어 나가고 있습니다. 창업 *년 만인 지난 ****년도에는 그해 상장한 유럽 IT기업 중<br/>
                가장 큰 규모로 **** 증권거래소에 성공적으로 이름을 올린 스타트업 유니콘입니다.</p>
        </div>
    </div>
</div>

	


<div id="map"  style="margin-left:25%; margin-top:3%; margin-bottom:3%; border:1px solid #e04040;  width:750px;height:400px;"></div>

<hr>



<div class="customers2" id="customerService"  align="center">
<h1 class="h1title">Customer Service</h1>
<hr>
</div>	 




<div align="center" class="card text-white bg-danger mb-3" style="max-width: 18rem; margin-left:40%; margin-top:3%; margin-bottom:10%; border:2px solid #e04040; width:750px;height:250px;">
  <div class="card-header">Customer Service</div>
  <div class="card-body">
    <h5 class="card-title">Food Sharing</h5>

    <p class="card-text">서울 강서구 마곡동 367-6 </p>
    <p class="card-text">TEL 02-1577-****</p>
    <p class="card-text">09 : 00 AM - 06 : 00 PM </p>
  </div>
</div> 


<%-- footer --%>
<div>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</div>



<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.529042, 126.963974), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울 강서구 마곡동 367-6', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">Food Sharing</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    

map.setZoomable(false);
//map.setDraggable(false); 
</script>


<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5d3a48a59b94cd38bbe95411/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->


</body>
</html>