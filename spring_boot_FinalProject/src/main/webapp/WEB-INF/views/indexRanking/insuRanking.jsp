<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link rel ="stylesheet" type="text/css" href="<c:url value='/css/insuRanke.css' />">
	<script src="<c:url value='/js/insuRanke.js'/>" ></script>
<br>
<br>
<div class="ranking_main">
	<div class="ranking_img">
		<c:forEach var="insu" items="${insuRandom}">
			<span class="insuIndex_span ${insu.insuId}">
			<img class="insuIndex_main ${insu.insuId}"  src="<c:url value='${insu.prdLogo}'/>" >
				<div>${insu.insuName}</div>
			</span>
			&nbsp;
		</c:forEach>
	</div>
	<div class="ranking_text">
		<c:forEach var="insu" items="${insuRandom}">
			<div class="detailI ${insu.insuId}">
				<c:if test="${num.count == 1}">
					<input class="detailI_id1" type="hidden" value="${insu.insuId}">
				</c:if>
				<c:if test="${num.count == 2}">
					<input class="detailI_id2" type="hidden" value="${insu.insuId}">
				</c:if>
				<c:if test="${num.count == 3}">
					<input class="detailI_id3" type="hidden" value="${insu.insuId}">
				</c:if>
				<br>
				<h2 id="ranking_h2"> ${insu.insuName}</h2>
				<div>종류 : ${insu.insuCtg} 보험</div>
				<div>보장 : ${insu.insuDes}</div>
				<div>보장금 : ${insu.insuPrice}</div>
				<br>
			</div>
		</c:forEach>
	</div>
	
</div>