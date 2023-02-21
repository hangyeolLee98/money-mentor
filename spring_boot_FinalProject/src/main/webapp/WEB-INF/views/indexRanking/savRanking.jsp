<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel ="stylesheet" type="text/css" href="<c:url value='/css/insuRanke.css' />">

<br>
<br>
<div class="ranking_main">
	<div class="ranking_img">
		<c:forEach var="sav" items="${savRandom}">
			<span class="savIndex_span ${sav.savingID}">
			<c:if test="${sav.comName == '토스뱅크 주식회사'}">
			<img class="savIndex_main ${sav.savingID}"  src="<c:url value='https://static.toss.im/tds/favicon/favicon.ico'/>" >
			</c:if>
			<c:if test="${sav.comName == '주식회사 카카오뱅크'}">
			<img class="savIndex_main ${sav.savingID}"  src="<c:url value='https://www.kakaocorp.com/page/favicon.ico'/>" >
			</c:if>
				<div>${sav.prdName}</div>
			</span>
			&nbsp;
		</c:forEach>
	</div>
	<div class="ranking_text">
		<c:forEach var="sav" items="${savRandom}">
			<div class="detailS ${sav.savingID}">
				<c:if test="${num.count == 1}">
					<input class="detailS_id1" type="hidden" value="${sav.savingID}">
				</c:if>
				<c:if test="${num.count == 2}">
					<input class="detailS_id2" type="hidden" value="${sav.savingID}">
				</c:if>
				<c:if test="${num.count == 3}">
					<input class="detailS_id3" type="hidden" value="${sav.savingID}">
				</c:if>
				<br>
				<h2 id="ranking_h2"> ${sav.prdName}</h2>
				<div>은행 : ${sav.comName} </div>
				<div>한도 : ${sav.maxLimit}원</div>
				<br>
			</div>
		</c:forEach>
	</div>
	
</div>