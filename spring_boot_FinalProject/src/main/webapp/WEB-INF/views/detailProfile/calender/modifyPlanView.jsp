<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>일정 수정</title>
	 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/calenderIndex.css' />">
		<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
		<script src="https://kit.fontawesome.com/bb34e32cb3.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id="add-view-body">
			<div id="plan-logo">		
				<img src="/image/MomentorLogo.png">
			</div>
			<section>
				<c:forEach items="${cal}" var="cal">
				<script>
				$(document).ready(function(){
					  $(".prd-option").each(function(){
						  console.log($('.prd-option').val());
					    if($(this).val()=="${cal.prdType}"){
					      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
					    }
					  });
					});
				</script>
					<table>
						<tbody>
							<tr class="prdName">
								<td class="prd-table-title">상품 이름</td>
								<td><input placeholder="${cal.prdName}" type="text" id="prdName" class="prdName" name="prdName"></td>
							</tr>
							<tr class="prdType">
								<td>상품 종류</td>
								<td>
									<select id="prd-type-select" name="prdType" disabled>
										<option class="prd-option" value="card">카드</option>
										<option class="prd-option" value="insu">보험</option>
										<option value="deposit">예금</option>
										<option value="saving">적금</option>
									</select>
								</td>
							</tr>
							<tr class="prdSubDate">
								<td class="prd-table-title">가입일</td>
								<td><input type="date" id="calSubDate" class="calSubDate" name="calSubDate" value="${cal.calSubDate}"></td>
							</tr>
							<tr class="prdTransfer">
								<td class="prd-table-title">이체일</td>
								<td><input type="text" id="calTransfer" class="calTransfer" name="calTransfer" placeholder="${cal.calTransfer}"> 일</td>
							</tr>
							<tr class="prdMaturity">
								<td class="prd-table-title">만기</td>
								<td><input type="text" id="calMaturity" class="calMaturity" name="calMaturity" placeholder="${cal.calMaturity}"> 년</td>
							</tr>
							<tr class="prdPayment">
								<td class="prd-table-title">납부금</td>
								<td><input type="text" id="calPayment" class="calPayment" name="calPayment" placeholder="${cal.calPayment}"> 원</td>
							</tr>
							<tr id="prdDeposit" style="display:none">
								<td class="prd-table-title">예치금</td>
								<td><input type="text" id="calDeposit" class="calDeposit" name="calDeposit" placeholder="${cal.calDeposit}"> 원</td>
							</tr>
							<tr><td colspan="2"><button type="submit" id="mod-${cal.dataID}" class="calender-mod-btn">수정</button></td></tr>
						</tbody>
					</table>
				</c:forEach>
			</section>
		</div>
	</body>
	 <script src="<c:url value='/js/planModify.js' />"> </script>
</html>