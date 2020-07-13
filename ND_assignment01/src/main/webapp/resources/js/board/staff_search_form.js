//성별, 학력 등 중복 제거
function dupl(this_chk) {
	let this_class = this_chk.getAttribute("class");
	let chkList = document.getElementsByClassName(this_class);

	for (let i = 0; i < chkList.length; i++) {
		if (this_chk != chkList[i]) {
			chkList[i].checked = false;
		}
	}
}

// 년 선택시 자동으로 1월 1일로 변경
function dateChange() {
	let graduateday_class = document.getElementsByClassName("graduateday");

	let option_value = graduateday_class[i].options

	console.log(option_value)
}

// 서브밋 전에 년월일로 바꿔서 값넣기
function totalDate() {
	let graduateday_class = document.getElementsByClassName("graduateday");

	let startDate = "";
	let endDate = "";

	for (let i = 0; i < graduateday_class.length; i++) {
		let date = graduateday_class[i].options[graduateday_class[i].selectedIndex].value

		if (graduateday_class[i].value !== "") {
			if (i <= 2) {
				if (date.length <= 1) {
					date = "0" + date;
					console.log('date >>>' + date)
				}
				startDate += date
			} else {
				if (date.length <= 1) {
					date = "0" + date;
					console.log('date >>>' + date)
				}
				endDate += date
			}
		}
	}

//	for (let i = 0; i < graduateday_class.length; i++) {
		if (startDate && endDate) {
			let form = document.getElementById("form")

			let hidden_start = document.createElement("input")
			hidden_start.setAttribute("type", "hidden")
			hidden_start.setAttribute("name", "graduatedayList")
			hidden_start.value = startDate

			let hidden_end = document.createElement("input")
			hidden_end.setAttribute("type", "hidden")
			hidden_end.setAttribute("name", "graduatedayList")
			hidden_end.value = endDate

			form.appendChild(hidden_start)
			form.appendChild(hidden_end)

		}
//	}

	console.log('startDate'+startDate +'endDate'+endDate)
	startDate*=1
	endDate*=1
	if( startDate > endDate){
		alert('최소날짜가 최대날짜보다 큽니다. 다시 입력하세요. /n [최소졸업일] : '+ startDate + "  ~ [최대졸업일] : " + endDate)
		return false;
	}
	console.log('startDate는 endDate보다 작거나 같습니다.')
	
	

	return true;
}

function onButt() {

	let totalstaffDto = $('#form').serialize()
	console.log('totalstaffDto >>> ' + totalstaffDto)
	location.href = 'goboardlistasc.do?currentPage=1&totalstaffDto='
			+ totalstaffDto
}
