<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 

등록버튼 클릭 시 JS에서 체크해야 할 사항

◆ 이름, 주민번호, 학력, 부서, 졸업일은 필수사항이다. <<<< 미입력 시 경고메세지 보여준다.
◆기술은 하나 이상 선택해야한다. <<<< 미선택 시 경고 보여준다.
◆올바른 주민번호여야하고 숫자만 입력 가능하다.  <<<< 아닐 시 경고메세지 보여준다.
◆존재하는 졸업일이어야 한다. <<<< 틀린날짜 입력 시 경고메세지 보여준다.

 -->

	<h1>사원정보 등록 페이지입니다.</h1>




<form id="form" action="inputStaff.do" method="post" onsubmit="return totalDate()">



<c:choose>
	<c:when test="${empty totalList }">
		<!-- 값 전부 널 취급 -->
	 </c:when>
		<table border="1">
			<col width="50" />
		    <col width="300" />
		    <col width="100" />
		    <col width="300" />
		    <col width="300" />
		    <col width="300" />
	

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
</c:choose>
	<!-- row5 -->
	<input type="button" value="수정" onclick=""/>
	<input type="button" value="삭제" onclick=""/>
</form>	



</body>
</html>