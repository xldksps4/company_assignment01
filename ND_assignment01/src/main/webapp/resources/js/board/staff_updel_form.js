
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
