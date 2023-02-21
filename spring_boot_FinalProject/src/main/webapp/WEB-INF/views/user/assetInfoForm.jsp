<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자산 정보 입력</title>
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/assetForm.css' />">
		<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
		<script src="<c:url value='/js/assetForm.js'/>"></script>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
			<c:import url="/WEB-INF/views/layout/top.jsp" />
			<c:choose>
				<c:when test="${empty sessionScope.sid}">
					<div class="empty_session_div">
						<span id="qna_login_text">로그인후 이용 해주세요</span> <br>
						<a id="qna_login" href="<c:url value='/user/loginForm'/>">👉로그인👈</a>
					</div>
				</c:when>		
				<c:otherwise>
				<div id="main">
						<form id="assetForm">
							<input type="hidden" id="userId" name="userId" value="${sessionScope.sid}">
							<table>
								<thead>
									<tr>
										<th colspan="2">고객자산입력</th>
									</tr>
									<tr>
										<th colspan="2"><hr></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>자산</td>
										<td><input type="text" class="text" name="userProperty" placeholder="단위(만원)"></td>
									</tr>
									<tr>
										<td>급여</td>
										<td><input type="text" class="text" name="userSalary" placeholder="단위(만원)"></td>
									</tr>
									<tr>
										<td>가입한 예금 이율</td>
										<td><input type="text" class="text" name="userDeposit" placeholder="없으면 0으로 입력해주세요"></td>
									</tr>
									<tr>
										<td>가입한 적금 이율</td>
										<td><input type="text" class="text" name="userSavings" placeholder="없으면 0으로 입력해주세요"></td>
									</tr>
									<tr>
										<td>대출 이자율</td>
										<td><input type="text" class="text" name="userLoans" placeholder="없으면 0으로 입력해주세요"></td>
									</tr>
									<tr>
										<td>관심사</td>
										<td>
											<input type="radio" name="userInterest" value="예금"> 예금
											<input type="radio" name="userInterest" value="적금"> 적금
											<input type="radio" name="userInterest" value="연금"> 연금
											<input type="radio" name="userInterest" value="보험"> 보험
											<input type="radio" name="userInterest" value="대출"> 대출
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th colspan="2"><hr></th>
									</tr>
									<tr>
										<td colspan="2">
											<button id="savingBtn">조회하기</button>
										</td>
									</tr>
								</tfoot>
							</table>
						</form>
				</div>
				</c:otherwise>	
			</c:choose>
			<div id="footer">
			
			</div>
		</div>
	</body>
</html>
