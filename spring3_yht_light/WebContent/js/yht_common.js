/*******************************************************************************
 * 시  스  템 : 
 * 파  일  명 : yht_common.js
 * 설      명 : 유한테크노스 공통 자바스크립트
 ******************************************************************************/

//-------------------------------------------------------------------
// 전역변수와 상수를 정의 시작
//-------------------------------------------------------------------
/*팝업 관련*/
var	arrPop = new Array();
var popcnt = 0;

/*date 관련*/
var DATE_DELIMITER = "-";

/*항목 타입 관련*/
var TYPE_NONE 	= 0;
var TYPE_MONEY 	= 1;
var TYPE_DOLLAR = 2;
var TYPE_DATE 	= 3;
var TYPE_NUMBER = 4;
var TYPE_ALPHALOWERNUM  = 5;
var TYPE_HOUR   = 6;
var TYPE_MINUTE = 7;

/*항목 체크 결과 관련*/
var SUCCESS 		 = 0;
var ERR_REQUIRED 	 = 1;
var ERR_FORMAT 		 = 2;
var ERR_DATE 		 = 10;
var ERR_NUMBER		 = 21;
var ERR_MAXLENGTH	 = 22;
var ERR_NUMBER_MINUS = 24;
var ERR_MONY_MINUS	 = 25;
var ERR_EMAIL   	 = 26;
var ERR_HOUR         = 27;
var ERR_MINUTE       = 28;

/*객체 색상 관련*/
var BG_COLOR_WHITE 	= "white";
var BG_COLOR_YELLOW = "yellow";

/*메세지 관련*/
var MSG_ERR010 = "필수 입력 항목입니다.";
var MSG_ERR020 = "잘못된 데이터 형식입니다.";
var MSG_ERR030 = "잘못된 날짜 형식입니다.[YYYY"+DATE_DELIMITER+"MM"+DATE_DELIMITER+"DD]";
var MSG_ERR031 = "잘못된 연월 형식입니다.[YYYY"+DATE_DELIMITER+"MM]";
var MSG_ERR032 = "잘못된 날짜 형식입니다.[MM"+DATE_DELIMITER+"DD]";
var MSG_ERR033 = "잘못된 연도 형식입니다.[YYYY]";
var MSG_ERR034 = "날짜의 기간이 잘못 되었습니다.";
var MSG_ERR035 = "E-MAIL 형식이 잘못 되었습니다.";
var MSG_ERR036 = "5자 이상 입력하세요.";
var MSG_ERR037 = "11 글자를 초과 입력할 수 없습니다.";
var MSG_ERR038 = " 글자를 초과 입력할 수 없습니다.";
var MSG_ERR039 = " 체크박스를 찾을 수 없습니다.";
var MSG_ERR040 = "체크박스를 선택하세요.";
var MSG_ERR041 = " 글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ";
var MSG_ERR042 = "문자를 초과 입력 하였습니다.";
var MSG_ERR100 = "예기치 않은 에러가 발생하였습니다. 시스템 관리자에게 문의 하시기 바랍니다.";
var MSG_ERR101 = "'-' 문자는 입력할 수 없습니다.";
var MSG_ERR102 = "아래 내용을 복사하여 <Script> 태그 내에 복사 한 후 순서를 조절합니다.";
var MSG_ERR103 = "시간 설정이 잘못 되었습니다. [00~23]";
var MSG_ERR104 = "분 설정이 잘못 되었습니다. [00~59]";

/*항목 순서 관련*/
var TAB_ORDER = new Array();

/*웹 컨텍스트*/
var WEB_CONTEXT = "/";

/* 브라우저 버전체크 여부 */
var VERSION_CHECK = true;
//-------------------------------------------------------------------
// 전역변수와 상수를 정의 끝
//-------------------------------------------------------------------

function frameInit(context, verCheck) {
	
	// 웹 컨텍스트 세팅
	if(context != null){
		WEB_CONTEXT = context.indexOf("jsessionid") > -1 ? context.substring(0, context.indexOf("jsessionid") - 1) : context;
	}
	
	// 브라우저 버전 체크 여부
	if(verCheck == null){
		VERSION_CHECK = true;
	}else{
		VERSION_CHECK = verCheck;
	}
	
	// 인자 : 1.index
	// 1) normal : 일반 jsp
	// 2) popup : 팝업 jsp
	// 2.arg0, arg1, arg2 여유분 인자

	for (var f = 0; f < document.forms.length; f++) {

		var mForm = document.forms[f];
		var iElements = mForm.elements.length;

		for (var i = 0; i < iElements; i++) {
			if (mForm.elements[i].getAttribute("right") != null) {
				mForm.elements[i].style.textAlign = "right";
			}

			// 각각의 elements에 해당되는 이벤트를 핸들링할 함수를 지정한다.
			if (mForm.elements[i].type) { 

				switch (mForm.elements[i].type) {

				case "password":
					mForm.elements[i].onkeypress = f_onkeypress;
				case "select-one":
					mForm.elements[i].onkeypress = f_onkeypress;
				case "select-multiple":
					mForm.elements[i].onkeypress = f_onkeypress;
				case "checkbox":
					mForm.elements[i].onkeypress = f_onkeypress;
				case "radio":
					mForm.elements[i].onkeypress = f_onkeypress;
				case "text":

					if (mForm.elements[i].getAttribute("money") != null) {
						mForm.elements[i].onkeyup1 = mForm.elements[i].onkeyup;
						mForm.elements[i].iType = TYPE_MONEY;
						mForm.elements[i].style.imeMode = "disabled";
						mForm.elements[i].onkeyup = f_onkeyup;
					} else if (mForm.elements[i].getAttribute("dollar") != null) {
						mForm.elements[i].iType = TYPE_DOLLAR;
						mForm.elements[i].style.imeMode = "disabled";
					} else if (mForm.elements[i].getAttribute("date") != null) {
						mForm.elements[i].onkeyup1 = mForm.elements[i].onkeyup;
						mForm.elements[i].iType = TYPE_DATE;
						mForm.elements[i].style.imeMode = "disabled";
						mForm.elements[i].onkeyup = f_onkeyup;
					} else if (mForm.elements[i].getAttribute("number") != null){
						mForm.elements[i].iType = TYPE_NUMBER;
						mForm.elements[i].style.imeMode = "disabled";
					} else if (mForm.elements[i].getAttribute("alphanum") != null){
						mForm.elements[i].iType = TYPE_ALPHALOWERNUM;
						mForm.elements[i].style.imeMode = "disabled";						
					} else if (mForm.elements[i].getAttribute("hour") != null){
						mForm.elements[i].iType = TYPE_HOUR;
						mForm.elements[i].style.imeMode = "disabled";
					} else if (mForm.elements[i].getAttribute("minute") != null){
						mForm.elements[i].iType = TYPE_MINUTE;
						mForm.elements[i].style.imeMode = "disabled";						
					}
					else
						mForm.elements[i].iType = TYPE_NONE;

					// 한글을 텍스트박스에 입력할 때 onkeypress 이벤트를 인식하지 못하므로 onkeydown이벤트를
					// 사용한다.
					mForm.elements[i].onkeypress = f_onkeypress;

					mForm.elements[i].format = f_format;
					mForm.elements[i].remove_format = f_remove_format;
					mForm.elements[i].all_remove_format = f_all_remove_format;

					mForm.elements[i].validate = f_validate;
					mForm.elements[i].validate_display = f_validate_display;
					mForm.elements[i].blur_display = f_blur_display; // added

					mForm.elements[i].onfocus = f_onfocus;
					mForm.elements[i].onblur = f_onblur;

					break;

				case "textarea":
					mForm.elements[i].iType = TYPE_NONE;

					mForm.elements[i].onfocus = f_onfocus;
					mForm.elements[i].onblur = f_onblur;
					mForm.elements[i].onkeypress = f_onkeypress;

					mForm.elements[i].format = f_format;
					mForm.elements[i].remove_format = f_remove_format;

					mForm.elements[i].validate = f_validate;
					mForm.elements[i].validate_display = f_validate_display;
					mForm.elements[i].blur_display = f_blur_display; // added

					break;
				case "file":
				case "hidden":
					if (mForm.elements[i].getAttribute("money") != null) {
						mForm.elements[i].iType = TYPE_MONEY;
						mForm.elements[i].all_remove_format = f_all_remove_format;
					}

					break;
				default:
					break;

				} // end of switch
			} // if (mForm.elements[i].type)
		} // end of for loop

		// submitevent핸들러를 수정한다.
//		mForm.oldSubmit = mForm.onsubmit;
		mForm.onsubmit  = f_onsubmit;
		
	}// form loop
	
	//jsp page에서 tabindex 정보를 주지 않았을 경우 세팅한다.
	if(TAB_ORDER.length == 0){
		for (var f = 0; f < document.forms.length; f++) {
			
			var mForm = document.forms[f];
			var iElements = mForm.elements.length;
			
			for (var i = 0; i < iElements; i++) {
				var elType = mForm.elements[i].type;
				
				if(elType == "text"){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}else if(elType == "password"){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}else if(elType == "textarea"){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}else if(elType.indexOf("radio") > -1){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}else if(elType.indexOf("check") > -1){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}else if(elType.indexOf("select") > -1){
					TAB_ORDER.push(mForm.elements[i].name + "|" + mForm.name);
					mForm.elements[i].iForm = mForm.name;
				}
			} // end of for loop
		}// form loop
	}
	
	f_tabindex();
	
	// 브라우저를 체크하여 explorer 6.0 이하의 경우 팝업을 띄운다.
	if(VERSION_CHECK) checkNavigator();
}

