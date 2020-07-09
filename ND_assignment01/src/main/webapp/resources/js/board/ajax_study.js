//비동기 전송을 위한 자바스크립트 클래스
//생성자 인자전달에 http 설정값 전달.
//메소드 : 기본적인 get방식, post방식 구현
class Xhr{
	//생성자
	constructor(url, method, responseType, contentType, jsonObject){
		// #1
		this.xhr = new XMLHttpRequest();	//자바스크립트의 비동기를 전송하는 객체
		this.url = url;						//this.url == (Java) private String url = url
		this.method = method;
		this.responseType = responseType;	//responseType || 'json' 가능하지만, 권장하지 않음. set 사용 권장 
		this.contentType = contentType;
		this.jsonObject = jsonObject;
	}
	
	/*
	  *get, set
	 	1. set을 정의하면 해당 클래스를 생성할 때 작동한다.
	 	2. get, set은 정의하지 않아도 이미 자동 생성되어있다.(명시해도 괜찮다.)
	 	3. get사용은 this.url
	 	4. set사용은 this.url = value
	 */
	get url(){
		return this._url;	//언더바를 통해 루프 도는 것을 방지
	}
	set url(url){
		this._url = url;
	}
	get method(){
		//console.log("get method() 실행")
		return this._method;
	}
	set method(method){
		console.log('set method(value) 실행')
		this._method = (method === undefined)? 'GET' : method;
	}
	get responseType(){
		return this._responseType;
	}
	set responseType(responseType){
		this._responseType = (responseType === undefined)? 'json' : responseType;
	}
	get contentType(){
		//console.log('get contentType() 실행')
		return this._contentType;
	}
	set contentType(contentType){
		this._contentType = (contentType === undefined)? 'application/x-www-form-urlencoded; charset=utf-8' : contentType;
	}												//	쿼리스트링, HTTP POST 요청의 default 밈타입
	get jsonObject(){
	    //console.log('get jsonObject() 실행')
	    return this._jsonObject;
	}
	set jsonObject(jsonObject){
		//console.log('set jsonObject(${this.jsonObject}) 실행')
		this._jsonObject = (jsonObject === undefined)? {} : jsonObject;
	}
	
	// 일반적인 비동기 GET. POST 요청 후 응답
	async_DataLoad(callBack){
		const xhr = this.xhr
		
		// #4 onreadystatechange : 준비상태(200,404,500,...)가 바뀌었을 때 트리거가 되는 이벤트
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){	//xhr.DONE는 서버에서 정상 응답되었을때
				if(xhr.status === 200 || xhr.status === 201){
					// 응답시 받은 데이터 확인
					 console.log('성공 데이터 확인 : ' + JSON.stringify(xhr.response));
					 
					// 데이터 콜백에 전달
					 if(callBack){
						 callBack(xhr.response)
					 }
				}else{
					console.error('서버 에러 : '+xhr.response);
				}
			} else if(xhr.readyState === 4){
				console.error('네트워크 에러 : '+ xhr.responseText);
			}
		}
		/*
		 request후, 웹에서 response가 트리거되는 순서
		 
		 		onreadystatechange			// 준비상태가 바뀌었습니다. 
		 	readyState === 4, xhr.DONE		// 서버에서 정상응답되었습니다.
		 			↙	↓	↘
		 	onload	/ onerror /	onabort		// onload  : 웹 페이지 동적·정적 모든 자원을 포함한 모든 내용을 완전히로드 한 후에
		 												 <body> 내의 스크립트 실행 시.
		 									// onerror : 오류로 인해 [문서    / 이미지]의 로딩이 중단 시.
		 									// onabort : 오류로 인해 [오디오 / 비디오]의 로딩이 중단 시.
		 */
	}
	
	// 비동기 GET방식 >> XMLHttpRequest()	: url 오픈 >> 헤더 설정 >> 전송 >> 값을 받아온다(응답).
	async_GET(callBack){
		const xhr = this.xhr;
		
		callBack = callBack || false;	//값이 있으면 콜백, 없으면 콜백없음
		
		// #4 응답 >>> 응답 데이터 받기 
		this.async_DataLoad(callBack);
		
		if(this.method === 'GET' || this.method === 'get'){
			if(this.contentType === 'application/x-www-form-urlencoded; charset=utf-8'
				|| this.contentType === 'application/x-www-form-urlencoded'){
			
				if(this.jsonObject ==={}){
					//#2. 열기 : 쿼리스트링 없음
					xhr.open(this.method, this.url);
					console.log('GET 방식 전송 : 쿼리스트링 없음')
				} else{
					let query = '';
					let params = this.jsonObject;
					for (let key in params){
						query += key + '=' + params[key]+'&';
					}
					//#2. 열기 : 쿼리스트링 있음 >>> 요청할 url + 쿼리스트링
					xhr.open(this.method, this.url + '?'+ query)
					console.log('GET 방식 전송 : 쿼리스트링 있음 >>'+ this.url+'?'+query)
				}
				//#2. 응답 받을 타입 설정
				xhr.responseType = this.responseType;
			} else{
				console.log('Content-Type이 맞지 않습니다. >>> get방식이면 "application/x-www-form-urlencoded; charset=utf-8" 으로 입력하세요. ')
			}
			console.log('GET 방식으로 요청하세요')
			
		}
		//#3 전송 : GET방식 전송
		xhr.send();
	}
	//-------------------------------------------------- get방식 전송 끝
	
	// 비동기 POST방식
	async_POST(callBack){
	      const xhr = this.xhr;
	      
	      callBack = callBack || false;
	      
	      // #4 응답 >>> 응답 데이터 받기
	      this.async_DataLoad(callBack);
	      
	      if(this.method === "POST" || this.method === "post"){
	         if(this.contentType === "application/json; charset=utf-8"
	            || this.contentType === "application/json"){      // Content-type가 쿼리스트링이 아니라면
	            
	            // #2. 열기 : 메소드 설정, 요청할 url 설정 
	            xhr.open(this.method, this.url);      
	            // #2. 응답 받을 타입 설정
	            xhr.responseType = this.responseType;      
	            // #2. 전송 방식 설정 : Content-type = application/json
	            xhr.setRequestHeader('Content-type', this.Content-type);      
	         
	         } else {
	            console.log("Content-Type가 맞지 않습니다. >>> post방식이면 'application/json; charset=utf-8'으로 입력하세요. ")
	         }
	      } else {
	         console.log("POST 방식으로 요청하세요")
	      }
	      
	      if(this.jsonObject === {}){
	         // #3. 전송  : body없음
	         console.log("POST 전송,  body 없음") 
	         xhr.send();                              
	      } else {
	         console.log("POST 전송,  body 있음 :" +  JSON.stringify(this.jsonObject));
	         // #3. 전송 : body있음 >>> post 방식일때는 보낼 데이터를 send(body)에 인자로 전달한다 >> Request payload. 
	         //  이때 만약 JSON.stringify()를 생략한다면 Request payload를 사용하는 것이 아닌 query String parameters를 사용하는 것이다.
	         xhr.send(JSON.stringify(this.jsonObject));
	      }
	   }
}