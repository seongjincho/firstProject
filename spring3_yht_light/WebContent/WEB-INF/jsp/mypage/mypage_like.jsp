<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>   

<!-- noticeBbs.css -->
<link rel="stylesheet" type="text/css" href="css/mypage_like.css">

<title>Food sharing</title>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<c:if test="${login.id == null }">
		<script type="text/javascript">
       alert("로그인 해 주십시오");
       location.href='login.do';
       </script> 
</c:if>  




	
<div class="f_content">
<div class="f2_content">

<div class="headtitle" align="center"><br><br>
	
	<h2>Like List</h2>
	<br><br>
</div>


	 
<div align="center">
<table class="noti">
<thead style="font-size: 16px;">
	<tr class="noto">
		<th width="5%">순서</th>
		<th width="50%">제목</th>
		<th width="10%">작성자</th>
		<th width="15%">모임장소</th>
		<th width="10%">모임날짜</th>
		<th width="10%">삭제</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty myLikeList }">
		<tr>
			<td colspan="5">좋아요 리스트가 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach items="${myLikeList }" var="bbs" varStatus="vs">

	
	<tr class="_hover_tr">
		<td><%-- ${vs.count } --%>${fn:length(myLikeList)-vs.index}</td>
		<td style="text-align: left; padding-left: 15px;" class="title_">	
			
			<c:if test="${bbs.del == 0 }">
			<a href="#none" onclick="titleclick(${bbs.food_seq})">
				${bbs.title }<input type="hidden" id="id" name="id" value="${login.id }">
			</a>
			</c:if>
			
			<c:if test="${bbs.del == 1 }">
			  	<del>삭제된 글 입니다</del>
			</c:if>
		
		</td>
		<td>${bbs.id }</td>
		<td>${bbs.local }</td>
		<td><fmt:formatDate value="${bbs.meetingDay }" 
     			 pattern="yyyy/MM/dd"/>
      	</td>
      	<td>
      		<input type="button" id="wish_del" class="btnDel" value="삭제" onclick="goDel(${bbs.food_seq })">
   
      	</td>
	</tr>
	
	</c:forEach>
<%-- 	<c:if test="${login.auth == 3 }">
		<tr>
			<td colspan="6" style="border: 1px solid #fff">
				<div align="center">
					<span>
						<button type="button" id="_btnAdd" class="btnwrite" style="border-color: #0051ba;">글쓰기</button>
					</span>
				</div>
			</td>
		</tr>
	</c:if> --%>
</tbody>
</table>
</div>
</div>
</div>







<div style="margin-top: 15%;">
<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</div>


<script type="text/javascript">
function titleclick( food_seq ) {
	var id = $("#id").val();
	
	//screen.width : 현재 운영체제의 너비
	//screen.height : 현재 운영체제의 높이
	w = 1300; //팝업창의 너비
	h = 600; //팝업창의 높이

	//중앙위치 구해오기
	var LeftPosition = (screen.width-1300)/2;
	var TopPosition = (screen.height-600)/2;
	 
/* 	window.open('detailFood.do?food_seq=' + food_seq + '&id=' + id,'Food Sharing','width=1300,height=600',
			'top=' + TopPosition,'left=' + LeftPosition , 'scrollbars=yes'); */
	location.href = 'detailFood.do?food_seq=' + food_seq + '&id=' + id;
}


function goDel( food_seq ) {
	var id = $("#id").val();
	//var food_seq = $("#food_seq").val();
	
	if(confirm("좋아요를 취소 하시겠습니까 ?") == true){
		
				$.ajax({
				url:"likeDel.do",
				type:"post",
				data:{ id:id, food_seq:food_seq },
				success:function(data){  
					alert(data);
					if(data.trim() == "OK"){
						
				 		alert("좋아요 취소 완료!");
				 		location.reload();
					}else {
						
						alert("좋아요 취소 실패!");
						
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







</script>

