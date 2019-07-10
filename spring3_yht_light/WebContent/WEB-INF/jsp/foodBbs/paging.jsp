<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int totalRecordCount; 	 // 전체 글수
	int pageNumber;       	 // 현재 페이지 넘버   10개씩 가정하에  23개의 글이 있다면 -> 3페이지 
	int pageCountPerScreen;  // 스크린당 페이지수  [1]~ [10]
	int recordCountPerPage; //	페이지당 글수  = 10개로 짜르기 위해  10개로 	
	
	// [1] [2] [3] 4 [5]  5를 클릭하면 controller를 거친다음 다시 보내준다
			
	String st1 = request.getParameter("totalRecordCount"); // bbslist jsp:param에서 들어오는 값 		
	if(st1 == null){		
		totalRecordCount = 0;		
	}else {		
		totalRecordCount = Integer.parseInt(st1);		
	}
	
	String st2 = request.getParameter("pageNumber");
	if(st2 == null){		
		pageNumber = 0;		
	}else {		
		pageNumber = Integer.parseInt(st2);		
	}
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null){		
		pageCountPerScreen = 0;		
	}else {		
		pageCountPerScreen = Integer.parseInt(st3);		
	}
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null){		
		recordCountPerPage = 0;		
	}else {		
		recordCountPerPage = Integer.parseInt(st4);		
	}
	
	
	// 총 페이지 수 
	int totalPageCount = totalRecordCount / recordCountPerPage;   // recordCountPerPage(=10)
	// ex)     2        =      23           /   10  정확한 페이지수가 안나온다 
	if(totalRecordCount % recordCountPerPage != 0 ){
		totalPageCount++;     //  2 + 1 = 3 pages
	}
	
	// 시작 페이지(screenStartPageIndex)         << [1][2][3]....[10] >>   pageNumber는 0부터 시작된다 
	int screenStartPageIndex = ((pageNumber + 1)/pageCountPerScreen) * pageCountPerScreen;
	// pageNumber가 1이 였을때       0    =       0~8           / 10           *  10
	// [1]~[10]
	// 10   					  =   9~18		 	  / 10           *  10
	// [11]~[20]
	
	// 끝페이지   시작페이지에 + 10 을 해주면 끝페이지 
	int screenEndPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	
	
	// 끝페이지를 다시 계산 [1] ~ [10]   35개라고 가정했을 때 [1] ~ [4]
	if(screenEndPageIndex > totalPageCount){
		screenEndPageIndex = totalPageCount; // 갱신해준다 ? 
	}
	   
	
	// 끝페이지 계산
	if((pageNumber + 1) % pageCountPerScreen == 0){ // 페이지 넘버가 9 인지 19인지 29인지 ? 
		screenStartPageIndex = (((pageNumber + 1)/ pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
		//    0              =        9      + 1 /   10                *       10            -   10   => 0
		screenEndPageIndex = pageNumber + 1;  // 10
	}
	
	System.out.println("pageNumber:" + pageNumber);  // 현재 페이지 [1] ~ [10] 그다음페이지 [11] ~ [20]
	System.out.println("totalPageCount:" + totalPageCount); // 총 페이지 수: [1] ~ [12] -> 12페이지가 나온다  
	System.out.println("screenStartPageIndex:" + screenStartPageIndex); // [1] or [11] or [21]이 될 수 있다. 
	System.out.println("screenEndPageIndex:" + screenEndPageIndex); // 
%>	

<%-- 페이지가 나오는 부분 --%>
<div style="float: left; width: 96%; text-align: center;">

	<%-- << --%>
	<a href="#none" title="처음페이지" onclick="goPage('0')">
		<img alt="" src="images/arrow_first.gif" style="width: 9px; height: 9px;">
	</a>&nbsp;
	
	<%
	// <
	if(screenStartPageIndex > 1){  // 이전페이지
		%>
		
		<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1 %>')">
			<img alt="" src="images/arrow_back.gif" style="width:9px; height: 9px;">
		</a>&nbsp;
		<%
	}
	%>
	
	<%
	// [1]  2  [3]
	for(int i = screenStartPageIndex; i < screenEndPageIndex; i++){
		if(i == pageNumber){  // 현재 페이지   괄호없는 숫자
 			%>
 			<span style="font-size: 9pt; color: #000000; font-weight: bold;">
 				<%=i+1 %>
 			</span>&nbsp;
			
			<% 
		}else {  // 그외 페이지  [숫자]
			%>
			<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)" 
			style="font-size: 7.5pt; color: #000000; font-weight: normal;">
				[<%=i+1 %>]
			</a>&nbsp;
			
			
			<%
		}
	}
	// >
	if(screenEndPageIndex < totalPageCount){
		%>
		<a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>)">
			<img alt="" src="images/arrow_next.gif" style="width: 9px; height: 9px;">
		</a>
		<%
	}
	
	int end_page = 0;
	if(totalPageCount > 0){
		end_page = totalPageCount - 1;
	}
	
	%>
	
	<a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>)">
		<img alt="" src="images/arrow_end.gif" style="width: 9px; height: 9px;">
	</a>
	
</div>









	