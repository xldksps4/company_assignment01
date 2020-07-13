
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

function removeCheck2(staffno){
	if(confirm('정말 삭제하시겠습니까?')== true){
		console.log('파라미터 데이터 확인 staffno : '+staffno)
		console.log('파라미터 데이터 타입 확인 staffno : '+ typeof staffno)
		//* {}(jsonObject)가 아닌 단일 값을 post방식으로 보낸다면 @ModelAttribute를 사용하면 된다. >> 그리고 map으로 받으면 된다.
		
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




function removeCheck1(){
	if(confirm('정말 삭제하시겠습니까?')== true){
//		$('hibernateList').val(staffno)
//		console.log('파라미터 데이터 확인 staffno : '+staffno)
		let formData = $('Form').serialize();
		console.log('파라미터 데이터 타입 확인 formData : '+ formData)
		//* {}(jsonObject)가 아닌 단일 값을 post방식으로 보낸다면 @ModelAttribute를 사용하면 된다. >> 그리고 map으로 받으면 된다.
		
		$.ajax({
			type : 'post',				// 타입 (get, post, put 등등)
			url : '/assignment/deleteinfo.do',
			async : true,				// 비동기화 여부(default : true)
			headers: {			// Http header
				'Content-Type' : 'application/json',
			    'X-HTTP-Method-Override' : 'POST'
			},
			dataType : 'text',			// (html, xml, json, text 등등...),
			data : JSON.stringify(formData),		// 보낼 데이터 (Object , String, Array) //{'staffno' : staffno}
			success : function(result){	// 결과 성공 콜백함수
				console.log('성공 !! >>>'+result)
				window.close();
			},
			error : function(request, status, error){
				alert('request, status, error입니다.\n status입니다. ■■■■>>'
						+ request.status+'\n\n message(responseText입니다. ■■■■>>'
						+ request.responseText+'\n + error ■■■■>>'+ error)
			}	
		})

	
	}else{
		return false;
	}
}


function removeCheck(staffno){
	if(confirm('정말 삭제하시겠습니까?')== true){
		console.log('파라미터 데이터 확인 staffno : '+staffno)
		//* {}(jsonObject)가 아닌 단일 값을 post방식으로 보낸다면 @ModelAttribute를 사용하면 된다. >> 그리고 map으로 받으면 된다.
		
		location.href='/assignment/deleteinfo.do?staffno='+staffno
		console.log('삭제값전송선공')
		window.open('about:blank','_self').close();
	
	}else{
		console.log('삭제실패')
		return false;
	}
}

function inputCheck(){
	if(confirm('정말 저장하시겠습니까?')== true){
		console.log('inputCheck(), 파라미터 데이터 확인 할건 없음')
		
		let form = document.getElementById("hibernateList")
		
		form.submit();
		console.log('저장선공')
		window.open('about:blank','_self').close();
	
	}else{
		console.log('저장실패')
		return false;
	}
}









