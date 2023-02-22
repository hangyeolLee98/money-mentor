<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br>
<br>
<div class="ranking_main">
	<div class="ranking_img">
		<c:forEach var="ann" items="${annRandom}">
			<span class="annIndex_span ${ann.annuitySavingID}">
			
			<c:if test="${ann.comName == '교보라이프플래닛생명보험주식회사'}">
			<img class="annIndex_main ${ann.annuitySavingID}"  src="<c:url value='https://resource.kyobo.com/dgt/web/pc/common/img/common/ci_kyobo_header.png'/>" >
			</c:if>
			<c:if test="${ann.comName == '농협생명보험주식회사'}">
			<img class="annIndex_main ${ann.annuitySavingID}"  src="<c:url value='https://banking.nonghyup.com/images/IP/global/logo_new.jpg'/>" >
			</c:if>
		
			
				<div>${ann.prdName}</div>
			</span>
			&nbsp;
		</c:forEach>
	</div>
	<div class="ranking_text">
		<c:forEach var="ann" items="${annRandom}">
			<div class="detailA ${ann.annuitySavingID}">
				<c:if test="${num.count == 1}">
					<input class="detailA_id1" type="hidden" value="${ann.annuitySavingID}">
				</c:if>
				<c:if test="${num.count == 2}">
					<input class="detailA_id2" type="hidden" value="${ann.annuitySavingID}">
				</c:if>
				<c:if test="${num.count == 3}">
					<input class="detailA_id3" type="hidden" value="${ann.annuitySavingID}">
				</c:if>
				<br>
				<h2 id="ranking_h2"> ${ann.prdName}</h2>
				<div>은행 : ${ann.comName} </div>
				<div>최대금리 : ${ann.dclsRate}%</div>
				<br>
			</div>
		</c:forEach>
	</div>
	
</div>