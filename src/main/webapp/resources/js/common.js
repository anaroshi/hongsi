/**
 * validateForm
 * trimStr
 * returnFalse
 */
 
function $validateForm(form) {
	
	let len = $('form').find('.fieldChk').length;
	console.log("len : "+len);
		
	for(vi=0;vi<=len;vi++) {
	
 		let $this = $(form.elements[vi]);
 		let fieldType = $this.attr("data-type");
 		console.log("fieldType : "+fieldType);
		if(fieldType != "hidden" && fieldType != "password" && fieldType != undefined) {

			let fieldName = $this.attr("name");
			let fieldValue = trimStr($this.val());
			let fieldTitle = $this.attr("data-fieldTitle");
			
//			if(fieldTitle=='주문품 대분류' && fieldValue=='') return false;

			console.log("type : "+fieldType+", name : "+fieldName);
			console.log("value : "+fieldValue+", title : "+fieldTitle);
			console.log("-----------------------------------------------");
						
			if($(".fieldChk").attr("required") != null && $(".fieldChk").attr("required") != false && fieldType == "radio") {
				fieldValue = $('input:radio:checked').val();
			}
			
//			if($(".fieldChk").attr("required") != null && $(".fieldChk").attr("required") != false && fieldValue == "") {
			if(fieldTitle !='입고일자' && fieldValue == "") {
				alert(fieldTitle+"은(는) 필수 입력 항목입니다.");				
				return returnFalse($this);  
			}			
			
			if($(".fieldChk").attr("required") != null && checkSpecialChar2(fieldValue, $(".fieldChk").attr("filter"))) {
				alert(fieldTitle+"에 다음과 같은 문자는 입력할 수 없습니다.");
				return returnFalse($this);  
			}
		}
	}
	return true;
}


function validateForm(form) {
	console.log("------------------validateForm");

	let formLen = $('form [name]').length;
	for(vi=0;vi<formLen;vi++) {

		//document.form1.elements['txt4'].getAttribute('myTag')
		
		let $formField = $('.fieldChk');
		let fieldType = $formField.attr("data-type");
		console.log("$formField : "+$formField);
		console.log("fieldType : "+fieldType);
		
		if(fieldType != "hidden" && fieldType != "password") {
			let fieldName = $formField.attr("name");
			let fieldValue = trimStr($formField.attr("value"));
			let num =  $formField.attr("data-num");
			let fieldTitle = $formField.attr("data-fieldTitle");
			
			console.log("fieldName : "+ fieldName);
			console.log("fieldValue : "+ fieldValue);
			
			if($formField.attr("required") != null && $formField.attr("required") != false && fieldType == "radio") {
				fieldValue = "";
				let wi = vi;
				while (form.elements[wi].type == "radio") {
					if(form.elements[wi].checked == true) {
						fieldValue = form.elements[wi].value;
					}
				}
				form.elements[wi].value = fieldValue;				
			}
			
			if($formField.attr("required") != null && $formField.attr("required") != false && fieldValue == "") {
				alert(fieldTitle+"은(는) 필수 입력 항목입니다.");
				console.log("returnFalse => "+returnFalse($formField));
				return returnFalse($formField);
			}			
			
			if($formField.attr("required") != null && checkSpecialChar2(fieldValue, $formField.attr("filter"))) {
				alert(fieldTitle+"에 다음과 같은 문자는 입력할 수 없습니다.");
				return returnFalse($formField);
			}
		}
	}
	return true;
}
	
function trimStr(str) {
	if(str == null) return "";
	let count = str.length;
	let len = count;
	let st = 0;
	while ((st<len)&&(str.charAt(st) <= ' ')) {
		st++;
	}
	
 	while ((st<len)&&(str.charAt(len-1) <= ' ')) {
		len--;
	}
	return ((st<len) && (len<count))?str.substring(st,len):str;		
}
	
function returnFalse(formField) {	
	formField.focus();
	return false;
}

// 허용하지 않는 문자 체크2
function checkSpecialChar2(fieldValue, str) {
	for(sc=0;sc<str.length;sc++) {
		let code = str.charCodeAt(sc);
		let ch = str.substr(sc, 1).toUppercase();
		code = parseInt(code);
		if(fieldValue.indexOf(ch) >= 0) {
			return true;
		}
	}
	return false;
}

/**
* 입력값이 NULL인지 체크

*/
function isNull(input) {
    if (input.value == null || input.value == "") {
        return true;
    }
    return false;
}