///////////////////////////////////////////////////////////////////////////////
// 함수명 : f_onkeypress()
// 내  용 : 키입력을 처리하기위한 핸들러
// Event : KeyPress
// Object : text
f_onkeypress = function(e){

  var sFilter ;

  switch(this.iType){
    case TYPE_DATE :
                     sFilter="[0-9]";
                     break;
    case TYPE_MONEY :
    				 if( this.getAttribute("filter") == null)
    				 	sFilter="[-0-9]";
    				 else
					 	sFilter= this.getAttribute("filter");   				 
                     break;
    case TYPE_DOLLAR :
					if(this.getAttribute("intonly")==null){   // 정수만 입력
						sFilter="[-.0-9]";
					}else{
						sFilter="[-0-9]";
					}
                     break;
    case TYPE_NONE :
                     sFilter= this.getAttribute("filter");
                     break;
    case TYPE_ALPHALOWERNUM :
					 if( this.getAttribute("filter") == null)
						 	sFilter="[0-9,a-z,A-Z]";
						 else
						 	sFilter= this.getAttribute("filter");   				 
			          break;
    case TYPE_NUMBER :
    				if (this.getAttribute("number") != null &&  (this.getAttribute("intonly")==null)) {
						sFilter="[-.0-9]";
					} else {
						sFilter="[-0-9]";
					}

                    break;
    case TYPE_HOUR :
			    	sFilter="[0-9]";
			    	break;
    case TYPE_MINUTE :
			        sFilter="[0-9]";
			        break;
  }

  // 필터가 지정된 경우만 검사한다.
  if(sFilter){

        var sKey=String.fromCharCode(window.event ? window.event.keyCode : e.which);
        var re=new RegExp(sFilter);

        // Enter는 키검사를 하지 않는다.
        if(sKey!="\r" && !re.test(sKey)){ 
        	if(window.event) {event.returnValue=false;}else{e.returnValue=false;}
        }
   }

/*
 * //한글을 텍스트박스에 입력할 때 onkeypress 이벤트를 인식하지 못하므로 onkeydown이벤트를 사용한다. var sKey =
 * (event.which) ? event.which : event.keyCode; if(sFilter != "" && null !=
 * sFilter) { if(96 <= sKey) { if(105 < sKey) { event.returnValue=false; } }
 * else { if(sKey > 31 && (48 > sKey || 57 < sKey) && (sKey !=37 && sKey != 38 &&
 * sKey !=39 && sKey != 40 && sKey != 46)) { event.returnValue=false; } } }
 */

    // Enter 입력시 자동으로 다음페이지로 넘어가는경우를 막는다.
    // textarea에 대해 enter입력 가능하도록 수정
    if ( this.type!="textarea" && String.fromCharCode(window.event ? window.event.keyCode : e.which) == "\r") {
    	
			if(window.event) {event.returnValue=false;}else{e.returnValue=false;}
    	 // 다음 항목으로 넘어가는 부분 추가
    	 // f_nextObject(this);
    }
}

var TABINDEX = "";
//배열을 이용한 tabindex 부여
function f_tabindex(){
	var multiName = new Array();
	
	for(var i=0 ; i<TAB_ORDER.length ; i++){
		var	orderInfo = TAB_ORDER[i];
		var arrInfo = orderInfo.split('|');
		
		var obj_org = eval("document." + arrInfo[1] + "." + arrInfo[0]);
		var obj;
		
		var isExist = false;
		for(var j=0 ; j<multiName.length ; j++){
			if(multiName[j] == arrInfo[0]){
				isExist = true;
				break;
			}
		}
		if(!isExist){
			multiName.push(arrInfo[0]);
		}else{
			continue;
		}
		
		if(obj_org.length == undefined){
			obj = obj_org;
		}else{
			if(obj_org.length != undefined && (obj_org.type == "select-one" || obj_org.type == "select-multiple")){
				obj = obj_org;
			}else{
				obj = obj_org[0];
			}
		}
		
		var objType = obj.type;
		
		// multiple select
		if((objType.indexOf("select-multiple") > -1) && obj.length != undefined && obj.length > 0){
			obj.tabIndex = i+1;
		
		// 동일 이름의 항목
		}else if(obj.length != undefined && obj.length > 0){
			obj.tabIndex = i+1;
				
		// 일반 항목
		}else{
			obj.tabIndex = i+1;
		}
		
		if(i == 0) obj.focus();
	}
}

// 탭 오더 순서를 정하기 위한 내용을 보여준다.
function f_showTabOrder(){
	var orderString = "TAB_ORDER = [";
	
	for(var i=0 ; i<TAB_ORDER.length ; i++){
		orderString += "\'" + TAB_ORDER[i] + "\'";
		
		if(i + 1 != TAB_ORDER.length){
			orderString += ", ";
		}
	}
	
	orderString += "];";
	prompt(MSG_ERR102, orderString);
}

f_onkeyup = function(e)
{
	var iKey = window.event ? window.event.keyCode : e.which;

	if (this.iType == TYPE_MONEY)
	{
		if (iKey == 109 || iKey == 188 || iKey == 190 || (iKey >= 48 && iKey <= 57)) 
			this.value = editNumber(this.value);
	}

    if (this.iType == TYPE_DATE)
	{
		if (iKey == 109 || (iKey >= 48 && iKey <= 57))
			this.value = editDate(this.value);
	}

	if (eval('this.onkeyup1'))
		this.onkeyup1();
}

