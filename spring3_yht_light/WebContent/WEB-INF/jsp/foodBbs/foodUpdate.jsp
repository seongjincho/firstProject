<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    
<title>Food sharing</title>

<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<%-- header --%>

<!-- 푸드게시판 글쓰기 JS -->
 <script type="text/javascript" src="js/bbsCommon.js"></script> 
 
<!-- foodWrite.css -->
<link rel="stylesheet" type="text/css" href="css/foodWrite.css"> 

<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

	<c:if test="${login.id == null }">
 		<script type="text/javascript">
        alert("로그인 해 주십시오");
        location.href='login.do';
        </script> 
    </c:if>  


<script>
   
   $(document).ready(function() {
	   
	  listAttach();
	   
      $(".fileDrop").on("dragenter dragover", function (event) {
            event.preventDefault(); // 기본효과를 막음, 파일업로드 영역에 텍스트 파일 또는 이미지파일을 
                              // 드래그 했을때 내용이 바로 보여지는 기본효과를 막기 위함
         });
         // event : jQuery의 이벤트
         // originalEvent : javascript의 이벤트
         $(".fileDrop").on("drop", function(event) {
            event.preventDefault(); // 기본효과를 막음
            // 드래그된 파일의 정보
            var files = event.originalEvent.dataTransfer.files;
            // 첫번째 파일
            var file = files[0];
            // 콘솔에서 파일정보 확인
             console.log(file); 
            
            // ajax로 전달할 폼 객체
            var formData = new FormData();
            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", file);
            
            alert("파일!");
            
            $.ajax({
               type: "post",
               url: "uploadAjax.do",        
               data: formData,
               dataType: "text",
               // processData : true => get방식, false => post방식
               processData: false,
               // contextType : true => application/x-www-form-urlencoded,
               //             false => multipart/form-data
               contentType: false,
               success: function (data) {
            	   
            	  // alert("업로드 성공?");
                  var str ="";
                  

                  console.log(data);

                  // 첨부 파일의 정보
                  var fileInfo = getFileInfo(data);
                  
                  

          
                  // 이미지 파일이면 썸네일 이미지 출력
                  if (checkImageType(data)) {
                	 
 /* 
                  str = "<div><a href='displayFile.do?fileName="+getImageLink(data)+"' target='_blank'>"; 
                  str += "<img src='displayFile.do?fileName="+data+"'></a>";   */
                  	
                  str = "<div><img src='displayFile.do?fileName="+data+"'>"; 
/*                      str += "<div><img src='displayFile.do?fileName="+data+"'>";  
                     
                     // hidden 태그 추가
                     str += "<input type='hidden' name='files' value='"+fileInfo.fullName+"'>"; */
                	
                     
                  // 일반파일이면 다운로드링크
                  }else {
                     str = "<div><a href='displayFile.do?fileName="+data+"'>"+getOriginalName(data)+"</a>";
                     str += "<input type='hidden' name='files' value='"+fileInfo.fullName+"'>";
                  }
                  // 삭제 버튼
                   //str += "<span data-src="+data+">[삭제]</span></div>";
                  
                  $("#uploadedList").append(str);
               }
            });
         });
         
         
      // 원본파일이름을 목록에 출력하기 위해
  	   function getOriginalName(fileName) {
  	      // 이미지 파일이면
  	      if (checkImageType(fileName)) {
  	         return;   // 함수종료
  	      }
  	      // uuid를 제외한 원래 파일 이름을 리턴
  	      var idx= fileName.indexOf("_")+1;
  	      return fileName.substring(idx);
  	   }
  	   
  	   // 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
  	   function getImageLink(fileName) {
  	      // 이미지파일이 아니면
  	      if (!checkImageType(fileName)) {
  	         /* console.log(fileName); */
  	         return; //함수종료
  	      }
  	      // 이미지 파일이면(썸네일이 아닌 원본 이미지를 가져오기 위해)
  	      // 썸네일 이미지 파일명 - 파일경로+파일명   /2019/01/04/s_7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
  	      var front = fileName.substr(0, 12); // 년월일 경로 추출
  	      var end = fileName.substring(14); // 년월일 경로와 s_를 제거한 원본 파일명을 추출
  	     /*  console.log(front); */ // /2019/01/04/
  	      /* console.log(end); */   // 7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
  	      // 원본 파일명 - /2019/01/04/7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
  	      return front+end;   // 디렉토리를 포함한 원본파일명을 리턴
  	   }
  	   
  	   // 이미지 파일 형식을 체크하기 위해
  	   function checkImageType(fileName) {
  	      // i: ignore case(대소문자 무관)
  	      var pattern = /jpg|gif|png|jpeg/i; //정규표현식
  	      return fileName.match(pattern);   // 규칙이 맞으면 true
  	   }
  	    
         
         
         
         $("#delFiles").on("click", function() {
            if(confirm("모든 첨부 파일을 삭제하시겠습니까?")){
               $("#uploadedList").find('div').remove();
            }
            
         });
         
         $("#uploadedList").on("click",".fileDel", function(e) {
 			var that = $(this);	// 클릭한 a태그
 			if($("#uploadedList").find('img').length == 1){
 				e.preventDefault();
 				alert("최소 한장의 이미지 파일을 남겨주세요");
 			}else{
 				$.ajax({ 
 					type: "post",
 					url: "${path}/deleteFile.do",
 					data: {fileName: $(this).attr("data-src")},
 					dataType: "text",
 					success: function(result) {
 						if (result == "deleted") {
 							that.closest('div').next('a').remove();
 							that.closest('div').remove();
 							/* 다시ajax로 bbsinfodetail.do 호출? */
 						}
 					}
 				});
 			}
 		}); 
         
         
         
         
         
         $("#goback").on('click',function(){
            location.href="foodBbsList.do";         
         });
         
         $("#btnSave").click(function() {

          
            var title = $("#title").val();
            var location = $("#local").val();
            var meetingDate = $("#meetingDate").val();
            var file = $("#uploadedList").find('div');
            
            if (title =="") {
               alert("제목을 입력하세요");
               document.form1.title.focus();
               return;
            }
            if (location =="") {
               alert("모임장소를 입력하세요");
               document.form1.local.focus();
               return;
            }
            if (meetingDate =="") {
               alert("모임날짜를 입력하세요");
               document.form1.meetingDate.focus();
               return;
            }
          if (file.length == 0){
            	alert("최소 1장의 이미지파일을 업로드 해주세요");
            	return;
            } 
           
            // 첨부파일 이름을 form에 추가
            var that = $("#form1");
            var str = "";
            // 태그들.each(함수)
            // id가 uploadedList인 태그 내부에 있는 hidden태그들
            
             $("#uploadedList").find('div').each(function(i){
              // str += "<input type='hidden' name='files["+i+"]' value='"+$(this).html()+"'>";    
               str += "<input type='hidden' name='files' value='"+$(this).html()+"'>";    
            });
               
            
           // console.log(str);
            // form에 hidden태그들을 추가
            $("#form1").append(str);
            
            
            var files = str+"";
            //alert(files);
             
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
         });
   });
   
   
	/* ----------------------------------게시글 관련----------------------- */
	
	// 첨부파일 목록 ajax요청 처리
	// $(객체) $("태그") $("#id") $(".class")
	function listAttach() {
		$.ajax({
			type: "post",
			url: "getAttach.do",
			success: function(list) {
				/* console.info("리스트: "+list+"<-여기 값이 들어가야함"); */
				$(list).each(function() {
				// each문 내부의 this : 각 step에 해당되는 값을 의미
				var fileInfo = getFileInfo(this);
				/* console.info("파일인포 : "+fileInfo);
				console.info("겟링크 : "+fileInfo.getLink);
				console.info("파일네임 : "+fileInfo.fileName); */
				
				// a태그안에는 파일의 링크를 걸어주고, 목록에는 파일의 이름 출력
				//var html = "<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				var html = "<div>"+fileInfo.getLink+"</div>";
				var html2 = html.replace('s_','');
	            /* console.info("원본파일?: " + html2); */
	            // href="#" null link, 하이퍼링크로 이동하지 않는다                  삭제 버튼       
	          
		            html2 += "<a href='#none' class='fileDel' data-src='"+this+"'>[삭제]</a></div>";
	            
		             $("#uploadedList").append(html2); 
	            
				});
			}
		});
		
	}
	
   

