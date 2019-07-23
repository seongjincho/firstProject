<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>   
<title>Food sharing</title>

<!-- foodDetail.css -->
<link rel="stylesheet" type="text/css" href="css/foodDetail.css">

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e95843617e74d0c3683cc8d8a73f71af&libraries=services,clusterer,drawing"></script>
<br><br><br><br><br><br>   

<div>
<h1 align="center">제목:${foodList.title }</h1> 
</div>
<c:if test="${login.id == foodList.id || login.auth == 3 }">
<div align="right" style="margin-right: 9%;">
<button class="btn_s_blue btn_100">수정</button>
<button class="btn_s_gray btn_100">삭제</button>
</div>
</c:if>
<div align="left" id="headLine" style="margin-right: 50%;">
	
	<input type="hidden" id="id" name="id" value="${login.id }">	
      <c:if test="${empty likeList }">
       <p class="icon wish_icon empty" >
          <img src="images/icon_wish.svg">
       </p>
       </c:if>                      
            
       <c:if test="${not empty likeList }">                                                                              
       <p class="icon wish_icon exist">                           
          <img src="images/icon_wish.svg">      
       </p>
        </c:if>

</div>
<br><br>
				
<div style="margin-left: 10%" align="center" id="mainImgConatiner">
${foodList.fullname }
</div>
<%-- <h2 align="center">제목:${foodList.title }</h2> --%>



<div id="main" align="center">
<div id="main_container" style="width: 85%;">
<br/><br/>
<hr/>
<div>


<table>
<colgroup>
	<col width="50%"/><col width="50%"/>
</colgroup>
<tr>
	<td valign="top" align="center">	
		<div id="left_container" style="margin-right: 20px;">	
		<table>
		<colgroup>
			<col width="30%"/> <col width="30%"/><col width="30%"/>
		</colgroup>

		<tr>	
			<th>글번호<hr><br></th> <td colspan="2" align="left">${foodList.food_seq } 
			<input type="hidden" id="food_seq" name="food_seq" value="${foodList.food_seq } "><hr><br> </td>
		</tr>
		
		
		<tr>	
			<th>작성자<hr><br></th> <td colspan="2">${foodList.id }<hr><br></td>
		</tr>
			
		<tr>	
			<th>참가인원<hr><br></th> <td colspan="2">
			<c:if test="${foodList.join_cnt < foodList.total_cnt}">
				<font style="color: deepskyblue;">${foodList.join_cnt }</font><b>/</b>${foodList.total_cnt }명
			</c:if>
			<c:if test="${foodList.join_cnt == foodList.total_cnt}">
				<font style="color: red;">${foodList.join_cnt }</font><b>/</b>${foodList.total_cnt }명
			</c:if>
			<input type="hidden" id="join_cnt" name="join_cnt" value="${foodList.join_cnt } ">
			<input type="hidden" id="total_cnt" name="total_cnt" value="${foodList.total_cnt } ">
			<hr><br>
			</td>
		</tr>	
		
		<tr>	
			<th>모임날짜<hr><br></th> <td colspan="2"><fmt:formatDate value="${foodList.meetingDay }" pattern="yyyy/MM/dd"/><hr><br></td>
		</tr>
		<tr>	
			<th>작성일<hr><br></th> <td colspan="2"><fmt:formatDate value="${foodList.wdate }" pattern="yyyy/MM/dd"/><hr><br></td>
		</tr>	
		<tr>	
			<th>좋아요 수<hr><br></th> <td colspan="2">${foodList.like_cnt }개<hr><br></td>
		</tr>
		<tr>	
			<th>조회수<hr><br></th> <td colspan="2">${foodList.read_cnt }회<hr><br></td>
		</tr>	

		<tr>	
			<th>모임장소<hr><br></th> <td colspan="2">${foodList.local }<hr><br></td>
		</tr>		
		<tr>		
			<td colspan="3" align="center">
			<div class="map_wrap">
			    <div id="map" style="width:90%;height:100%;position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="${foodList.local }" id="keyword" size="15" readonly="readonly"> 			                
			            <button onclick="window.open('https://map.kakao.com/link/search/${foodList.local }', '', 'width=1300,height=600'); return false;">모임장소 길찾기</button>			                 
			                </form>                           
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>			        
			    </div>    
			</div>
			<hr><br>
			</td>
        </tr>      
	
		<tr style="margin-top: 15%;">
		 <c:if test="${not empty attachList }">
		  <c:forEach items="${attachList }" var="att" varStatus="vs">	
			<c:if test="${vs.index%2==0 }">
			</tr>
			<tr>
			</c:if>	
			
			<td width="33%">
				<div style="margin: 10 10 10 10;" id="imageThumb_${vs.index }" class="imageThumb_"> <%--0부터 시작 ~  --%>
						${att.fullname }
				</div>
			</td>
			
		  </c:forEach>
		 </c:if>
		</tr>
		
		<tr>
		<td colspan="3">
		<div align="center">
		<hr>
		<textarea rows="20" cols="150" readonly="readonly">${foodList.content }</textarea>
		
		<hr>
		</div>
		</td>
		</tr>
</table>
</div>
</td>
</tr>
</table>


<hr>
<c:if test="${empty joinList }">
	<button type="button" value="false" id="joinBtn" class="joinButton btn_s_gray btn_205" onclick="joinSharing()">참여</button>	
</c:if>
<c:if test="${not empty joinList }">
	<button type="button" value="false"  class="joinButton btn_s_blue btn_205" onclick="joinSharing()">참여중/참여취소</button>	
	&nbsp;&nbsp;&nbsp;
	<button type="button" class="joinButton btn_s_gray btn_205" onclick="joinList()">참여자 보기</button>