function editNumber(value)
{
    var isMinus = false;
    var hasPoint = false;
    var new_val_rear = "";
    var pure_num ="";
    var new_val ="";
    var below_point ="";
    var jus_read = "";
    var head_num = 0;
    var loop_count = 0;
    var idx;

    if ( value.charAt(0) == '-' ) isMinus = true;

    for(var i = 0 ; (i < ( value.length -1 )) && !hasPoint ; i++ )
    {
        if( value.charAt(i) == '.' ) {
            below_point = value.substring( i , value.length );
            value = value.substring( 0, i );
            hasPoint = true;
        }
    }

    for(var j = 0 ; j < ( value.length ); j++ )
    {
        if((value.charAt(j) >= '0' &&
        value.charAt(j) <= '9' )||value.charAt(j)=='.')
        pure_num = pure_num + value.substr(j,1);
    }


    if(pure_num.toString().length > 3 ){
      head_num = pure_num.length % 3;

      loop_count = ( pure_num.toString().length - head_num ) / 3;

      if(head_num != 0) new_val = pure_num.substr(0,head_num) + ",";
      new_val = new_val + pure_num.substr(head_num, 3);

      for(var idx= 0 ; idx < ( loop_count - 1) ; idx++)
      {
          new_val = new_val + ",";
          new_val = new_val + pure_num.substr(head_num + (3*(idx+1)),  3);
      }
   }
      else new_val = pure_num;

    if ( isMinus ) new_val = "-" + new_val;
    if ( hasPoint ) new_val = new_val + below_point;


    return new_val;
}

function editDate(sValue)
{
	if (sValue == null)
		return "";

	sValue = "" + trim(sValue);

	if (sValue.length == 0 || sValue.length == 10)
		return sValue;

	if (sValue.length == 4 ||sValue.length == 7)
		sValue = sValue + DATE_DELIMITER;

	return sValue;
}

///////////////////////////////////////////////////////////////////////////////
//함수명 : f_onfocus()
//내  용 : 각 element의 focus를 위한 이벤트핸들러
//Event  : onFocus()
//Object : elements
function f_onfocus(){
	this.remove_format();
	if(this.select) this.select();
}

function _onblur1(){}
function _onblur2(){}
function _onblur3(){}

function f_onblur(){
	_onblur1();
	_onblur2();
	_onblur3(this);
	
	if (this.getAttribute("upper")!=null)
		this.value=this.value.toUpperCase();
	
	if (this.getAttribute("lower")!=null)
		this.value=this.value.toLowerCase();
	
	this.blur_display(this.format());  // onblur 시 formatting check 결과 표시
	
	// email 형식 체크
	if (this.getAttribute("email")!=null){
		if(!checkMail(this)){
			this.blur_display(ERR_EMAIL);
		}
	}
	
	// 시간 체크
	if(this.value != "" && this.getAttribute("hour") != null){
		var hour = parseFloat(this.value);
		
		if(hour >= 24){
			this.blur_display(ERR_HOUR);
		}else{
			if(hour < 10){
				this.value = "0" + hour;
			}else{
				this.value = "" + hour;
			}
		}
	}
	
	// 분 체크
	if(this.value != "" && this.getAttribute("minute") != null){
		var minute = parseFloat(this.value);
		
		if(minute >= 60){
			this.blur_display(ERR_MINUTE);
		}else{
			if(minute < 10){
				this.value = "0" + minute;
			}else{
				this.value = "" + minute;
			}
		}
	}
	
	if( this.value == "" || ( this.getAttribute("do_value") && this.value != this.getAttribute("do_value"))){
		if(this.getAttribute("do_disable") )
		f_enable( this.getAttribute("do_disable") );
	}else{
		if(this.getAttribute("do_disable") )
		f_disable( this.getAttribute("do_disable") );
	}
	

}

// '-'기호의 위치가 부적절한 위치에 삽입되었는지 확인
function f_blur_display(ret){
	
    switch(ret){
    	case ERR_MONY_MINUS :
    		alert(MSG_ERR101);
    		break;
        
    	case ERR_NUMBER_MINUS:
    		alert(MSG_ERR101);
    		break;
        
    	case ERR_EMAIL:
    		alert(MSG_ERR035);
    		break;
    	
    	case ERR_HOUR:    	
    		alert(MSG_ERR103);
    		break;
    	
    	case ERR_MINUTE:
    		alert(MSG_ERR104);
    		break;
    	default :
    		return;
  }

   this.style.backgroundColor = BG_COLOR_YELLOW;
   this.focus();

   return  false;
}

//////////////////////////////////////////////////////////////////////////////
//함수명 :  isNum (v)
//내  용 : 입력이 숫자임을 검사한다.
function isNum (v){
	return (v.toString() && !/\D/.test(v));
}