</script>

<script type="text/javascript">
$(document).ready(function () {
    
    $.datepicker.regional['ko'] = {
              closeText: '닫기',
              prevText: '이전달',
              nextText: '다음달',
              currentText: '오늘',
              monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
              '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
              monthNamesShort: ['1월','2월','3월','4월','5월','6월',
              '7월','8월','9월','10월','11월','12월'],
              dayNames: ['일','월','화','수','목','금','토'],
              dayNamesShort: ['일','월','화','수','목','금','토'],
              dayNamesMin: ['일','월','화','수','목','금','토'],
              weekHeader: 'Wk',
              dateFormat: 'yy/mm/dd',
              firstDay: 0,
              isRTL: false,
              showMonthAfterYear: true,
              yearSuffix: '',
              showOn: 'both',
              buttonText: "달력",
              changeMonth: true,
              changeYear: true,
              showButtonPanel: true,
              yearRange: 'c-99:c+99',
          };
          $.datepicker.setDefaults($.datepicker.regional['ko']);
       
 
          $('#meetingDay').datepicker({ minDate: 0});
        
          $('#meetingDay').datepicker("option", "onClose", function ( selectedDate ) {
        	  					$("#meetingDay").val()
          }); 
       

});
</script>

</head>
<body>

<div class="container">

