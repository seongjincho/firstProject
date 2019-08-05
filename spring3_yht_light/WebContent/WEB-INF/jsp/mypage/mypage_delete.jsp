
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<link rel="icon" type="image/png" href="images/foodicon.png">
<title>Food Sharing 탈퇴 페이지</title>
<style>
	.deltbl{
		/* position: absolute; */
		margin-top: 50px;
		margin-left: 10%;
	}
</style>


<!-- hearder -->
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<table class="deltbl">
<tr>
	<td><h2>탈퇴 안내</h2>
		회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
	</td>
</tr>
<tr>
	<th height="25"></th>
</tr>

<tr>
	<td><h3><font size="30px">${login.name }</font>님이 사용하고 계신 아이디<font color="Green" size="30px">[ ${login.id } ]</font>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h3>
		<font color="red">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</font>하오니 신중하게 선택하시기 바랍니다.
	</td>
</tr>
<tr>
	<th height="25"></th>
</tr>

<tr>
	<td><h3>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
	회원정보 및 개인형 서비스 이용기록, 삭제된 데이터는 복구되지 않습니다.<br>
	삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
	</td>
</tr>
<tr>
	<th height="25"></th>
</tr>

<tr>
	<td><h3>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다. </h3>
		게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. 
		삭제를 원하는 게시글이 있다면<br>
		<font color="red">반드시 탈퇴 전 삭제하시기 바랍니다.</font>
		탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는<br>
		방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다. 
	</td>
</tr>
<tr>
	<th height="25"></th>
</tr>


<tr>
	<td>
		<b><font color="red">탈퇴 후에는 아이디</font></b><font color="Green">[ ${login.id } ]</font><b><font color="red">로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
		게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</font></b><br><br>

		<input type="checkbox" id="bye" value="bye"><b><font color="red">안내 사항을 모두 확인하였으며, 이에 동의합니다.</font></b>
	</td>
</tr>
<tr>
	<th height="30"></th>
</tr>

<tr>
	<th>	
		<button id="userdel" class="btn btn-danger">확인</button>
		<button id="goback" class="btn btn-primary">메인페이지로</button>
	</th>
</tr>

</table>
<br><br><br>

	<!-- footer -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>


<script type="text/javascript">
$(document).ready(function() {

	var auth = "${login.auth}";
	

		$("#userdel").click(function() {
				
	

			if ($('#bye').prop("checked") == true){
				
					/* alert(auth); */
					if(auth >= 3){
						
						alert("관리자 계정은 탈퇴가 불가능 합니다");
						return;
						
					}
					
					location.href = "mypage_deleteAf.do";
					alert("회원탈퇴가 완료되었습니다!");
				
			}else{
				
		     		alert("탈퇴 안내를 확인하고 동의해 주세요.");
		     	
			}
		
		});
	  	
	
	$("#goback").click(function() {
		location.href= "main.do";
	});
	
});
</script>
