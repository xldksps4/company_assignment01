function dupl(this_chk){
	let this_class = this_chk.getAttribute("class");
	let chkList = document.getElementsByClassName(this_class);
	
	for(let i = 0; i<chkList.length; i++ ){
		if(this_chk != chkList[i]){
			chkList[i].checked = false;
		}
	}
}

// 년 선택시 자동으로 1월 1일로 변경  
function dateChange(){
	let graduateday_class = document.getElementsByClassName("graduateday");
	
	let option_value = graduateday_class[i].options
	
	console.log(option_value)
}

// 서브밋 전에 년월일로 바꿔서  값넣기
function totalDate(){
	let graduateday_class = document.getElementsByClassName("graduateday");
	
	let startDate = "";
	let endDate = "";
	
	for(let i = 0; i<graduateday_class.length; i++){
		let date = graduateday_class[i].options[graduateday_class[i].selectedIndex].value
		
			if(graduateday_class[i].value !== ""){
				if(i <= 2 ){
					if(date.length <= 1){
						date = "0" + date;
					}
					startDate += date
				} else {
					if(date.length <= 1){
						date = "0" + date;
					}
					endDate += date
				}
			}
			
	}
	if(graduateday_class[i].value !== ""){
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
	
	
	return true;
}



