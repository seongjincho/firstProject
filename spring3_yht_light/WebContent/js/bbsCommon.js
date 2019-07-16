// 이미지 파일 여부 판단
function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

// 업로드 파일 정보
function getFileInfo(fullName) {
	var fileName, imgsrc, getLink, fileLink;
	// 이미지 파일일 경우
	if (checkImageType(fullName)) {
		// 이미지 파일 경로(썸네일)
		// imgsrc = "/smoonine/displayFile.do?fileName="+fullName;
		imgsrc = fullName;
		/*console.log("imgsrc= "+imgsrc);*/
		// 업로드 파일명
		fileLink = fullName.substr(14);
		/*console.log("fileLink= "+ fileLink);*/
		// 날짜별 디렉토리 추출
		var front = fullName.substring(0, 14);
		/*console.log("front = " + front);*/
		// s_를 제거한 업로드이미지파일명
		var end = fullName.substr(14);
		/*console.log("end= "+end);*/
		// 원본이미지 파일 디렉토리
		// getLink = "/smoonine/displayFile.do?fileName="+front+end;
		getLink = front+end;
		/*console.log("getLink= "+getLink);*/
	// 이미지 파일이 아닐경우
	}else{
		// UUID를 제외한 원본파일명
		fileLink = fullName.substr(12);
		/*console.log("fileLink= " + fileLink);*/
		// 일반파일디렉토리
		// getLink = "/smoonine/displayFile.do?fileName="+fullName;
		getLink = fullName;
		/*console.log("getLink= " + getLink);*/
	}
	// 목록에 출력할 원본파일명
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	/*console.log("fileName = " + fileName);*/
	// {변수:값} json 객체 리턴
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}

// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
function getImageLink(fileName) {
   // 이미지파일이 아니면
   if (!checkImageType(fileName)) {
       console.log(fileName); 
      return; //함수종료
   }    
   // 이미지 파일이면(썸네일이 아닌 원본 이미지를 가져오기 위해)
   // 썸네일 이미지 파일명 - 파일경로+파일명   /2019/01/04/s_7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
   var front = fileName.substr(0, 12); // 년월일 경로 추출
   var end = fileName.substring(14); // 년월일 경로와 s_를 제거한 원본 파일명을 추출
    console.log(front);  // /2019/01/04/
    console.log(end);   // 7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
   // 원본 파일명 - /2019/01/04/7bad4768-5e7d-4adc-9044-eaf6c9f8ba2f_photo-1503198127388-eff24dabbbea.jpg
   return front+end;   // 디렉토리를 포함한 원본파일명을 리턴
}

//원본파일이름을 목록에 출력하기 위해
function getOriginalName(fileName) {
   // 이미지 파일이면
   if (checkImageType(fileName)) {
      return;   // 함수종료
   }
   // uuid를 제외한 원래 파일 이름을 리턴
   var idx= fileName.indexOf("_")+1;
   return fileName.substring(idx);
}



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
              dateFormat: 'yy-mm-dd',
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
       
          $('#sdate').datepicker({ minDate: 0});
          $('#sdate').datepicker("option", "maxDate", $("#edate").val());
          $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
              
             $("#edate").datepicker( "option", "minDate", selectedDate );
              
          });
        
          $('#edate').datepicker();
          $('#edate').datepicker("option", "minDate", $("#sdate").val());
          $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
              $("#sdate").datepicker( "option", "maxDate", selectedDate );
          });
       

});


