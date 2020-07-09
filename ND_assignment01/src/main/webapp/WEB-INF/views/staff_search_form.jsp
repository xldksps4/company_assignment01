<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>

<!-- include JQ -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- include paging -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/board/boardList.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/board/staff_search_form.js"></script>


<style type="text/css">

table {width: 100%}

ul {text-align: center;}

ul li{
	list-style-type: none; 
/* 	float: left; */
	display: inline;
 	outline: 1px;
/* 	margin-left: 20px; */
	}

</style>


</head>
<body>


<div class="first-div-outline">
	<form id="form" action="goboardlist.do" method="post" onsubmit="return totalDate()">
		<input type="hidden" name="currentPage" value="1"/>
		
		<table border="1">
			<col width="50" />
		    <col width="300" />
		    <col width="100" />
		    <col width="300" />
		    <col width="300" />
		    <col width="300" />
			
			
			<!-- 검색창 영역 -->
			<!-- 매퍼의 category는 검색영역의 class= category와 동일, ==으로 묶인 것들은 option value -->
			
			<!-- row1 -->
			<tr>
				<th colspan="6"><span>사원 정보 검색</span></th>
			</tr>
			<!-- row2 -->
			<tr>
				<th><span>이름</span></th>
				<td>
					<input type="text" name="staffname">
				</td>
				<th>성별</th>
				<td> 
					<input type="checkbox" class="staffgender_class" name="staffgender" value="남" onclick="dupl(this)"/>남&nbsp;
					<input type="checkbox" class="staffgender_class" name="staffgender" value="여" onclick="dupl(this)"/>여
				</td>
				<th>부서</th>
				<td>
					<select name="departmentname">
						<option></option>
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
					<input type="checkbox" class="schoolname_class" value="고졸" name="schoolname" onclick="dupl(this)"/>고졸&nbsp;
					<input type="checkbox" class="schoolname_class" value="전문대졸" name="schoolname" onclick="dupl(this)"/>전문대졸&nbsp;  
					<input type="checkbox" class="schoolname_class" value="일반대졸" name="schoolname" onclick="dupl(this)"/>일반대졸
				</td>
				<th>기술</th>
				<td colspan="3">
					<input type="checkbox" value="Java" name="skillnameList"/>Java
					<input type="checkbox" value="JSP" name="skillnameList"/>JSP
					<input type="checkbox" value="ASP" name="skillnameList"/>ASP
					<input type="checkbox" value="PHP" name="skillnameList"/>PHP
					<input type="checkbox" value="Delphi" name="skillnameList"/>Delphi &nbsp; &nbsp; &nbsp; &nbsp; 
				</td>
			</tr>
			<!-- row4 -->
			<tr>
				<th>졸업일</th>
				<td colspan="5" style="text-align: center">
				 <!-- 작성필요 -->
					<select class="graduateday" name="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1980" end="2019" step="1">
							<option value="${i}">${i}년</option>
						</c:forEach>
					</select> 년
					
					<select class="graduateday" id="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}월</option>
						</c:forEach>
					</select> 월
					
					<select class="graduateday" id="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}일</option>
						</c:forEach>
					</select> 일 ~
					
					
					<select class="graduateday" name="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1980" end="2019" step="01">
							<option value="${i}">${i}년</option>
						</c:forEach>
					</select> 년
					
					<select class="graduateday" id="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}월</option>
						</c:forEach>
					</select> 월
					
					<select class="graduateday" id="" onchange="">
						<option></option>
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}일</option>
						</c:forEach>
					</select> 일
					
					
				</td>
			</tr>
		</table>
		<!-- row5 -->	
		<input type="submit" value="검색"/>
		<input type="button" value="전부검색" onclick="location.href='goboardlist.do?currentPage=1'"/>
		<input type="button" value="초기화" onclick="location.reload();"/>
		<input type="button" value="등록" onclick="location.href='goboardwrite.do'"/>
	</form>
	<!-- row6, selectlist -->

