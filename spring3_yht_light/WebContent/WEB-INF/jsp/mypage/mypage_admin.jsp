<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


<c:if test="${login.id == null}">
		<script type="text/javascript">
       alert("로그인 해 주십시오");
       location.href='login.do';
       </script> 
</c:if> 
<c:if test="${login.auth == 1}">
		<script type="text/javascript">
       alert("접근이 불가능한 페이지 입니다.");
       location.href='mypage_main.do';
       </script> 
</c:if> 
 

</head>
<body>


<div align="center" style="margin-top: 5%; margin-left: 5%; margin-right: 5%; margin-bottom: 5%;">

<h1 style="margin-bottom: 5%;">회원 관리 페이지 (<b style="color:#A7574A; ">${ListSize }</b>)</h1>


<table>
<colgroup>
<col width="7.5%"><col width="7.5%"><col width="20%">
<col width="20%"><col width="10%"><col width="7.5%">
<col width="10%"><col width="5%"><col width="3%">
</colgroup>

<thead>
<tr style="border: 1px solid black; bor">
<th>회원아이디</th> <th>이름</th> <th>Email</th> 
<th>주소</th> <th>전화번호</th> <th>회원권한</th> 
<th>이메일인증</th> <th>회원 상태</th> <th>메뉴</th>
</tr>
</thead>

<tbody>

<c:if test="${not empty memberList }">
<c:forEach items="${memberList }"  var="mem">
<tr>
<td>${mem.id }</td>
<td>${mem.name }</td>
<td>${mem.email }</td>
<td>${mem.address1}<br>${mem.address2 }</td>
<td>${mem.phone }</td>
<td>
<c:if test="${mem.auth == 1 }">일반회원</c:if>
<c:if test="${mem.auth == 3 }">관리자</c:if>
</td>
<td>
<c:if test="${mem.authstatus == 0 }">미인증</c:if>
<c:if test="${mem.authstatus == 1  }">인증</c:if>
</td>
<td>
<c:if test="${mem.del == 0  }">정상</c:if>
<c:if test="${mem.del == 1  }">탈퇴</c:if>
</td>
<td>

 <ul class="navbar-nav mr-auto">
   <li class="nav-item dropdown">
     <a class="nav-link dropdown-toggle" href="#" style="color: #dc3545;" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <img width="30px" height="30px" alt="" src="images/settingIcon.jpg">
     </a>
     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
       <a class="dropdown-item" onclick="goUpdate('${mem.id }')">수정</a>
       <c:if test="${mem.del == 0}">
       <a class="dropdown-item" onclick="goDel('${mem.id }' )">탈퇴</a> 
       </c:if>                       
     </div> 
   </li>
   </ul>

</td>
</tr>
</c:forEach>
</c:if>

<c:if test="${empty memberList }">

<tr>

<td colspan="9" align="center"><br>현재 회원이 없습니다.<br></td>
</tr>
<tr></tr>
</c:if>


</tbody>


</table>
<br><br>

<div style="background-color: #F8D7DA; text-align: center; border: 2px solid #ECEDF0;">
<p style="margin-top: 20px; color: #A7574A;" >*회원자료 삭제시 다른 회원이 기존 회원 아이디를 사용하지 못하도록 회원아이디,이름,전화번호,email은 삭제하지 않고 영구 보관합니다.</p>
</div>
</div>


<script type="text/javascript">

function goUpdate( id ) {
	alert("수정 진입");
	//alert(id);
	
	//location.href = "memberUpdate.do?id=" + id;
	
	var popupX = (window.screen.width / 2) - (600 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height / 2) - (600 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	window.open('memberUpdate.do?id=' + id, 'scrollbars=yes', 'status=no, height=600, width=600, left='+ popupX + ', top='+ popupY);
	
}

function goDel( id ) {
	alert("탈퇴 진입");
	//alert(id);
	
	var id = id;

	
 	if(confirm(id + "님을 탈퇴 시키겠습니까?") == true){
	    
		$.ajax({
			
	        url : 'memberDel.do',
	        type : 'post',
	        data : {id:id},
			success:function(data){
				
				if(data.trim() == "OK"){
					
					alert("멤버 삭제 성공!");
					location.reload();
					
				}else {
					
					alert("멤버 삭제 실패!");
					
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



</body>
</html>