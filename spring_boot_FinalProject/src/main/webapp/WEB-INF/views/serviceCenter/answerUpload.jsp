<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>QNA Upload</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/question.css' />">
	</head>
	
	<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
		<section class="qusFrom_sec">
			<div class="qusFrom_div">
			<h3>관리자님 답변 달아주세요</h3>
				<c:forEach var="ques" items="${getQNADetail}" varStatus="num">
					<c:choose>
						<c:when test="${empty sessionScope.sid}">
						<br><br>
							<span id="qna_login_text">로그인후 이용 해주세요</span> <br>
							<a id="qna_login" href="<c:url value='/user/loginForm'/>">👉로그인👈</a>
						</c:when>		
						<c:otherwise>
							<form method="post" action="<c:url value='/updateServiceCenter'/>">
								<input type="hidden" name="qusNum" value="${ques.qusNum}">
								<span class="QNA_span">문의 작성</span><br>
								<hr id="qna_hr"/>
								<table class="QF_table" >
									<tr class="QF_table_title">
										<td class="td_title" >문의 유형</td>
										<td class="td_input">
											${ques.queState }
										<hr id="td_hr"/>
										</td> 
									</tr> 
									<tr class="QF_table_title">
										<td class="td_title">작성자</td>
										<td class="td_input"><span style="color:black;"> "${ques.userId}" 님</span><hr id="td_hr"/></td>
									</tr>
									<tr class="QF_table_title">
										<td class="td_title">제목</td>
										<td class="td_input">${ques.queTitle }</td>
									</tr>
									<tr class="QF_table_title">
										<td class="td_title">내용 </td>
										<td class="td_input">${ques.question}<hr id="td_hr"/></td>
									</tr>
									<tr class="QF_table_title">
										<td class="td_title">답변 입력 </td>
										<td class="td_input"><textarea rows="10" cols="70" name="answer" placeholder="답변 내용을 입력해주세요."></textarea><hr id="td_hr"/></td>
									</tr>
									<tr>
										<td colspan="2" id="table_btn"><input id="btn_res" type="reset" value="취소"><input id="btn_sub" type="submit" value="답변등록"></td>
									</tr>
								</table>
							</form>
						</c:otherwise>	
					</c:choose>
				</c:forEach>
			</div>
		</section>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	</body>
</html>