<table border="1">
	<col width="50" />
    <col width="300" />
    <col width="100" />
    <col width="300" />
    <col width="300" />
    <col width="300" />

            <thead>
                <!-- 테이블 : 게시글 목록 영역 -->
                <tr class="header-bar">
                    <th>번호</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>부서</th>
                    <th>졸업일</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty totalList }">
                        <tr>
                            <td colspan="6" id="boardlist-null">작성된 글이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${totalList }" var="totalDto">
                            <tr>
                                <td class="staff-no">${totalDto.staffno }</td>
                                <td class="staff-name">${totalDto.staffname }</td>
                                <td class="staff-gender">${totalDto.staffgender }</td>
                                <td class="staff-department">${totalDto.departmentname }</td>
                                <td class="staff-graduated">${totalDto.graduateday }</td>
                                <td class="board-go" style="text-align: center">
                                	<input type="button" value="수정 /삭제" onclick="boardUpdate(${totalDto.staffno})" />
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <!-- 리스트 영역 end -->
        
        
        
        
        
        
        

			<!-- 페이징 영역 -->
   <footer id="paging">
         <div class="col-md-2"></div>
         <div class="col-md-8">
            <ul class="pagination">
            
               <!-- << : 10 페이지 뒤로-->
               <c:if test="${pagination.startPage >= 11 }">
                  <li onClick="paging()">
                     <a href="goboardlist.do?currentPage=${pagination.currentPage -10}" aria-label="Previous">
                        <span aria-hidden="true">&lt;&lt;</span>
                     </a>
                  </li>
               </c:if>
               
               <!-- < -->
               <c:if test="${pagination.currentPage ne 1 }">
                  <li onClick="paging(${pagination.prevPage })">
                     <a href="goboardlist.do?currentPage=${pagination.prevPage }" aria-label="Previous">
                        <span aria-hidden="true">&nbsp;&lt;&nbsp;</span>
                     </a>
                  </li>
               </c:if>
               
               <!-- 처음 : ... 1 -->
               <c:if test="${pagination.currentPage > 6 }">
                  <li onClick="paging(1)">
                     <a href="goboardlist.do?currentPage=1" aria-label="Previous">
                        <span aria-hidden="true">1</span>
                     </a>
                  </li>
                  <li class="none">
                     <span aria-hidden="true">...</span>
                  </li>
               </c:if>
               
               <!-- 번호 출력 -->
               <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                  <li class="page-item  <c:out value="${pagination.currentPage == pageNum ? 'active' : ''}"/>" id="<c:out value="${pagination.currentPage == pageNum ? 'none' : ''}"/>" onClick="paging('${pageNum }')">
                     <a class="page-link" href="goboardlist.do?currentPage=${pageNum }">${pageNum }</a>
                  </li>
               </c:forEach>
               
               <!-- 끝 : ... N  -->
               <c:choose>
                  <c:when test="${pagination.endPage ne pagination.totalPage && pagination.totalPage > 10}">
                     <li class="none">
                        <span aria-hidden="true">...</span>
                     </li>
                     <li onClick="paging(${pagination.totalPage })">
                        <a href="goboardlist.do?currentPage=${pagination.totalPage }" aria-label="Next"> 
                           <span aria-hidden="true">${pagination.totalPage }</span>
                        </a>
                     </li>
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
               </c:choose>
               
               <!-- > -->
               <c:if test="${pagination.currentPage ne pagination.totalPage }">
                  <li onClick="paging(${pagination.nextPage })">
                     <a href="goboardlist.do?currentPage=${pagination.nextPage }" aria-label="Next"> 
                        <span aria-hidden="true">&nbsp;&gt;&nbsp;</span>
                     </a>
                  </li>
               </c:if>
               
               <!-- >> : 10 페이지 앞으로-->
               <c:if test="${(pagination.currentPage +10) <= pagination.totalPage }">
                  <li onClick="paging(${pagination.nextPage })">
                     <a href="goboardlist.do?currentPage=${pagination.currentPage +10 }" aria-label="Next"> 
                        <span aria-hidden="true">&gt;&gt;</span>
                     </a>
                  </li>
               </c:if>
               
            </ul>
         </div>
         <div class="col-md-2"></div>
   </footer>
   <!-- 페이징 영역 end -->

</div>
</body>
</html>