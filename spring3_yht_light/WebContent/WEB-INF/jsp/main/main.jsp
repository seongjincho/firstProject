<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Food sharing</title>


<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">


</head>
<body>

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>




메인 페이지 입니다   (like_cnt , read_cnt 로  게시물 띄우기 )
<a href="#none">
<img src="displayFile.do?fileName=/2019/07/12/s_c9270522-0b1a-4f76-9123-1d99c5e32ba1_table2.PNG">
</a>
<input type="hidden" name="files" value="/2019/07/12/s_c9270522-0b1a-4f76-9123-1d99c5e32ba1_table2.PNG">
<a href="#none">
<img src="displayFile.do?fileName=/2019/07/12/s_faf1d549-24d4-4050-bdf3-b8c7328298b3_table.PNG">
</a>
<input type="hidden" name="files" value="/2019/07/12/s_faf1d549-24d4-4050-bdf3-b8c7328298b3_table.PNG">

<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

</body>
</html>