</c:if>


							

</div>
</div>
</div>

<br><br><br>
<hr>
		 
 <div>
 <jsp:include page="/WEB-INF/jsp/foodBbs/foodReply.jsp" flush="false"/>	
 </div>
 
 <br><br>

<%-- footer --%>
<div>
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
<%-- <%@include file="/WEB-INF/jsp/include/footer.jsp" %> --%>
</div>





<script>

function joinSharing() {
	
	alert("참가");
	var id = $("#id").val();
	var food_seq = $("#food_seq").val();
	var joinBtn = $("#joinBtn").val();
	var join_cnt = $("#join_cnt").val();
	var total_cnt = $("#total_cnt").val();
	//alert(join_cnt + "     " + total_cnt);
	
	
	if(id == ""){
		
	
	if(confirm("로그인 후 이용해주세요 로그인 하시겠습니까 ?") == true){
		
		location.href="login.do";
		
		}else {
			
			return;
			
		}
		
	}else{
		
		
			
		
		
		alert("join ajax 진입");
		
		$.ajax({
			url:"getJoin.do",
			type:"post",
			data:{ food_seq:food_seq, id:id },
			success:function(data){  // 먼저 참여중인지 체크 
				
				if(data.trim() == "OK"){ // 참여 가능 ! 
					
					if(join_cnt < total_cnt){ // 이때만 가능 
					
					if(confirm("모임에 참여 하시겠습니까 ?") == true){
						
			 			$.ajax({
							url:"joinInsert.do",
							type:"post",
							data:{ id:id, food_seq:food_seq },
							success:function(data){  
								
								if(data.trim() == "OK"){
							 
									alert("참여완료!");
									location.reload();
									
								}else {
									
									alert("참여 에러");
									
								}
							
							},
							error:function(r, s, err){
								
								alert("error");
								
							}
							
						}); 
						
						
						
						
					}else {
						
						return;
						
					}
				
				}else {  // 인원수 초과 
					alert("인원수가 초과 되었습니다.  참가인원:" + join_cnt +"   총인원:" + total_cnt);
				}  
						
	
															
				}else { // 이미 참여중  참여 취소 부분  
					
				if(confirm("모임 참여를 취소 하시겠습니까 ?") == true){
					
					 			$.ajax({
									url:"joinDel.do",
									type:"post",
									data:{ id:id, food_seq:food_seq },
									success:function(data){  
										
										if(data.trim() == "OK"){
											
									 		alert("참여 취소 완료!");
									 		location.reload();
										}else {
											
											alert("참여 취소 실패");
											
										}
									
									},
									error:function(r, s, err){
										
										alert("error");
										
									}
									
								}); 
															
						}else {
							
							return;
							
						}
				}
			
			},
			error:function(r, s, err){
				
				alert("error");
				
			}
			
			});
		

	}
	
	
}

$("#headLine .wish_icon").on("click", function(event) {
	
	//alert("좋아요!");
	
	var id = $("#id").val();
	var food_seq = $("#food_seq").val();
	
	
	//alert(id);
	//alert("글번호:" + food_seq);
	
	if(id == ""){
		//alert("로그인 후 이용해주세요 로그인 하시겠습니까 ?");
		
		if(confirm("로그인 후 이용해주세요 로그인 하시겠습니까 ?") == true){
			
			location.href="login.do";
			
			
		}else {
			
			return;
			
		}
		
		
	}else {
	
			$.ajax({
				url:"getLike.do",
				type:"post",
				data:{ id:id, food_seq:food_seq },
				success:function(data){  // 1차로  좋아요 유무 확인 필요 
					
					//alert("success");
					//alert("data:" + data);
					
					if(data.trim() == "OK"){ //좋아요 등록 가능 
						
						$.ajax({
							url:"likeInsert.do",
							type:"post",
							data:{ id:id, food_seq:food_seq },
							success:function(data){  // 1차로  좋아요 유무 확인 필요 
								
								if(data.trim() == "OK"){
								alert("좋아요!");
					               $(event.target).parent().addClass('exist');
						           $(event.target).parent().removeClass('empty'); 
									location.reload();
								}else {
									//alert("좋아요등록 ajax 실패");
								}
							
							},
							error:function(r, s, err){
								
								alert("error");
								
							}
							
						});
					
					}else { //좋아요 등록 삭제  
						
						$.ajax({
							url:"likeDel.do",
							type:"post",
							data:{ id:id, food_seq:food_seq },
							success:function(data){  // 1차로  좋아요 유무 확인 필요 
								
								if(data.trim() == "OK"){
									
									alert("좋아요 취소!");
			               		   $(event.target).parent().addClass('empty');
					               $(event.target).parent().removeClass('exist');
									location.reload();
									
								}else{
									
								//	alert("좋아요삭제 ajax 실패");
						
									
								}
							},
							error:function(r, s, err){
								
								alert("error");
								
							}
							
						});
						
					}
					
					
				},
				error:function(r, s, err){
					
					alert("error");
					
				}
				
			});
			
	}
	
});


function joinList() {
	alert("참여자 목록 보기");
	var food_seq = $("#food_seq").val();

	 window.open('food_joinlist.do?food_seq=' + food_seq, 'width=600,height=600', 'scrollbars=yes');
}






//지도js

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);    
}
 
function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);    
}

map.setZoomable(false);
map.setDraggable(false);
 </script>