///////////////////////////////////////////////////////////////////////////////
//함수명 : f_validate()
//내  용 : 각 입력 값에 대한 입력 체크
//       Select는 필수입력여부만을 검사한다.
function f_validate(){
	if ( !this.value ) this.value = "";

	 var nMode=this.getAttribute("number");
	 var fMode=this.getAttribute("filter");
	 var sTmp= this.value;
	 var result;
	
	 if (fMode !=null) {
	     // 공백제거
	 var tmp =new String;
	 for(var i=0 ;i < fMode.length; i++) {
	     if (fMode.charAt(i) !=" "){
	             tmp =tmp+fMode.charAt(i);
	         }
	     }
	     fMode = tmp;
	 }



	 
	 if (nMode !=null || (fMode !=null &&  fMode == "[0-9]") ) {
		 
		 for(var i=0;i<sTmp.length;i++){
			 result=sTmp.charCodeAt(i);
			 
		     if (result >= 12593) {
		    	 if(this.getAttribute("comment")){
		    		 this.setAttribute("msg", "[" + this.getAttribute("comment") +  "] 숫자 타입 오류");
		    	 }else{
		             this.setAttribute("msg", "숫자 타입 오류");
		                 return ERR_NUMBER;
		         }
	         }
	     }
	 }

	switch(this.iType){
		case TYPE_MONEY :
			if(this.value.lastIndexOf("-")>=1) return ERR_NUMBER_MINUS;
			if (this.getAttribute("required")!=null && this.value =="" ) return ERR_REQUIRED;
		    break;
		    
		case TYPE_DATE :
			var sDateType = this.getAttribute("date");
		
			if (sDateType == "YYYYMM" || sDateType == "yyyymm") {
				var sDate = this.value.replace(/(\-|\/)/g,"");
				var sFormat = "YYYYMM";
			
				if(this.getAttribute("required") != null && !this.value)
				return ERR_REQUIRED;
			
				if (this.value && sDate.length != 6) {
					this.setAttribute("msg", MSG_ERR031);
					return ERR_DATE;
				}
			
				if (this.value && (!isNum(sDate.substr(0,4)) || !isNum(sDate.substr(4,2)))) {
					this.setAttribute("msg", MSG_ERR031);
					return ERR_DATE;
				}
			
				if (this.value) {
					iYear	= eval(sDate.substr(0,4));
					iMonth	= eval(sDate.substr(4,2));
				
					if((iYear      != null && iYear   >= 1900 && iYear  <= 2100
						&& iMonth  != null && iMonth  >  0    && iMonth <  13) == false) {
						this.setAttribute("msg", MSG_ERR031);
						return ERR_DATE;
					}
				}
			
				if(this.getAttribute("st_dt") != null) {
					endDt = eval(this.getAttribute("st_dt"));
					var tmpDt = endDt.value.replace(/(\-|\/)/g,"");
					
					if (tmpDt && sDate && (tmpDt > sDate)) {
						this.setAttribute("msg", MSG_ERR034);
						return ERR_DATE;
					}
				}
			
				break;
			
			} else if (sDateType == "YYYY" || sDateType == "yyyy") {
				var sDate = this.value.replace(/(\-|\/)/g,"");
				var sFormat="YYYY";
		
				if (this.getAttribute("required")!=null && !this.value )
					return ERR_REQUIRED;
				if (this.getAttribute("required")==null && !this.value )
					return SUCCESS;
		
		
				if ( sDate.length != 4 ) {
					this.setAttribute("msg",MSG_ERR033);
					return ERR_DATE;
				}
				if ( !isNum(sDate))  {
					this.setAttribute("msg",MSG_ERR033);
					return ERR_DATE;
				}
				
				iYear=eval(sDate);
		
				if((iYear      != null && iYear   >= 1900 && iYear  <= 2100) == false) {
					this.setAttribute("msg",MSG_ERR033);
					return ERR_DATE;
				}
		
				if(this.getAttribute("st_dt") != null) {
					endDt = eval(this.getAttribute("st_dt"));
					var tmpDt = endDt.value.replace(/(\-|\/)/g,"");
		
					if (tmpDt && sDate && (tmpDt > sDate)) {
						this.setAttribute("msg", MSG_ERR034);
						return ERR_DATE;
					}
				}
		
		        break;
		
			} else if (sDateType == "MMDD" || sDateType == "mmdd") {
				var sDate = this.value.replace(/(\-|\/)/g,"");
				var sFormat = "MMDD";
				var aDaysInMonth = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
		
				if(this.getAttribute("required") != null && !this.value)
					return ERR_REQUIRED;
		
				if (this.value && sDate.length != 4) {
					this.setAttribute("msg", MSG_ERR032);
					return ERR_DATE;
				}
		
				if (this.value && (!isNum(sDate.substr(0,2)) || !isNum(sDate.substr(2,2)))) {
					this.setAttribute("msg", MSG_ERR032);
					return ERR_DATE;
				}
		
				if (this.value) {
					iMonth	= eval(sDate.substr(0,2));
					iDay	= eval(sDate.substr(2,2));
		
					var iDaysInMonth = aDaysInMonth[iMonth-1];
		
					if((iMonth  != null && iMonth > 0 && iMonth <  13
							&& iDay != null && iDay   > 0 && iDay   <= iDaysInMonth) == false) {
						this.setAttribute("msg",MSG_ERR032);
						return ERR_DATE;
					}
				}
		
				if(this.getAttribute("st_dt") != null) {
					endDt = eval(this.getAttribute("st_dt"));
					var tmpDt = endDt.value.replace(/(\-|\/)/g,"");
		
					if (tmpDt && sDate && (tmpDt > sDate)) {
						this.setAttribute("msg", MSG_ERR034);
						return ERR_DATE;
					}
				}
		
				break;
		
			} else {
		
				var sDate=this.value.replace(/(\-|\/)/g,"");
				var sFormat="YYYYMMDD";
				var aDaysInMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		
				if (this.getAttribute("required")!=null && !this.value )
					return ERR_REQUIRED;
				if (this.getAttribute("required")==null && !this.value )
					return SUCCESS;
		
				if ( sDate.length != 8 ) return ERR_DATE;
		
				if ( !isNum(sDate.substr(0,4))
						||!isNum(sDate.substr(4,2))
						||!isNum(sDate.substr(6,2)))  return ERR_DATE;
		
		
				iYear=eval(sDate.substr(0,4));
				iMonth=eval(sDate.substr(4,2));
				iDay=eval(sDate.substr(6,2));                // CH07
		
				var iDaysInMonth = (iMonth != 2) ? aDaysInMonth[iMonth-1] : ((iYear%4 == 0 && iYear%100 != 0 || iYear%400 == 0) ? 29 : 28);
		
				if((iYear      != null && iYear   >= 1900 && iYear  <= 2100
						&& iMonth  != null && iMonth  >  0    && iMonth <  13
						&& iDay    != null && iDay    >  0    && iDay   <= iDaysInMonth) == false) {
					this.setAttribute("msg",MSG_ERR030);
					return ERR_DATE;
				}
		
				if(this.getAttribute("st_dt") != null) {
					endDt = eval(this.getAttribute("st_dt"));
					var tmpDt = endDt.value.replace(/(\-|\/)/g,"");
		
					if (tmpDt && sDate && (tmpDt > sDate)) {
						this.setAttribute("msg", MSG_ERR034);
						return ERR_DATE;
					}
				}
		
		        break;
			}
			
		case TYPE_DOLLAR :
			if (this.getAttribute("required")!=null && this.value =="" ) return ERR_REQUIRED;
		    break;
 	}

	if (this.getAttribute("required")!=null && this.value =="" ) return ERR_REQUIRED;

	var sMode=this.getAttribute("MAXLENGTH");
	if (sMode) {
		var result;
		var cnt=0;
		var sValue= this.value;

		cnt = getByteLength(sValue);

		if (sMode < cnt) {
		// CH201
// 예: <INPUT type="text" name="txt_cre_dt" size="20"
// maxlength="8"
// date required>
			switch(this.iType){
				case TYPE_DATE :
					if( cnt > 10) {
						this.setAttribute("msg", MSG_ERR042);
						return ERR_MAXLENGTH;
					} else return SUCCESS;
	
				case TYPE_MONEY :
					var thisStr	= sValue.replace(/(\,)/g,"");
					var thisLen = thisStr.length;
	
				if( sMode < thisLen) {
					return ERR_MAXLENGTH;
				} else return SUCCESS;
			}
			
			this.setAttribute("msg", MSG_ERR042);
	        return ERR_MAXLENGTH;
	     }
	 }
	
	return SUCCESS;
}

function f_validate_display(){
	var ret     = this.validate();
	var comment = this.getAttribute("comment");
	
	if(comment == null){
		comment = "";
	}else{
		comment = "[" + comment + "] ";
	}

	switch(ret){
		case SUCCESS :
	       if (this.style.backgroundColor == BG_COLOR_YELLOW){
	           this.style.backgroundColor = BG_COLOR_WHITE;
	       }
	       return true;
	       break;
		case ERR_REQUIRED :
	       alert(comment + MSG_ERR010);
	       break;
	
		case ERR_DATE:
	       if(this.getAttribute("msg"))
	         alert(this.getAttribute("msg") );
	       else
	         alert(comment + MSG_ERR030);
	       break;
	
		case ERR_FORMAT :
	       if(this.getAttribute("msg"))
	         alert(this.getAttribute("msg")+"[" + this.getAttribute("mask")+"]" );
	       else
	         alert(comment + MSG_ERR020 + "["+this.getAttribute("mask")+"]");
	       break;
	
		case ERR_NUMBER :                                 // CH02
	         alert(this.getAttribute("msg") );
	         break;
		case ERR_NUMBER_MINUS :
	         alert(comment + MSG_ERR101);
	         break;
	
		case ERR_MAXLENGTH :                                 // CH03
	         alert(this.getAttribute("msg") );
	         break;
		default :
	       alert(comment + MSG_ERR100);
	       break;
	}
	
	this.style.backgroundColor = BG_COLOR_YELLOW;
	this.focus();
	
	
	return  false;
}

