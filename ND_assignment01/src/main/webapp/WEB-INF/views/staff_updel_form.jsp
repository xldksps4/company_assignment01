<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Update</title>
</head>
<body>



<!-- 

list에서 수정/삭제 버튼을 클릭 시 팝업으로 열리는 화면이 이곳이다.


수정 클릭 시 JS에서 체크해야할 사항은 staff_input_form.jsp와 동일하다.

삭제 클릭 시 [정말 삭제하시겠습니까?] 알림 물어보며, 확인과 취소 버튼을 제공하여 선택가능하게 한다.

 -->











<table border="1">
	<!-- row1 -->
	<tr>
		<th colspan="6"><span>사원 정보 수정</span></th>
	</tr>
	<!-- row2 -->
	<tr>
		<th><span>이름</span></th>
		<td>
			<input type="text" placeholder="저팔계">
		</td>
		<th>주민번호</th>
		<td> 
			<input type="text" placeholder="830408"/>
			<span> - </span>
			<input type="password" placeholder="*******"/>
		</td>
		<th>부서</th>
		<td>
			<select name="departmentname">
				<option value="default">&nbsp;</option>
				<option value="컨설팅사업부">컨설팅사업부</option>
				<option value="하이테크사업부">하이테크사업부</option>
				<option value="SI사업부">SI사업부</option>
				<option value="반도체사업부">반도체사업부</option>
				<option value="기업부설연구소">기업부설연구소</option>
				<option value="전략기획팀">전략기획팀</option>
				<option value="경영지원팀">경영지원팀</option> 
			</select>
		</td>
	</tr>
	<!-- row3 -->
	<tr>
		<th>학력</th>
		<td>
			<input type="checkbox" value="고졸"/>고졸&nbsp;
			<input type="checkbox" value="전문대졸"/>전문대졸&nbsp;  
			<input type="checkbox" value="일반대졸"/>일반대졸
		</td>
		<th>기술</th>
		<td>
			<input type="checkbox" value="Java"/>Java
			<input type="checkbox" value="JSP"/>JSP
			<input type="checkbox" value="ASP"/>ASP
			<input type="checkbox" value="PHP"/>PHP
			<input type="checkbox" value="Delphi"/>Delphi &nbsp; &nbsp; &nbsp; &nbsp; 
		</td>
	</tr>
	<!-- row4 -->
	<tr>
		<th>졸업일</th>
		<td>
		 <!-- 작성필요 -->
		</td>
	</tr>
</table>
	<!-- row5 -->
	<input type="button" value="수정" onclick=""/>
	<input type="button" value="삭제" onclick=""/>
	




</body>
</html>