<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터-QNA</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/serviceCenter.css' />">
		
	<script src="<c:url value='/js/serviceCenter.js'/>" ></script>
	</head>
	
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<nav class="scNav">
			<div class="SC_main_div">
				<div class="nav_title">
					<p class="nav_p1">모멘토 고객센터</p> 
					<p class="nav_p2">굼금한 점은 검색으로 쉽고 빠르게 확인하세요.</p>
				</div>
				<div class="nav_input">
					<input id="SC_serch" type="text" placeholder="궁금한 점을 검색해 보세요."><button class="SC_serch_btn">검색</button>
				</div>
			</div>
		</nav>
		<section class="detail_section">
			<div class="SC_main_div detail_div">
				<c:forEach var="ques" items="${getQNADetail}" varStatus="num">
				<h2>제목 : ${ques.queTitle}</h2>
				<div class="answer_div">
					<span class="ans_user">작성자 : ${ques.userId} 님 </span><br><br>
					<div><span class="QNA_span">Q. </span><br>[${ques.queState}]: ${ques.question}</div>
				 </div>
				 <br>
				<c:choose>
					<c:when test="${not empty ques.answer}">
						<div class="answer_div answer_divA"><span class="QNA_span">A. </span><br>${ques.answer} </div>
					</c:when>
					<c:otherwise>
						<div class="answer_div answer_divA">
							<span class="QNA_span">A. </span><br>
							답변 대기 준비 중입니다.
						</div>
					</c:otherwise>
				</c:choose>
				<div class="answer_div answer_btnDiv">
					<input type="hidden" name="qusNum" class="qusNum" value="${ques.qusNum}">
					<c:if test="${(ques.userId eq sessionScope.sid) && (sessionScope.sid != 'admin')}">
					 	<a id="answer_A" href="<c:url value='/deleteQuestion/${ques.qusNum}' />">
					 		<button id="qus_btn_delete" value="삭제">삭제</button>
					 	</a>
					</c:if>
					<c:if test="${sessionScope.sid eq 'admin'}">
					 	<a id="answer_A" href="<c:url value='/deleteQuestion/${ques.qusNum}' />">
					 		<button id="qus_btn_delete" value="삭제">삭제</button>
					 	</a>
					 	<c:if test="${empty ques.answer}">
					 	<a id="answer_A" href="<c:url value='/questionUpload/${ques.qusNum}' />">
					 		<button id="qus_btn_update" value="답변">답변</button>
					 	</a>
					 	</c:if>
					</c:if>
				</div>
				
				</c:forEach>
			</div>
			
		</section>
		<div class="SC_main_div backDiv" >
			<a class="backpage" href="/all/serviceCenter">다른 질문 보러가기</a>
		</div>
		<hr id="SChr"/>
		<c:import url="/WEB-INF/views/layout/footer.jsp" />
	</body>
</html>