///////////////////////////////////////////////////////////////////////////////
//함수명 :f_format()
///////////////////////////////////////////////////////////////////////////////
function f_format() {
	var isMinus = false;

	switch (this.iType) {
	case TYPE_NUMBER:
		if (this.value.lastIndexOf("-") >= 1)
			return ERR_NUMBER_MINUS;
		
		var num    = "";
		var tmpNum = this.value;
		
		if(this.value.lastIndexOf(".") != this.value.indexOf(".")){
			for(var i = 0 ; i<tmpNum.length ; i++){
				if(tmpNum.charAt(i) != "." || tmpNum.indexOf(".") == i){
					num = num + tmpNum.charAt(i);
				}
			}
		}else{
			num = tmpNum;
		}
		if(num.indexOf(".") == 0){
			num = "0" + num;
		}
		if((num.indexOf(".") + 1) == num.length && num.length != 0){
			num = num.substring(0, num.indexOf("."));
		}
			
		this.value = num;
		
		break;

	case TYPE_MONEY:
		if (this.value.lastIndexOf("-") >= 1)
			return ERR_MONY_MINUS;

		if (this.value.indexOf("-") == 0)
			isMinus = true;

		var sMoney = trim(this.value.replace(/,/g, ""));

		if (!isMinus && sMoney.length <= 2)
			return sMoney;
		if (isMinus && sMoney.length <= 3)
			return sMoney;

		var fir_sMoney = "";
		var sec_sMoney = "";
		var flag = true;
		for (var i = 0; i < sMoney.length; i++) {
			if ('.' == sMoney.charAt(i)) {
				flag = false;
				continue;
			}
			if (flag == true)
				fir_sMoney += sMoney.charAt(i);
			else
				sec_sMoney += sMoney.charAt(i);
		}

		var tMoney = "";
		var i;
		var j = 0;
		var tLen = fir_sMoney.length;

		if (!isMinus && fir_sMoney.length <= 3) {
			return; // 값을 수정하지 않는다.
		}

		if (isMinus && fir_sMoney.length <= 4) {
			return; // 값을 수정하지 않는다.
		}

		for (var i = 0; i < tLen; i++) {
			if (i != 0 && (i % 3 == tLen % 3)) {
				if (isMinus && i == 1) {
					// do nothing -100000인경우 -,100,000이 되지 않도록 한다
				} else {
					tMoney += ",";
				}
			}

			if (i < fir_sMoney.length)
				tMoney += fir_sMoney.charAt(i);

		}

		if (sec_sMoney.length > 0)
			this.value = tMoney + "." + sec_sMoney;
		else
			this.value = tMoney;
		break;

	case TYPE_DOLLAR:
		if (this.value.lastIndexOf("-") >= 1)
			return ERR_MONY_MINUS;
		if (this.value.indexOf("-") == 0)
			isMinus = true;

		var sMoney = this.value.replace(/,/g, "");

		if (!isMinus && sMoney.length <= 2)
			return sMoney;
		if (isMinus && sMoney.length <= 3)
			return sMoney;

		var fir_sMoney = "";
		var sec_sMoney = "";
		var flag = true;
		for (var i = 0; i < sMoney.length; i++) {
			if ('.' == sMoney.charAt(i)) {
				flag = false;
				continue;
			}
			if (flag == true)
				fir_sMoney += sMoney.charAt(i);
			else
				sec_sMoney += sMoney.charAt(i);
		}

		switch (sec_sMoney.length) {
		case 0:
			sec_sMoney = "00";
			break;
		case 1:
			sec_sMoney += '0';
			break;
		}

		var tMoney = "";
		var i;
		var j = 0;
		var tLen = fir_sMoney.length;

		if (fir_sMoney.length <= 3)
			return; // 값을 수정하지 않는다.

		for (var i = 0; i < tLen; i++) {
			if (i != 0 && (i % 3 == tLen % 3))
				tMoney += ",";
			if (i < fir_sMoney.length)
				tMoney += fir_sMoney.charAt(i);
		}
		this.value = tMoney + "." + sec_sMoney;
		break;
	case TYPE_DATE:
		var dateType = this.getAttribute("date");
		if (dateType == "YYYYMM" || dateType == "yyyymm") {
			this.value = f_format_mask(this.value, "9999"+DATE_DELIMITER+"99");
		} else if (dateType == "YYYY" || dateType == "yyyy") {
			this.value = f_format_mask(this.value, "9999");
		} else if (dateType == "MMDD" || dateType == "mmdd") {
			this.value = f_format_mask(this.value, "99"+DATE_DELIMITER+"99");
		} else {
			this.value = f_format_mask(this.value, "9999"+DATE_DELIMITER+"99"+DATE_DELIMITER+"99");
		}
		break;
	}
}

///////////////////////////////////////////////////////////////////////////////
//함수명 :f_format_mask()
//내  용 : 날짜입력 포멧을 자동변경한다.
//Event : KeyPress
//Object : Input
function f_format_mask(str, mask) {

	var sStr = str.replace(
			/(\$|\^|\*|\s|\(|\)|\+|\.|\?|\\|\{|\}|\||\[|\]|-|:)/g, ""); // CH13
	var tStr = "";
	var i;
	var j = 0;
	var tLen = sStr.length + 1;

	for (var i = 0; i < sStr.length; i++) {
		tStr += sStr.charAt(i);
		j++;
		if (j < mask.length && mask.charAt(j) != "9")
			tStr += mask.charAt(j++);
	}
	return tStr;
}

///////////////////////////////////////////////////////////////////////////////
//함수명 :f_remove_format()
//내  용 : 모든 입력 포멧을 없앤다.
//Event : OnFocus시 호출되는 함수이다.
//Object : Input

function f_remove_format() {

	switch (this.iType) {

	case TYPE_DATE:
		this.value = trim(this.value.replace(/(\-|\/)/g, "")); // '-'를 제거한다
		break;
	case TYPE_MONEY:
	case TYPE_DOLLAR:
		this.value = trim(this.value.replace(/(\,)/g, "")); // '-'는 제거하지 않는다
		break;
	default:
		// CH01
		break;
	}
}

// /////////////////////////////////////////////////////////////////////////////
// 함수명 :f_all_remove_format()
// 내 용 : 모든 입력 포멧을 없앤다.
// Event : submit시 호출되는 함수이다.
// Date는 "YYYY-MM-DD" 을 유지하고 다른 형식은 Format을 제거한다.
// Object : Input

function f_all_remove_format() {

	switch (this.iType) {

	case TYPE_DATE:
	case TYPE_MONEY:
		this.value = trim(this.value.replace(/(\,)/g, "")); // '-'는 제거하지 않는다
		break;
	case TYPE_DOLLAR:
		this.value = trim(this.value.replace(/(\,)/g, "")); // '-'는 제거하지 않는다
		break;
	default:
		break;
	}
}

// Form 명을 받아서 submit
function submitForm(sAction, bCheck, sFormNm){
	var frm = eval( 'document.' + sFormNm );

	frm.action = sAction;

	if (bCheck)
		frm.onsubmit();
	else
		frm.submit();
}

