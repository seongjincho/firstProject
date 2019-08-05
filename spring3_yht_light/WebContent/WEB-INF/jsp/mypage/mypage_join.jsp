<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>   

<!-- noticeBbs.css -->
<link rel="stylesheet" type="text/css" href="css/mypage_join.css">

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


<div class="mainImg" align="center">	
	<h1 class="headtitle">Join List</h1>
</div>

	
<div class="f_content" > 
<div class="f2_content">



	 
<div align="center" style="margin-bottom: 10%;">
<table class="noti">
<thead style="font-size: 16px;">
	<tr class="noto">
		<th width="5%">순서</th>
		<th width="40%">제목</th>
		<th width="10%">작성자</th>
		<th width="15%">모임장소</th>
		<th width="10%">모임날짜</th>
		<th width="10%">참여인원/모집인원</th>
		<!-- <th width="10%">상태</th> -->
	</tr>
</thead>
<tbody>
	<c:if test="${empty myJoinList }">
		<tr>
			<td colspan="5">참여한 모임이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach items="${myJoinList }" var="bbs" varStatus="vs">

	
	<tr class="_hover_tr">
		<td><%-- ${vs.count } --%>${fn:length(myJoinList)-vs.index} </td>
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
		<td>
			<fmt:formatDate value="${bbs.meetingDay }" pattern="yyyy/MM/dd"/>
      	</td>
      	<td>
      		<c:if test="${bbs.join_cnt < bbs.total_cnt}">
				<font style="color: deepskyblue;">${bbs.join_cnt }</font><b>/</b>${bbs.total_cnt } 명
			</c:if>
			<c:if test="${bbs.join_cnt == bbs.total_cnt}">
				<font style="color: red;">${bbs.join_cnt }</font><b>/</b>${bbs.total_cnt } 명
			</c:if> 
      	</td>     	
	</tr>
	</c:forEach>
</tbody>
</table>
</div>
</div>
<br><br>
</div>



<div style="margin-bottom: 5%;"><br><br></div>



<div style="margin-top: 15%;">
<div style="clear:both"></div>
<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</div>


<script type="text/javascript">
function titleclick( food_seq ) {
	var id = $("#id").val();
	//window.open('detailFood.do?food_seq=' + food_seq + '&id=' + id,'Food Sharing','width=1300,height=600', 'scrollbars=yes');
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

