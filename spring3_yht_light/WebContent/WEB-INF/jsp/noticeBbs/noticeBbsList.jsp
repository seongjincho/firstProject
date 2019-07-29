<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<!-- noticeBbs.css -->
<link rel="stylesheet" type="text/css" href="css/noticeBbs.css">

<title>Food sharing</title>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<%
String category = (String)request.getAttribute("n_category");
if(category == null) category = "";
String keyword = (String)request.getAttribute("n_keyword");
if(keyword == null) keyword = "";
%>


<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";


$(document).ready(function () {
	
	$("#_n_category").val( category );
	$("#_n_keyword").val( keyword ); 

});
</script> 


	

<div class="mainImg" align="center">
<h1 class="headtitle">Notice</h1>
</div>	 
	
<div class="f_content">
<div class="f2_content">



	 
<div align="center">
<table class="noti">
<thead style="font-size: 16px;">
	<tr class="noto">
		<th width="10%">순서</th>
		<th width="50%">제목</th>
		<th width="10%">작성자</th>
		<!-- <th width="15%">조회수</th> -->
		<th width="15%">등록일</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty noticeBbsList }">
		<tr>
			<td colspan="5">작성된 글이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach items="${noticeBbsList }" var="bbs" varStatus="vs">

	
	<tr class="_hover_tr">
		<td><%-- ${vs.count }  --%> ${fn:length(noticeBbsList)-vs.index}</td>
		<td style="text-align: left; padding-left: 15px;">	
			<a href="#none" onclick="titleclick(${vs.index })">
				${bbs.title }
			</a>
		</td>
		<td>${bbs.id }</td>
<%-- 		<td>
			<font id="read${vs.index }">${bbs.readcount }</font>
			<input type="hidden" id="seq${vs.index }" value="${bbs.notice_seq }">
		</td> --%>
		<td><fmt:formatDate value="${bbs.rdate }" 
     			 pattern="yyyy/MM/dd"/>
      	</td>
	</tr>
	<tr id="content${vs.index }" class="content" style="display:none;">
		<td colspan="5">
			<div id="slide${vs.index }" class="slide" style="padding: 10% 10% 10% 10%; text-align:left; background-color: #f0f0f0;">
				<pre><font size="3px">${bbs.content }</font></pre>
				<c:if test="${login.auth == 3 }">
					<div align="center">
						<button id="updateBtn" class="btnsearch" onclick="location.href='noticeUpdate.do?notice_seq=${bbs.notice_seq }'">수정</button>
						<button id="deleteBtn" class="btnsearch" onclick="location.href='noticeDelete.do?notice_seq=${bbs.notice_seq }'">삭제</button>
					</div>
				</c:if>
			</div>
		</td>
	</tr>
	</c:forEach>
	<c:if test="${login.auth == 3 }">
		<tr>
			<td colspan="6" style="border: 1px solid #fff">
				<div align="center">
					<span>
						<button type="button" id="_btnAdd" class="btnwrite" style="border-color: #0051ba;">글쓰기</button>
					</span>
				</div>
			</td>
		</tr>
	</c:if>
</tbody>
</table>

<br>


<!-- 페이징 처리 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/jsp/noticeBbs/paging.jsp" flush="false">
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
		margin-top:	3px; margin-bottom: 3px; float: left;">
	
	<tr>
		<!-- <td>검색:&nbsp;&nbsp;</td> -->
		<td style="padding-left:5px;">
			<select id="_n_category" name="n_category">
				<option value="" selected="selected">선택&nbsp;&nbsp;</option>
				<option value="title">제목</option>
				<option value="contents">내용</option>
			</select>
		</td>
		<td style="padding-left: 5px;">
			<input type="text" id="_n_keyword" name="n_keyword">
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





<br><br>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>



<script type="text/javascript">
function titleclick(notice_seq) {
	
	/* alert("진입");
	alert(notice_seq); */
	
	var status = $("#content" + notice_seq).css("display");
	
 	if(status == "none"){
		
		for(i = 0; i < 10; i++){
			// if(i == seq)break;
			$("#content" + i).css("display", "none");
		}
		
		$("#content" + notice_seq).css("display", "");
		
/* 		$.ajax({
			url:"noticeReadcount.do",
			type:"get",
			data:"notice_seq=" + $("#notice_seq").val(),
			success:function(data){
				alert("success");
			//	alert(data);
				$("#read" + notice_seq).text(data);
			},
			error:function(r,s,err){
				alert("error");
			}
		});   */
		
	}else{
		$("#content" + notice_seq).css("display", "none");
	}
	  

	
}
</script>

<script type="text/javascript">

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "noticeBbsList.do").submit();
	
}


$("#_btnAdd").click(function () {
	
	location.href="writeNotice.do";
	
});


$("#_btnSearch").click(function(){
	//alert("_btnSearch");

/* 	 var ndata =  $("form[name=frmForm1]").serialize();
	alert(ndata); */

	 $("#_pageNumber").val("0");
	$("#_frmFormSearch").attr("action","noticeBbsList.do").submit();
});


</script>

