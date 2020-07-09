
// 셀렉트 박스 년 월 일설정
window.onload = function(){
	let graduateday = document.getElementsByName("graduateday")[0].value;
	
	
	let year = graduateday.substring(0,4)
	let month = (graduateday.substring(5,6) == 0)? graduateday.substring(6,7) : graduateday.substring(5,7);
	let day = (graduateday.substring(8,9) == 0)? graduateday.substring(9,10) : graduateday.substring(8,10);
	console.log("year + month + day >>> "+year +"  "+month +"  "+day)
	
	let graduateday_yy = document.getElementsByClassName('graduateday_yy');
	let graduateday_MM = document.getElementsByClassName('graduateday_MM');
	let graduateday_dd = document.getElementsByClassName('graduateday_dd');
	
	
	console.log("y : " + graduateday_yy.length)
	console.log("m : " + graduateday_MM.length)
	console.log("d : " + graduateday_dd.length)
	
	for (let i = 0; i < graduateday_yy.length; i++){
		if(graduateday_yy[i].value === year){
			graduateday_yy[i].selected = true;
			break;
		}
	}
	
	for (let i = 0; i < graduateday_MM.length; i++){
		if(graduateday_MM[i].value === month){
			graduateday_MM[i].selected = true;
			break;
		}
	}

	for (let i = 0; i < graduateday_dd.length; i++){
		if(graduateday_dd[i].value === day){
			graduateday_dd[i].selected = true;
			break;
		}
	}
}

// 학력 중복 제거
function dupl(this_chk){
	let this_class = this_chk.getAttribute("class");
	let chkList = document.getElementsByClassName(this_class);
	
	for(let i = 0; i<chkList.length; i++ ){
		if(this_chk != chkList[i]){
			chkList[i].checked = false;
		}
	}
}

function dataParsing(){
	
	// 주민번호 dto에 형태에 맞게 변환 xxxxxx-xxxxxxx
	let juminno_full = document.getElementById("juminno_front").value + "-" + document.getElementById("juminno_back").value;
	document.getElementById("juminno").value = juminno_full;
	
	// 날자 형식 변환
	let graduateday_class = document.getElementsByClassName("graduateday");
	let graduateday = document.getElementsByName("graduateday")[0];
	
	for(var keyy in graduateday_class){
		console.log("클래스입니다. >>>> 키 :  "+ keyy + " 값 :  "+graduateday_class[keyy])
		}
	
	let fullDate = ""
	for(let i = 0; i<graduateday_class.length; i++){
		let date = graduateday_class[i].options[graduateday_class[i].selectedIndex].value
		if(graduateday_class[i].value !== ""){
			if(date.length <= 1){
				date = "0" + date;
				console.log('date >>>' + date);
			}
			if(i == 0){
				graduateday.value = "";
				graduateday.value = date;
			}else {
				graduateday.value = graduateday.value + "-" + date;
			}
		}
	}
	return true;
}

function removeClick2(staffno){
	if (confirm("정말 삭제하시겠습니까??") == true){    // 확인

// ※ let staffno = document.getElementsByName("staffno")[0].value;
		console.log("staffno   >>"+staffno);
// location.href = "deleteinfo.do?staffno=" + staffno;
		
// ※ let params = $("#폼 아이디, 등등").serialize(); //해당 폼의 모든 객체 정보를 가져오는...
		
// $.ajax({
// method:'GET',
// url : "deleteinfo.do?staffno=",
// async: true,
// data : staffno, //JSON.stringify(파람),
// contentType : application/json,
// success : function(data)
// {
//						
// }
// });
		
		function toDataURL(target, targetUrl) {
			console.log('파라미터 데이터 확인 target : '+target)
	    	console.log('파라미터 데이터 확인 targetUrl : '+targetUrl)
			   const xhr = new XMLHttpRequest();   // 비동기 객체?
			   xhr.onload = function() {
			      if (xhr.status === 200 || xhr.status === 201) {
			    	  console.log('성공한 데이터 확인 target : '+target)
			    	  console.log('성공한 데이터 확인 targetUrl : '+targetUrl)
			    	  console.log('성공 데이터 확인 : ' + JSON.stringify(xhr.response));
			         
			      } else {
			          console.error(xhr.responseText);
			      }
			   };
			   // 전송방식과, 전송할url 설정하고 스트림 열기
			    xhr.open('GET', targetUrl);   // **중요 open은 보내는 스트림을 여는것이다. 항상
												// 스트림을 연후에 응답 받는
												// 타입[responseType], 헤더
												// 설정[setRequestHeader('Content-type',
												// 'application/json');]등을
												// 해야합니다.
			    // 응답받는 데이터 타입설정
			   xhr.responseType = this.responseType;
			   // 전송
			   xhr.send();
			}
		
	 }else{   // 취소
		 console.log('삭제 실패')
	     return false;

	 }
}

function removeCheck(staffno){
	if(confirm('정말 삭제하시겠습니까?')== true){
		console.log('파라미터 데이터 확인 staffno : '+staffno)
		console.log('파라미터 데이터 타입 확인 staffno : '+ typeof staffno)
		//* {}(jsonObject)가 아닌 단일 값을 post방식으로 보낸다면 @ModelAttribute를 사용하면 된다.
		
		$.ajax({
			type : 'post',				// 타입 (get, post, put 등등)
			url : '/assignment/deleteinfo.do',
			async : true,				// 비동기화 여부(default : true)
			headers: {			// Http header
				'Content-Type' : 'application/json',
			    'X-HTTP-Method-Override' : 'POST'
			},
			dataType : 'text',			// (html, xml, json, text 등등...),
			data : JSON.stringify({		// 보낼 데이터 (Object , String, Array)
				'staffno' : staffno
			}),
			success : function(result){	// 결과 성공 콜백함수
				console.log('성공 !! >>>'+result)
				window.close();
			},
			error : function(request, status, error){
				alert('request, status, error입니다. >>>>'+ request+'>>>>'+ status+'>>>>'+ error)
			}	
		})

	
	}else{
		return false;
	}
}














