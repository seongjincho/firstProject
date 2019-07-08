<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
var userEmail = '${email_check}';

if(userEmail == 1) {
	alert("회원가입을 축하합니다. 이제 로그인이 가능합니다.");
	window.open('', '_self', ''); // 브라우저창 닫기
	/* window.close(); // 브라우저창 닫기 */
	self.location = 'login.do';
} else {
	alert("이메일 인증을 해주세요");
	window.open('', '_self', ''); // 브라우저창 닫기
	/* window.close(); // 브라우저창 닫기 */
	self.location = 'login.do';
}
</script>