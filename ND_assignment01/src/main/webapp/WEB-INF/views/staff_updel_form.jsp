<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Update</title>

<script type="text/javascript">


</script>

</head>
<body>


<!-- 

등록버튼 클릭 시 JS에서 체크해야 할 사항

◆ 이름, 주민번호, 학력, 부서, 졸업일은 필수사항이다. <<<< 미입력 시 경고메세지 보여준다.
◆기술은 하나 이상 선택해야한다. <<<< 미선택 시 경고 보여준다.
◆올바른 주민번호여야하고 숫자만 입력 가능하다.  <<<< 아닐 시 경고메세지 보여준다.
◆존재하는 졸업일이어야 한다. <<<< 틀린날짜 입력 시 경고메세지 보여준다.

 -->

<!-- 

list에서 수정/삭제 버튼을 클릭 시 팝업으로 열리는 화면이 이곳이다.


수정 클릭 시 JS에서 체크해야할 사항은 staff_input_form.jsp와 동일하다.

삭제 클릭 시 [정말 삭제하시겠습니까?] 알림 물어보며, 확인과 취소 버튼을 제공하여 선택가능하게 한다.

 -->



<f:form action="inputstaff.do" method="post" modelAttribute="hibernateList" onsubmit="return totalDate(this)">
		

<c:choose>
	<c:when test="${empty hibernateList }">
		
	 </c:when>
	 
	 <c:otherwise>
	</c:otherwise>
</c:choose>	
	
		<table border="1">
			<col width="50" />
		    <col width="300" />
		    <col width="100" />
		    <col width="300" />
		    <col width="300" />
		    <col width="300" />
	

	<!-- row1 -->
	<tr>
	<c:choose>
		<c:when test="${dummyUpdateDto }">
			<th colspan="6"><span>사원 정보 수정</span></th>
		</c:when>
		<c:otherwise>
			<th colspan="6"><span>사원 정보 등록</span></th>
		</c:otherwise>
	</c:choose>
	</tr>
	<!-- row2 -->
	<tr>
		<th><span>이름</span></th>
		<td>
			<f:input path="staffname" id="" type="text" value="${hibernateList.staffname }" placeholder="저팔계"/>
			<br/><f:errors path="staffname" cssClass="error" />
		</td>
		<th>주민번호</th>
		<td>
			<input type="text" name="juminno" class="staff-jumin01" value="${fn:substring(hibernateList.juminno,0,6)}" placeholder="830408"/>
			<span> - </span>
			<input type="password" name="juminno" class="staff-jumin02" value="${fn:substring(hibernateList.juminno,7,13)}" placeholder="*******"/>
			
			<br/><f:errors path="juminno" cssClass="error" />
		</td>
		<th>부서</th>
		<td>
			<f:select path="departmentname">
				<f:option value="${hibernateList.departmentname }"></f:option>
				<f:option value="컨설팅사업부">컨설팅사업부</f:option>
				<f:option value="하이테크사업부">하이테크사업부</f:option>
				<f:option value="SI사업부">SI사업부</f:option>
				<f:option value="반도체사업부">반도체사업부</f:option>
				<f:option value="기업부설연구소">기업부설연구소</f:option>
				<f:option value="전략기획팀">전략기획팀</f:option>
				<f:option value="경영지원팀">경영지원팀</f:option>
			</f:select>
			<br/><f:errors path="departmentname" cssClass="error" />
		</td>
	</tr>
	<!-- row3 -->
	<tr>
		<th>학력</th>
		<td>
			<input type="checkbox" name="schoolname" class="finalschool" value="고졸" />고졸&nbsp;
			<input type="checkbox" name="schoolname" class="finalschool" value="전문대졸"/>전문대졸&nbsp;  
			<input type="checkbox" name="schoolname" class="finalschool" value="일반대졸"/>일반대졸
			<br/><f:errors path="schoolname" cssClass="error" />
		</td>
		<th>기술</th>
		<td>
			<input type="checkbox" name="skillname" class="skilltree" value="Java"/>Java
			<input type="checkbox" name="skillname" class="skilltree" value="JSP"/>JSP
			<input type="checkbox" name="skillname" class="skilltree" value="ASP"/>ASP
			<input type="checkbox" name="skillname" class="skilltree" value="PHP"/>PHP
			<input type="checkbox" name="skillname" class="skilltree" value="Delphi"/>Delphi &nbsp; &nbsp; &nbsp; &nbsp; 
		</td>
	</tr>
	<!-- row4 -->
	<tr>
		<th>졸업일</th>
		<td colspan="5" style="text-align: center">
				 <!-- 작성필요 -->
					<select class="graduateday" name="graduateday" onchange="">
						<option></option>
						<c:forEach var="i" begin="1980" end="2019" step="1">
							<option value="${i}">${i}년</option>
						</c:forEach>
					</select> 년
					
					<select class="graduateday" name="graduateday" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}월</option>
						</c:forEach>
					</select> 월
					
					<select class="graduateday" name="graduateday" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}일</option>
						</c:forEach>
					</select> 일 
					<br/><f:errors path="graduateday" cssClass="error" />
		</td>
	</tr>
</table>
<c:choose>
	<c:when test="${dummyUpdateDto}">
	<!-- 경로에 따라 Dto 보내주는걸 다르게. 그 값이 test로 들어오면 -->
	<input type="submit" value="수정" onclick=""/>
	<input type="button" value="삭제" onclick=""/>
	</c:when>
	<c:otherwise>
	<!-- 경로에 따라 Dto 보내주는걸 다르게. 그 값이 test로 안오면 -->	
	<input type="submit" value="등록" onclick=""/>
	<input type="button" value="초기화" onclick=""/>
	</c:otherwise>

</c:choose>
	<!-- row5 -->
	
</f:form>




</body>
</html>