// /////////////////////////////////////////////////////////////////////////////
// 함수명 : f_onsubmit()
// 내 용 : Form에서 입력값 Submit시 에러체크를 위한 함수
// Event : Submit
// Object : Form
function f_onsubmit() {
	
	var i;
	for (var i = 0; i < this.elements.length; i++) {
		// disabled 인 것은 풀어준다
		if (this.elements[i].getAttribute("disabled")) {
			this.elements[i].disabled  = false; // 풀어줌
			this.elements[i].isDisable = "true"; // disabled 속성이었음을 표시
		}

		if (this.elements[i].validate) {
			if (this.elements[i].validate_display() == false) {
				if (this.elements[i].isDisable == "true") {

					// disabled 속성이었던 elements를 disabled =true 시킨다.
					for ( var j = 0; j < this.elements.length; j++) {
						if (this.elements[j].isDisable == "true") {
							this.elements[j].disabled = true;
						}
					}
				}

				return false;
			}
		}

		if (this.elements[i].type == "select-one") {
			if (this.elements[i].value == "slct_required") {
				alert(MSG_ERR010);
				this.elements[i].style.backgroundColor = BG_COLOR_YELLOW;
				this.elements[i].focus();
				if (this.elements[i].isDisable == "true")
					this.elements[i].disabled = true;
				return;
			}
			
			if(this.elements[i].style.backgroundColor == BG_COLOR_YELLOW){
				this.elements[i].style.backgroundColor = BG_COLOR_WHITE;
			}
			
			if (this.elements[i].isDisable == "true")
				this.elements[i].disabled = true;
		}
	}

//	if (this.oldSubmit && this.oldSubmit() == false) {
//		return;
//	}

	// Formatting을 모두 삭제한다.
	for (var i = 0; i < this.elements.length; i++) {
		if (this.elements[i].all_remove_format)// &&
												// this.elements[i].iType!=TYPE_DATE)
			this.elements[i].all_remove_format();

	}
	
	if (this.getAttribute("debug") != null) {
		this.action = DEBUG_SERVLET;
	}

	// disabled 를 해제 시킨다. //CH01
	for (var i = 0; i < this.elements.length; i++) {
		if (this.elements[i].disabled == true) {
			this.elements[i].disabled = false;
		}
	}
	/*
	 * //input type = 'text' 에서 value에 ' 를 포함한 것은 ''으로 바꾸어 전송 for(i=0; i<
	 * this.elements.length; i++) { if(this.elements[i].type == 'textarea') {
	 * if(this.elements[i].value.indexOf("\'") != -1) { this.elements[i].value =
	 * this.elements[i].value.replace( /\'/g,"\'\'"); } } }
	 */
	// 데이타를 서버로 전송한다.
	this.submit();

	// 다시 Formatting한다.
	for (var i = 0; i < this.elements.length; i++)
		if (this.elements[i].format)
			this.elements[i].format();

	// disabled 속성이었던 elements를 disabled =true 시킨다.
	for (var i = 0; i < this.elements.length; i++) {
		if (this.elements[i].isDisable == "true") {
			this.elements[i].disabled = true;
		}
	}

	return;
}

// 공백여부
function isEmpty(Flds, sMsg) {
	frm = document.frmMain;

	for (var i = 0; i < Flds.length - 1; i++) {
		if (frm.elements[Flds[i]].value == null
				|| frm.elements[Flds[i]].value == '') {
			alert(sMsg[i]);
			frm.elements[Flds[i]].focus();
			return true;
		}
	}

	return false;
}


// 두 날짜의 내용 체크 및 기간 체크
function check_date_between(obj1, obj2){
	if(trim(obj1.value) == "" || trim(obj2.value) == "") return true;
	if(!check_date(obj1) || !check_date(obj2)){return false;}
	
    var d1 = obj1.value.replace(/(\,|\.|\-|\/)/g,"");
    var d2 = obj2.value.replace(/(\,|\.|\-|\/)/g,"");

    if (parseInt(d1) > parseInt(d2)) {
		alert(MSG_ERR034);
		obj1.style.backgroundColor = BG_COLOR_YELLOW;
		obj2.style.backgroundColor = BG_COLOR_YELLOW;
		obj1.focus();
        return false;
    }

	return true;
}

//날짜값 체크
function check_date(obj) {

	var sDate=obj.value.replace(/(\,|\.|\-|\/)/g,"");
	var sFormat="YYYYMMDD";
	var aDaysInMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);

	if ( sDate.length != 8 ) {
		obj.style.backgroundColor = BG_COLOR_YELLOW;
		obj.focus();
		return false;
	}

	if ( !isNum(sDate.substr(0,4)) ||!isNum(sDate.substr(4,2)) ||!isNum(sDate.substr(7,2)))  {
		obj.style.backgroundColor = BG_COLOR_YELLOW;
		obj.focus();
		return false;
	}

    iYear=eval(sDate.substr(0,4));
    iMonth=eval(sDate.substr(4,2));
    iDay=eval(sDate.substr(6,2));                //CH07

    // Check for leap year
    var iDaysInMonth=(iMonth!=2)?aDaysInMonth[iMonth-1]:((iYear%4==0 && iYear%100!=0 || iYear % 400==0)?29:28);

	if( (iDay!=null && iMonth!=null && iYear!=null  && iMonth<13 && iMonth>0 && iDay>0 && iDay<=iDaysInMonth) == false )  {
		obj.style.backgroundColor = BG_COLOR_YELLOW;
		obj.focus();
		return false;
	}
	return true;
}


//String str 에서 문자 a를 찾아 b로 바꾼다
function replace(str,a,b){
    array = new Array(0);
    var newString ='';
    var orgString = new String(str);

    array = orgString.split(a);

    for(var i=0;i<array.length;i++){

        if(i!=array.length){
            newString+=array[i]+b;
        }else{
            newString+=array[i];
        }
    }

    return newString;
}


//이메일체크
function checkMail(email) {
    //var mail_id = frmMain.txt_email.value;
    var mail_id = email.value;
    var mailReg = /\w+@\w+\.{1}(\w|\W)+/g;

    var reg1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
    var reg2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$");

    // 이메일을 입력하지 않았을 경우에는 이메일 체크를 실행하지 않는다.
    if("" == mail_id) return true;

    if(!reg1.test(mail_id) && !reg2.test(mail_id) && !mailReg.test(mail_id)) {
//        alert(MSG_ERR035);
//        email.focus();
        return false;
    }

    // 메일의 길이는 5자 이상 11자 이하이다
//    if(mail_id.substring(0,mail_id.lastIndexOf("@")).length < 5 ) {
//        alert(MSG_ERR036);
//        email.focus();
//        return false;
//    }

//    if(mail_id.substring(0,mail_id.lastIndexOf("@")).length > 11 ) {
//        alert("INSERT LESS THAN 11 CHARACTERS.");
//        email.focus();
//        return false;
//    }
    return true;
}


//-------------------------------------------------------------
//Byte 체크 -- 시작
//[사용예]
//<INPUT TYPE="text" name="nm1" size="10" onBlur="javaScript:checkByte(this,2)">
//INPUT 에서는 MAXLENGTH="13" 로 한글,영문 길이 체크가 가능하다.
//<textarea name="desc" cols="100" rows="10" onBlur="javaScript:checkByte(this,10)"></textarea>
//-------------------------------------------------------------
function getByteLength(input) {
 var byteLength = 0;
 var value;

 if(null == input.value) value = input;
 else value = input.value;

 for (var inx = 0; inx < value.length; inx++) {
     var oneChar = escape(value.charAt(inx));
     if ( oneChar.length == 1 ) {
         byteLength ++;
     } else if (oneChar.indexOf("%u") != -1) {
         byteLength += 2;
     } else if (oneChar.indexOf("%") != -1) {
         byteLength += oneChar.length/3;
     }
 }
 return byteLength;
}

function checkByte(inputBox,size){
 if(getByteLength(inputBox) > size){
     alert( size + MSG_ERR038);
     inputBox.focus();
     return;
 }
}
//-------------------------------------------------------------
//Byte 체크 -- 끝
//-------------------------------------------------------------

