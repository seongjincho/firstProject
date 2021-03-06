<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>    
<title>Food sharing</title>

<!-- noticeBbs.css -->
<link rel="stylesheet" type="text/css" href="css/foodBbs.css">

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<%
String category = (String)request.getAttribute("f_category");
if(category == null) category = "";
String keyword = (String)request.getAttribute("f_keyword");
if(keyword == null) keyword = "";
%>


<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";


$(document).ready(function () {
	
	$("#_f_category").val( category );
	$("#_f_keyword").val( keyword ); 

});
</script>  

<div class="mainImg" align="center">
<h1 class="headtitle">Food Sharing</h1>
</div>	 

<div class="f_content">
<div class="f2_content">

	 
<div align="center" >
<table class="noti">
<thead style="font-size: 16px;">
	<tr class="noto">
		<th width="5%">순서</th>
		<th width="10%">상태</th>
		<th width="25%">제목</th>
		<th width="10%">작성자</th>
		<th width="20%">참여인원/모집인원</th>
		<th width="10%">모임날짜</th>
		<th width="10%">작성일</th>
		<th width="5%">조회수</th>
		<th width="5%"><img title="좋아요 수" width="25px" height="25px" src="images/likeicon2.png"></th>
	</tr>
</thead>
 <tbody>
	<c:if test="${empty foodBbsList }">
		<tr>
			<td colspan="8">작성된 글이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach items="${foodBbsList }" var="bbs" varStatus="vs">

	
	<tr class="_hover_tr">
		<td><%-- ${vs.count } --%>${fn:length(foodBbsList)-vs.index} </td> 
		<td>
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:formatDate value="${now }" pattern="yyyy/MM/dd" var="nowDay" />
			<fmt:formatDate value="${bbs.meetingDay }" pattern="yyyy/MM/dd" var="meetingDay"/>
			
			<c:if test="${bbs.del == 0 }">
			    <c:if test="${nowDay le meetingDay}"> <button type="button" class="btn btn-outline-danger">진행중</button> </c:if>
			    <c:if test="${nowDay gt meetingDay}"> <button type="button" class="btn btn-outline-warning">종료</button> </c:if>			
			</c:if>
			
			<c:if test="${bbs.del == 1 }">
			  	<button type="button" class="btn btn-outline-secondary">삭제</button>
			</c:if>
		</td>
		
		<td style="text-align: left; padding-left: 15px;" class="title_">		
			<input type="hidden" id="id" name="id" value="${login.id }">	
			<c:if test="${bbs.del == 0 }">
				
			<c:choose>
			
			    <c:when test="${nowDay le meetingDay}">
			    <a href="#none" onclick="titleclick(${bbs.food_seq}, 'true')">
						${bbs.title }  
					</a>&nbsp;&nbsp;<font color="deepskyblue">(${bbs.reply_cnt })</font>  
				</c:when>
				
			    <c:when test="${nowDay gt meetingDay}">
					<a href="#none" onclick="titleclick(${bbs.food_seq}, 'false')">
						${bbs.title }  
					</a>&nbsp;&nbsp;<font color="deepskyblue">(${bbs.reply_cnt })</font>  
				</c:when>
				
			</c:choose>
						
			</c:if>
			
			<c:if test="${bbs.del == 1 }">
			  	<del>삭제된 글 입니다</del>
			</c:if>
		</td>
		<td>${bbs.id }</td>
		<td>
	
			<c:if test="${bbs.join_cnt < bbs.total_cnt}">
				<font style="color: deepskyblue;">${bbs.join_cnt }</font><b>/</b>${bbs.total_cnt } 명
			</c:if>
			<c:if test="${bbs.join_cnt == bbs.total_cnt}">
				<font style="color: red;">${bbs.join_cnt }</font><b>/</b>${bbs.total_cnt } 명
			</c:if>

		</td>
		<td>
			<fmt:formatDate value="${bbs.meetingDay }" pattern="yyyy/MM/dd"/>
		</td>
		<td>
			<fmt:formatDate value="${bbs.wdate }" pattern="yyyy/MM/dd"/>
      	</td>
		<td>${bbs.read_cnt }</td>
		<td>${bbs.like_cnt }</td>

	</tr>

	</c:forEach>
		<tr>
			<td colspan="6" style="border: 1px solid #fff">
				<div align="right">
					<span>
						<button type="button" id="_btnAdd" class="btnwrite" style="border-color: #0051ba;">글쓰기</button>
					</span>
				</div>
			</td>
		</tr>
</tbody>
</table>



<!-- 페이징 처리 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/jsp/foodBbs/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>
<br>

<div align="center" style="width: 100%;">

<div style="margin-top: 20px; margin-bottom: 10px; margin-left: 40%;">

<form action="" name="frmForm1" id="_frmFormSearch" method="post">

<table style="margin-left: auto; margin-right: auto; 
		margin-top:3px; margin-bottom: 3px; float: left;">
	
	<tr>
		<td style="padding-left:5px;">
			<select id="_f_category" name="f_category">
				<option value="" selected="selected">선택&nbsp;&nbsp;</option>
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="id">작성자</option>
			</select>
		</td>
		<td style="padding-left: 5px;">
			<input type="text" id="_f_keyword" name="f_keyword">
		</td>
		<td style="padding-left: 5px;">
			<span class="button blue">
				<button type="button" id="_btnSearch" class="btnsearch">검색</button>
			</span>
		</td>
	</tr>

</table>

<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage }">

</form>
</div>
</div>

</div>
</div>





<br><br><br><br><br><br><br>
</div>


<div style="clear:both"></div>
	
<%-- footer --%>
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

<script type="text/javascript">


function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "foodBbsList.do").submit();
	
}


$("#_btnAdd").click(function () {
	
	location.href="writeFood.do";
	
});


$("#_btnSearch").click(function(){
//	alert("_btnSearch");
	$("#_pageNumber").val("0");
	$("#_frmFormSearch").attr("action","foodBbsList.do").submit();
});

function titleclick( food_seq, value) {
	var id = $("#id").val();
	
	var auth = "${login.auth}";
	
	 //alert("food_seq:" + food_seq + " id: " + id + " value: " + value  + " auth: " + auth);
	
	
	if(value == "true" || auth >= 3){
		
		//alert("글을 볼수 있음 관리자");
		location.href = "detailFood.do?food_seq=" + food_seq + "&id=" + id;
	}else if(value == "false") {
		
		alert("모임 날짜가 만료된 글 입니다.");
		
	}
}

</script>