<div class="headtitle" align="center"><br><br>
	<h2>Food Sharing</h2>
	<br><br>
</div>


<form class="noto" name="form1" id="form1" method="post" action="updateFoodAf.do">
         <div>
                             작성자<input class="a1"  name="id" id="id" size="30" style="font-size: 18px;" value="${login.id }" readonly="readonly">
                 <input type="hidden" id="food_seq" name="food_seq" value="${foodList.food_seq }" readonly="readonly">            
         </div>

         <div>
                             제목<input class="a2" name="title" id="title" size="30" placeholder="&nbsp;&nbsp;제목을 입력해주세요" value="${foodList.title }">
         </div>
         
         <div>
      			모집인원수<input class="a3" size="30"  type="number" id="total_cnt" name="total_cnt" value="${foodList.total_cnt }" >
        				
         </div>
         
         <div>
            	모임장소<input class="a4" type="text" name="local" id="local"  size="30" placeholder="&nbsp;&nbsp;모임장소를 입력해주세요" value="${foodList.local }">
         </div>
         
         <div>
            	모임날짜<input class="a5" type="text" name="meetingDay" id="meetingDay" size="30"  value="<fmt:formatDate value="${foodList.meetingDay }" pattern="yyyy/MM/dd"/>" readonly="readonly">
         </div>
         
         <div>
            	내용<textarea class="a6" rows="20" cols="150" id="content" name="content" placeholder="&nbsp;&nbsp;모임 내용을 작성해주세요">${foodList.content }</textarea> 
         </div>

	<div>
	<br>
	
   <!-- 첨부파일을 드래그할 영역 -->
      첨부파일 등록
      <div class="fileDrop"><i class="dragment">이미지 파일을 여기에 드래그해주세요</i></div>
      <input type="button" id="delFiles" value="모든파일삭제" class="btn btn-secondary">   
   <!-- 첨부파일 목록 -->
      <div id="uploadedList">
      	<div style="margin: 10 10 10 10;" id="imageThumb_${vs.index }" class="imageThumb_">
      	<c:forEach items="${attachList }" var="att">
				 <%--0부터 시작 ~  --%>
						${att.fullname }
				
		</c:forEach>
		</div>
      </div>
   </div>
   
   <div style="width: 650px; text-align: center; margin-bottom: 20px;">
      <button type="button" id="btnSave" class="btn btn-secondary">확인</button>
      <button type="reset" class="btn btn-secondary">취소</button>
      <input type="button" id="goback" value="목록" class="btn btn-secondary">
   </div>
   
</form>


</div>

  <div style="clear:both"></div>
<%-- footer --%>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>

<script type="text/javascript">

</script>