//-------------------------------------------------------------------
//PopUp Window Open 함수 스크롤바 유무(PopUpWindowOpen와 동일 + 스크롤여부)
//-------------------------------------------------------------------
function PopUpOnlyOne(surl, popupwidth, popupheight, sScroll)
{
	var popObj;
	
	while(arrPop.length >0){
		popObj = arrPop.pop();
		
		if(popObj != undefined){
			popObj.close();
		}
	}
	sScroll_str = sScroll ? 'yes' : 'no';
	Top = (window.screen.availHeight - popupheight) / 2;
	Left = (window.screen.availWidth - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,scrollbars="+sScroll_str+",resizable=yes,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(surl, "PopUpWindow", Future);
	PopUpWindow.focus();
	arrPop[popcnt++] = PopUpWindow;
}

function PopUp(surl, popupwidth, popupheight, sScroll)
{
	sScroll_str = sScroll ? 'yes' : 'no';
	Top = (window.screen.availHeight - popupheight) / 2;
	Left = (window.screen.availWidth - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=yes,scrollbars="+sScroll_str+",resizable=yes,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(surl, "", Future);
	PopUpWindow.focus();
}

//-------------------------------------------------------------------
//PopUp Modal Window Open 함수1
//-------------------------------------------------------------------
function PopUpShowModal(surl, popupwidth, popupheight, sScroll)
{
	sScroll_str = sScroll ? 'yes' : 'no';
	Top = (window.screen.availHeight - popupheight) / 2;
	Left = (window.screen.availWidth - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;

	Future = "dialogWidth="+popupwidth+"px;dialogHeight="+popupheight+"px;scrollbars="+sScroll_str+";scroll:off;center=yes;border=thin;help=no;status=no;resizable=yes";
	var rtnValue = window.showModalDialog(surl, window, Future);
	rtnValue;
}

//숫자 입력시 자동으로 콤마 추가
function NumericEdit(value)
{
    var isMinus      = false;
    var hasPoint     = false;
    var new_val_rear = "";
    var pure_num     = "";
    var new_val      = "";
    var below_point  = "";
    var jus_read     = "";
    var head_num     = 0;
    var loop_count   = 0;
    var idx;

    if ( value.charAt(0) == '-' ) isMinus = true;

    for(var i = 0 ; (i < ( value.length -1 )) && !hasPoint ; i++ )
    {
        if( value.charAt(i) == '.' ) {
            below_point = value.substring( i , value.length );
            value = value.substring( 0, i );
            hasPoint = true;
        }
    }

    for(var j = 0 ; j < ( value.length ); j++ )
    {
        if((value.charAt(j) >= '0' &&
        value.charAt(j) <= '9' )||value.charAt(j)=='.')
        pure_num = pure_num + value.substr(j,1);
    }


    if(pure_num.toString().length > 3 ){
      head_num = pure_num.length % 3;

      loop_count = ( pure_num.toString().length - head_num ) / 3;

      if(head_num != 0) new_val = pure_num.substr(0,head_num) + ",";
      new_val = new_val + pure_num.substr(head_num, 3);

      for(var idx= 0 ; idx < ( loop_count - 1) ; idx++)
      {
          new_val = new_val + ",";
          new_val = new_val + pure_num.substr(head_num + (3*(idx+1)),  3);
      }
   }
      else new_val = pure_num;

    if ( isMinus  ) new_val = "-" + new_val;
    if ( hasPoint ) new_val = new_val + below_point;

    var last3Zero = /[\.]+(000)$/;
    var last2Zero = /[\.]+(00)$/;
    
    if(last3Zero.test(new_val)){
    	new_val = new_val.substring(0, new_val.length - 4);
    }
    
    if(last2Zero.test(new_val)){
    	new_val = new_val.substring(0, new_val.length - 3);
    }
    
    return new_val;
}

//공백 제거
function trim(value)
{
	//alert("func trim");
  var str;
  var end;
  var result = true;
  for(var j = 0; j < value.length; j++)
  {
    if(value.substring(j, j+1) != " ") {
      str=j;
      break;
    }
  }
  for(var j = value.length-1 ;j> -1; j--)
  {
    if(value.substring(j, j+1) != " ") {
    	end=j;
    	break
    }
  }

  return value.substring(str, end+1);
}

//checkbox 체크여부
function Checkbox_Check(sFormNm, chName){
    var sCount = 0;
    var bNotFound = true;
    for (var i=0; i<sFormNm.length;i++) {
        if (sFormNm[i].type == "checkbox" && sFormNm[i].name == chName) {
            bNotFound = false;

            if (sFormNm[i].checked == true)
	            sCount++;
        }
    }

    if (bNotFound) {
       alert(chName + MSG_ERR039);
       return false;
    }

    if (sCount == 0) {
       alert(MSG_ERR040);
       return false;
    }

   return true;
}

// checkbox 모두선택/해제
function revCheck(theform, chName) {
    for( var i=0; i<theform.elements.length; i++) {
        var ele = theform.elements[i];
        if(ele.name == chName)
        	if( !ele.disabled)
            	ele.checked = !ele.checked;
    }
    return;
}

// checkbox 모두선택
function allCheck(theform, chName) {
    for( var i=0; i<theform.elements.length; i++) {
        var ele = theform.elements[i];
        if(ele.name == chName) {
			if( !ele.disabled)
            	ele.checked = true;
        }
    }
    return;
}

// checkbox 모두해제
function disCheck(theform, chName) {
    for( var i=0; i<theform.elements.length; i++) {
        var ele = theform.elements[i];
        if(ele.name == chName)
            ele.checked = false;
    }
    return;
}

//조회조건을 필수조건으로 체크해야 할때(txet, combo box경우만 체크)
function required_Query(sFormNm, sFld0, sFld1, sFld2, sFld3, sFld4, sFld5, sFld6, sFld7, sFld8, sFld9) {
	var msg_err = "YOU MUST INPUT THIS ITEM.";
	var frm = eval( 'document.' + sFormNm );

	var i = 0;
	do {
		v = eval( 'sFld' + i);
		if( v == undefined) break;
		switch(frm.elements[v].type) {
			case "text":
				if( trim(frm.elements[v].value) == '') {
					alert(msg_err);
					frm.elements[v].style.backgroundColor = "yellow";
					frm.elements[v].focus();
					return true;
				}
				break;
			case "select-one":
				if( frm.elements[v].value == 'slct_required') {
					alert(msg_err);
					frm.elements[v].style.backgroundColor = "yellow";
					frm.elements[v].focus();
					return true;
				}
				break;
			default :
				break;
		}
		i++;
	} while(true)

}

//포커스 위치
function first_focus() {
	var mForm		= null;
	var iElements	= null;
	for (var i = 0 ; i < document.forms.length ; i++) {
		mForm		= document.forms[i];
		iElements	= mForm.elements.length;
		for(var j = 0 ; j < iElements ; j++) {
			switch(mForm.elements[j].type) {
			case "password":
			case "file":
			case "textarea":
			case "checkbox":
			case "radio":
			case "text":
				if (!(mForm.elements[j].disabled || mForm.elements[j].readOnly)) {
					mForm.elements[j].focus(); return;
				}
				break;
			case "select-one":
				if (!mForm.elements[j].disabled) {
					mForm.elements[j].focus(); return;
				}
				break;
			default :
				break;
			}
		}
	}
}

//쿠키 사용 시작
function setCookie(name, value, expiredays)
{
	if(getCookie(name) == null){
		document.cookie = name + "=" + escape(value) + ((expiredays == null ) ? "" : ("; expires=" + expiredays.toGMTString()));
	}
}

function getCookie(sName)
{
  // cookies are separated by semicolons	
  var aCookie = document.cookie.split("; ");
  for (var i=0; i < aCookie.length; i++)
  {
    // a name/value pair (a crumb) is separated by an equal sign
    var aCrumb = aCookie[i].split("=");
    if (sName == aCrumb[0]) {
    	if (typeof(aCrumb[1]) == "undefined" || aCrumb[1] =="" || aCrumb[1] == null) return null;
      return unescape(aCrumb[1]);
    }
  }

  // a cookie with the requested name does not exist
  return null;
}

// 일수를 이용하여 쿠키 세팅
function setCookieDate(keycode, keyValue, date){
	var cookieDate = new Date();
	var today      = new Date();
	
	cookieDate.setDate(today.getDate() + date);
	
	setCookie(keycode, keyValue, cookieDate);
}

// 쿠키 삭제
function deleteCookie(keycode){
	var today      = new Date();
	var expiredays = new Date();
	
	expiredays.setDate(today.getDate() - 1);
	document.cookie = keycode + "=" + escape("") + "; expires=" + expiredays.toGMTString();
}
//쿠키 사용 종료

// 브라우저 체크의 쿠키에 하루 후 일자를 입력하여 세팅을 한다.
function ignoreOneDay(){
	setCookieDate("yht.browser.version.check", "Y", 1);
}

// 브라우저를 체크하여 버전이 7.0 이전의 경우 팝업을 띄움.
function checkNavigator(){
	var browserName    = navigator.appName;
	var browserVersion = navigator.appVersion;
	var cookieValue    = getCookie("yht.browser.version.check");
	
	if((cookieValue == null || cookieValue != "Y") && browserName.indexOf("Microsoft") > -1){
		var verInfo = browserVersion.split(';');

		for(var i=0 ; i<verInfo.length ; i++){
			if(verInfo[i].indexOf("MSIE") > -1){
				var ver = verInfo[i].split(' ');
				
				if(ver.length > 2){
					if(parseFloat(ver[2]) < 7){
						PopUpOnlyOne(WEB_CONTEXT + "Common.wo?method=browserCheck", 280, 310, false);
					}
				}
				break;
			}
		}
	}
}

//상태에 따라서 입력폼을 없애거나 disable시키는 부분
function doDisable(obj){

	if(obj.type == 'text'){
		obj.className = 'input_textfield';
		obj.readOnly  = true;
		obj.style.borderWidth = 0;
	}

	if(obj.type == 'select-one'){
		obj.disabled = true;
	}

	if(obj.type == 'textarea'){
		obj.readOnly = true;
	}

	if(obj.type == 'checkbox'){
		obj.disabled = true;
	}

	if(obj.type == 'radio'){
		obj.disabled = true;
	}
}


//IFrame 사이즈 조정 ex) <IFRAME onLoad="javascript:resizeIFrame('RDFrame')"></IFRAME>
function resizeIFrame(sFrameName) {
    eval("var objBody = "+sFrameName+".document.body;");
    eval("var objFrame = document.getElementById('"+sFrameName+"');");
    ifrmHeight = objBody.scrollHeight + (objBody.offsetHeight - objBody.clientHeight);
    objFrame.style.height = ifrmHeight+1;
}

//text area 내의 바이트 수를 체크
function f_checkLength(frmname, size){
	detail = eval('frmMain.' + frmname);

	if(getByteLength(detail.value) > size){
		v_detail     = assert_msglen(detail.value, size);
     	alert( size + MSG_ERR041);
		detail.value = v_detail;
	}
}

//일정 길이 이후의 문자는 삭제
function assert_msglen(message, maximum)
{
	var inc = 0;
	var nbytes = 0;
	var msg = "";
	var msglen = message.length;

	for (var i=0; i<msglen ; i++) {
		var ch = message.charAt(i);

		if (escape(ch).length > 4) {
			inc = 2;
		} else if (ch == '\n') {
			if (message.charAt(i-1) != '\r') {
				inc = 1;
			}
		} else if (ch == '<' || ch == '>') {
			inc = 4;
		} else {
			inc = 1;
		}
		if ((nbytes + inc) > maximum) {
			break;
		}
		nbytes += inc;
		msg += ch;

	}

	return msg;
}

// 문자가 입력 될 때 갯수가 아닌 바이트로 입력 가능하도록 함
var v_cont = '';
function f_maxlength_check(input, leng_size){
	var value  = input.value;
    var v_leng = 0;
	
    for (var inx = 0; inx < value.length; inx++) {
        var oneChar = escape(value.charAt(inx));
        if ( oneChar.length == 1 ) {
            v_leng++;
        } else if (oneChar.indexOf("%u") != -1) {
            v_leng += 2;
        } else if (oneChar.indexOf("%") != -1) {
            if(oneChar.length/3 == 2){
            	v_leng += 2;
            }
        }
    }
    
    if(leng_size > v_leng){
    	v_cont = value;    
    	return;
    }else{
        input.blur();
        input.value = v_cont;
        input.focus();
        input.select = false;
    }
}

//공통 테이블 선택 팝업
var LTH_COMMON_CODENAME  = "";
var LTH_COMMON_VALUETEXT = "";
var LTH_COMMON_LARGE_CD  = "";

function f_common01_pop(large_cd, codeName, valueText){

	LTH_COMMON_LARGE_CD  = large_cd;
	LTH_COMMON_CODENAME  = codeName;
	LTH_COMMON_VALUETEXT = valueText;

	PopUpOnlyOne(WEB_CONTEXT +"/pCommon.wo?method=popPage", 460, 480, true);
}


// (, ), -, 숫자 만 입력 가능
function dashNumber(obj){				
	obj.value = obj.value.replace(/[^\(\)\-0-9]/g, "");
}

//숫자 만 입력 가능
function onlyNumber(obj){				
	obj.value = obj.value.replace(/[^0-9]/g, "");
}

//-, 숫자 만 입력 가능
function onlyRealNumber(obj, msg){
	if(obj.value == ""){
		return;
	}
	
	var realNum    = /^[-|0-9][0-9]*[\.]?[0-9]{0,3}$/;
	var firstMinus = /^-/;
	
	obj.value = obj.value.replace(/[\,]/g, "");
	
	if(!realNum.test(obj.value)){
		if(msg == undefined || msg == ""){
			alert("숫자 타입 오류입니다. '숫자', '-', '소수 둘째자리' 가 가능합니다.");
		}else{
			alert(msg);
		}
		obj.focus();
		return false;
	}else{
		var arr   = obj.value.split(".");
		var minus = firstMinus.test(obj.value);
		
		if(minus){
			arr[0] = "-" + getNum(arr[0].substring(1));
		}else{
			arr[0] = getNum(arr[0]);
		}
		
		if(arr.length == 1){
			obj.value = arr[0];
		}else{
			obj.value = arr[0] + "." + arr[1];
		}
		
		return true;
	}
}

// 세 자리 숫자마다 쉼표
function getNum(varNum){
	var len = varNum.length;
	
	if(len <= 3){
		return varNum;
	}else{
		return getNum(varNum.substring(0, len - 3)) + ","+ varNum.substring(len - 3, len);
	}
}

// 숫자 '-', '.' 만 입력
function onlyDashPointNumber(obj){
	obj.value = obj.value.replace(/[^\-\.0-9]/g, "");
}

// 알파벳, 숫자, '-', '/' 만
function getCodeUpper(obj){
	obj.value = obj.value.replace(/[^-0-9a-zA-Z\/]/g, "");
	obj.value = obj.value.toUpperCase();
}

// 날짜 형식
function inputDate(obj){
//	obj.value = obj.value.replace(/[^-0-9]/g, "");
//	obj.value = f_format_mask(obj.value, "9999-99-99");
}

// 날짜 체크
function calendarCheck(obj){
	obj.value = obj.value.replace(/[^-0-9]/g, "");
	
	if(!check_date(obj)){
		alert("Wrong Date!!");
		obj.focus();
		return;
	}
	
	obj.value = obj.value.replace(/[^-0-9]/g, "");
	obj.value = f_format_mask(obj.value, "9999-99-99");
}

//날짜 체크
function calendarCheckNullable(obj){
	if(obj.value == "") return;
	
	obj.value = obj.value.replace(/[^-0-9]/g, "");
	
	if(!check_date(obj)){
		alert("Wrong Date!!");
		obj.focus();
		return;
	}
	
	obj.value = obj.value.replace(/[^-0-9]/g, "");
	obj.value = f_format_mask(obj.value, "9999-99-99");
}