<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자산 결과</title>
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/assetResult.css' />">
		<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
			<c:import url="/WEB-INF/views/layout/top.jsp" />
			<div id="main">
				<table id="resultTable">
					<thead>
						<tr>
							<th>${sessionScope.suserName }님의 자산 데이터 결과</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								momentor 가입자 <span id="span">${totalUserCnt }명</span>중 ${userAge }는 <span id="span">${ageUserCnt }명</span>이며,<br>
								<span id="span">${sessionScope.suserName }</span>님은 ${userAge } 중 자산 상위 <span id="span">${percentage }%</span>입니다.
							</td>
						</tr>
						
						
					</tbody>
					<tfoot>
						
					</tfoot>
				</table>
			</div>
			<div id="recommend">
				<table id="recomTable">
					<tr>
						<td id="title" colspan="4">${userAge }가 선호하는 상품 보러가기</td>
					</tr>
					<tr>
						<c:forEach var="card" items='${cardList}'>
							<td>
								<div class ="card">
									<div>
										<img class="cardImg" src='<c:url value='${card.cardImgUrl}'/>'>
									</div>
									<div class="product p1">
										<h4>${card.cardName }</h4> <br>
										${card.cardDes } <br><br>
										<c:if test="${card.comCtg eq '현대'}">
											<a href="https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=${card.cardUrl}">해당 사이트 바로가기</a>
										</c:if>
										<c:if test="${card.comCtg eq 'KB'}">
											<a href="https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=${card.cardUrl}">해당 사이트 바로가기</a>
										</c:if>
										<c:if test="${card.comCtg eq 'lotte'}">
											<a href="${card.cardUrl}">해당 사이트 바로가기</a>
										</c:if>
										<c:if test="${card.comCtg eq 'hana'}">
											<a href="${card.cardUrl}">해당 사이트 바로가기</a>
										</c:if>
									</div>
								</div>
							</td>
						</c:forEach>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<c:forEach var="saving" items='${savingList}'>
							<td>
								<div class="product p2">
									${saving.comName } <br>					
									<h4>${saving.prdName }</h4> <br>
									최고 ${saving.saveTrm }개월 기준 연 <strong>${saving.intrRate2}%</strong>
								</div>
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
