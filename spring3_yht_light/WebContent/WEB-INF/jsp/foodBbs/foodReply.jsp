<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"> -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">

body{ background: #fafafa;}
.widget-area.blank {
background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
-webkit-box-shadow: none;
-moz-box-shadow: none;
-ms-box-shadow: none;
-o-box-shadow: none;
box-shadow: none;
}
body .no-padding {
padding: 0;
}
.widget-area {
background-color: #fff;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
-ms-border-radius: 4px;
-o-border-radius: 4px;
border-radius: 4px;
-webkit-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
-moz-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
-ms-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
-o-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
float: left;
margin-top: 30px;
padding: 25px 30px;
position: relative;
width: 100%;
}
.status-upload {
background: none repeat scroll 0 0 #f5f5f5;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
-ms-border-radius: 4px;
-o-border-radius: 4px;
border-radius: 4px;
float: left;
width: 100%;
}
.status-upload form {
float: left;
width: 100%;
}
.status-upload form textarea {
background: none repeat scroll 0 0 #fff;
border: medium none;
-webkit-border-radius: 4px 4px 0 0;
-moz-border-radius: 4px 4px 0 0;
-ms-border-radius: 4px 4px 0 0;
-o-border-radius: 4px 4px 0 0;
border-radius: 4px 4px 0 0;
color: #777777;
float: left;
font-family: Lato;
font-size: 14px;
height: 142px;
letter-spacing: 0.3px;
padding: 20px;
width: 100%;
resize:vertical;
outline:none;
border: 1px solid #F2F2F2;
}

.status-upload ul {
float: left;
list-style: none outside none;
margin: 0;
padding: 0 0 0 15px;
width: auto;
}
.status-upload ul > li {
float: left;
}
.status-upload ul > li > a {
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
-ms-border-radius: 4px;
-o-border-radius: 4px;
border-radius: 4px;
color: #777777;
float: left;
font-size: 14px;
height: 30px;
line-height: 30px;
margin: 10px 0 10px 10px;
text-align: center;
-webkit-transition: all 0.4s ease 0s;
-moz-transition: all 0.4s ease 0s;
-ms-transition: all 0.4s ease 0s;
-o-transition: all 0.4s ease 0s;
transition: all 0.4s ease 0s;
width: 30px;
cursor: pointer;
}
.status-upload ul > li > a:hover {
background: none repeat scroll 0 0 #606060;
color: #fff;
}
.status-upload form button {
border: medium none;
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
-ms-border-radius: 4px;
-o-border-radius: 4px;
border-radius: 4px;
color: #fff;
float: right;
font-family: Lato;
font-size: 14px;
letter-spacing: 0.3px;
margin-right: 9px;
margin-top: 9px;
padding: 6px 15px;
}
.dropdown > a > span.green:before {
border-left-color: #2dcb73;
}
.status-upload form button > i {
margin-right: 7px;
}

</style>

<title>Insert title here</title>
</head>
<body>

<div style="width: 100%;" align="center">

<div class="container" style="margin-left: 30%;">
	<div class="row">
		<h3>Comment</h3>
	</div>
    
    <div class="row">
    
    <div class="col-md-6">
    						<div class="widget-area no-padding blank">
								<div class="status-upload">
									<form>
										<textarea id="replyContent" name="replyContent" placeholder="댓글 내용을 입력하세요"></textarea>
										<ul>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Audio"><i class="fa fa-music"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="fa fa-picture-o"></i></a></li>
										</ul>
										<c:if test="${not empty joinList }">
										<button type="button" class="btn btn-success green" onclick="replyInsert()"><i class="fa fa-share"></i>등록</button>
										</c:if>
										<c:if test="${empty joinList }">
										<button type="submit" class="btn btn-success green" disabled="disabled"><i class="fa fa-share"></i>등록</button>
										</c:if>
									</form>
								</div><!-- Status Upload  -->
							</div><!-- Widget Area -->
						</div>
       
    </div>
</div>
<br><br><hr><br><br>
<c:if test="${empty replyList }">
<h2>현재 댓글이 없습니다</h2>
</c:if>
<c:if test="${not empty replyList }">
<h1>Comment List</h1>
<br><br><br>

<c:forEach var="reply" items="${replyList }" varStatus="vs">

<div class="" align="left" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: 10%; margin-right: 10%;">

<c:if test="${reply.del == 1 }">
<br>
<div>
<font style="color: red;">현재 삭제된 댓글입니다.</font>
</div>
<br>
</c:if>

<c:if test="${reply.del == 0 }">
<%--댓글 --%>
<div class="">
<c:if test="${reply.depth == 1 }">
<img alt="" src="images/arrow.png">&nbsp;
  댓글번호 : <b>${vs.count }</b>&nbsp; / &nbsp; <b>
</c:if> 
 <c:if test="${reply.depth == 0 }">
  댓글번호 : <b>${vs.count }</b>&nbsp; / &nbsp; <b><a href="#none" onclick="showReReply( ${vs.count } )">
  </c:if>
  ${reply.id }
<input type="hidden" id="showReReply${vs.count }" name="showReReply${vs.count }" value="false"></a></b> 
&nbsp; <fmt:formatDate value="${reply.wdate }" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;&nbsp;	
<c:if test="${reply.id == login.id || login.auth == 3 }">
<a href="#none" onclick="showUpdate( ${vs.count } )">수정 <input type="hidden" id="showUpdate${vs.count }" name="showUpdate${vs.count }" value="false"></a>
&nbsp;
<a href="#none" onclick="replyDelete( ${vs.count } )">삭제 </a> 
&nbsp;
</c:if>
</div>
<div class=""> 
<br>
<p> 내용 : ${reply.content }</p>
<br>
</div>

<%--댓글 수정  --%>
<div class="showUpdate${vs.count }" style="display: none;">  
<form name="replyUpdateFrm${vs.count }" id="replyUpdateFrm${vs.count }">
	<input type="hidden" id="reply_seq" name="reply_seq" value="${reply.reply_seq }">
	<input type="hidden" id="id" name="id" value="${reply.id }">
	<input type="hidden" id="ref" name="ref" value="${reply.ref }">
	<input type="hidden" id="step" name="step" value="${reply.step }">
	<input type="hidden" id="depth" name="depth" value="${reply.depth }">
	<input type="hidden" id="food_seq" name="food_seq" value="${foodList.food_seq }"/>
	<input type="text" id="content" name="content" value="${reply.content }" size="100" />
</form>
<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdate(${vs.count })">수정</button> </span>
</div>

<%--댓글에 대한 답글 --%>
<div class="container showReReply${vs.count }" style="display: none;">

    <div class="row">
    
    <div class="col-md-6">
    						<div class="widget-area no-padding blank">
								<div class="status-upload">
									<form id="reReplyFrm${vs.count }" name="reReplyFrm${vs.count }">
										<input type="hidden" id="reply_seq" name="reply_seq" value="${reply.reply_seq }">
										<input type="hidden" id="id" name="id" value="${login.id }">
										<input type="hidden" id="food_seq" name="food_seq" value="${foodList.food_seq }">				
										<textarea id="content" name="content">@${reply.id }</textarea>
										<ul>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Audio"><i class="fa fa-music"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>
											<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="fa fa-picture-o"></i></a></li>
										</ul>
										<button type="button" class="btn btn-success green" onclick="reReply( ${vs.count } )"><i class="fa fa-share"></i>등록</button>
									</form>
								</div><!-- Status Upload  -->
							</div><!-- Widget Area -->
						</div>
    </div>
</div>




</c:if>

</div>

</c:forEach>

</c:if>
<br><hr><br>

</div>


<script type="text/javascript">
$(document).ready(function(){

    $("[data-toggle=tooltip]").tooltip();
});

function replyInsert() {
	alert("댓글 등록  진입");
	var id = $("#id").val();
	var food_seq = $("#food_seq").val();
	var content = $("#replyContent").val();
	
	$.ajax({
		
		url:"replyInsert.do",
		type: "post",
		data:{ id:id, food_seq:food_seq, content:content },
		success:function(data){
			
			if(data.trim() == "OK"){
				
				alert("댓글 작성 성공!");
				location.reload();
				
			}else {
				
				alert("댓글 작성 실패!");
				
			}
			
		},
		error:function(r, s, err){
			alert("error");
		}
			
	});
	
}

function showUpdate( count ) {
	
	
	var showUpdate = $("#showUpdate" + count ).val();
	
	if(showUpdate == "false"){
		
	  $(".showUpdate" + count ).css("display", "block");
	  $("#showUpdate" + count ).val(true);
		
	}else if(showUpdate == "true"){
		
	  $(".showUpdate" + count ).css("display", "none");
	  $("#showUpdate" + count ).val(false);	
	}
}



function replyUpdate( count ) {

	//alert("댓글 수정 진입");
	//var food_seq = $("#food_seq").val();
    var updateData = $("form[name=replyUpdateFrm" + count + "]").serialize() ;
    //alert(updateData);
    
   $.ajax({
        type : 'post',
        url : 'replyUpdate.do',
        data : updateData,
		success:function(data){
			
			if(data.trim() == "OK"){
				
				alert("댓글 수정 성공!");
				location.reload();
				
			}else {
				
				alert("댓글 수정 실패!");
				
			}
			
		},
		error:function(r, s, err){
			alert("error");
		}
			
	});


}


	


function replyDelete( count ) {
	
	//alert("댓글 삭제 진입");
	
	 if(confirm("댓글을 삭제 하시겠습니까 ?") == true){
		 
		    var deleteData = $("form[name=replyUpdateFrm" + count + "]").serialize() ;
		   // alert(deleteData);
		    
		    $.ajax({
		        type : 'post',
		        url : 'replyDelete.do',
		        data : deleteData,
				success:function(data){
					
					if(data.trim() == "OK"){
						
						alert("댓글 삭제 성공!");
						location.reload();
						
					}else {
						
						alert("댓글 삭제 실패!");
						
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

function showReReply( count ){
	
	var showReReply = $("#showReReply" + count ).val();
	
	if(showReReply == "false"){
		
	  $(".showReReply" + count ).css("display", "block");
	  $("#showReReply" + count ).val(true);
		
	}else if(showReReply == "true"){
		
	  $(".showReReply" + count ).css("display", "none");
	  $("#showReReply" + count ).val(false);	
	}
	

	
}

function reReply( count ) {
	alert("답글 등록시도!");
	
    var reReplyData = $("form[name=reReplyFrm" + count + "]").serialize() ;
	alert(reReplyData);
	
	   $.ajax({
	        type : 'post',
	        url : 'reReply.do',
	        data : reReplyData,
			success:function(data){
				
					alert("답글 쓰기 성공!");
					location.reload();
/* 				if(data.trim() == "OK"){
					
					
				}else {
					
					alert("답글 쓰기 실패!");
					
				} */
				
			},
			error:function(r, s, err){
				alert("error");
			}
				
		});


	
}



</script>

</body>
</html>