/**
* 입력값에 스페이스 이외의 의미있는 값이 있는지 체크

* ex) if (isEmpty(form.keyword)) {
*         alert("검색조건을 입력하세요.");
*     }
*/
function isEmpty(input) {
    if (input.value == null || input.value.replace(/ /gi,"") == "") {
        return true;
    }
    return false;
}

/**
* 입력값에 특정 문자(chars)가 있는지 체크
* 특정 문자를 허용하지 않으려 할 때 사용
* ex) if (containsChars(form.name,"!,*&^%$#@~;")) {
*         alert("이름 필드에는 특수 문자를 사용할 수 없습니다.");
*     }
*/
function containsChars(input,chars) {
    for (var inx = 0; inx < input.value.length; inx++) {
       if (chars.indexOf(input.value.charAt(inx)) != -1)
           return true;
    }
    return false;
}

/**
* 입력값이 특정 문자(chars)만으로 되어있는지 체크

* 특정 문자만 허용하려 할 때 사용
* ex) if (!containsCharsOnly(form.blood,"ABO")) {
*         alert("혈액형 필드에는 A,B,O 문자만 사용할 수 있습니다.");
*     }
*/
function containsCharsOnly(input,chars) {
    for (var inx = 0; inx < input.value.length; inx++) {
       if (chars.indexOf(input.value.charAt(inx)) == -1)
           return false;
    }
    return true;
}

/**
* 입력값이 알파벳인지 체크

* 아래 isAlphabet() 부터 isNumComma()까지의 메소드가
* 자주 쓰이는 경우에는 var chars 변수를 
* global 변수로 선언하고 사용하도록 한다.
* ex) var uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
*     var lowercase = "abcdefghijklmnopqrstuvwxyz"; 
*     var number    = "0123456789";
*     function isAlphaNum(input) {
*         var chars = uppercase + lowercase + number;
*         return containsCharsOnly(input,chars);
*     }
*/
function isAlphabet(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 알파벳 대문자인지 체크

*/
function isUpperCase(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 알파벳 소문자인지 체크
*/
function isLowerCase(input) {
    var chars = "abcdefghijklmnopqrstuvwxyz";
    return containsCharsOnly(input,chars);
}

/**
* 입력값에 숫자만 있는지 체크

*/
function isNumber(input) {
    var chars = "0123456789";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 알파벳,숫자로 되어있는지 체크

*/
function isAlphaNum(input) {
    var chars 
= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 숫자,대시(-)로 되어있는지 체크
*/
function isNumDash(input) {
    var chars = "-0123456789";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 숫자,콤마(,)로 되어있는지 체크

*/
function isNumComma(input) {
    var chars = ",0123456789";
    return containsCharsOnly(input,chars);
}

/**
* 입력값이 사용자가 정의한 포맷 형식인지 체크

* 자세한 format 형식은 자바스크립트의 ''regular expression''을 참조
*/
function isValidFormat(input,format) {
    if (input.value.search(format) != -1) {
        return true; //올바른 포맷 형식
    }
    return false;
}

/**
* 입력값이 이메일 형식인지 체크
* ex) if (!isValidEmail(form.email)) {
*         alert("올바른 이메일 주소가 아닙니다.");
*     }
*/
function isValidEmail(input) {
//    var format = /^(\S+)@(\S+)\.([A-Za-z]+)$/;
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    return isValidFormat(input,format);
}

/**
* 입력값이 전화번호 형식(숫자-숫자-숫자)인지 체크
*/
function isValidPhone(input) {
    var format = /^(\d+)-(\d+)-(\d+)$/;
    return isValidFormat(input,format);
}

/**
* 입력값의 바이트 길이를 리턴

* ex) if (getByteLength(form.title) > 100) {
*         alert("제목은 한글 50자(영문 100자) 이상 입력할 수 없습니다.");
*     }
* Author : Wonyoung Lee
*/
function getByteLength(input) {
    var byteLength = 0;
    for (var inx = 0; inx < input.value.length; inx++) {
        var oneChar = escape(input.value.charAt(inx));
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

/**
* 입력값에서 콤마를 없앤다.

*/
function removeComma(input) {
    return input.value.replace(/,/gi,"");
}

/**
* 선택된 라디오버튼이 있는지 체크

*/
function hasCheckedRadio(input) {
    if (input.length > 1) {
        for (var inx = 0; inx < input.length; inx++) {
            if (input[inx].checked) return true;
        }
    } else {
        if (input.checked) return true;
    }
    return false;
}

/**
* 선택된 체크박스가 있는지 체크

*/
function hasCheckedBox(input) {
    return hasCheckedRadio(input);
}

