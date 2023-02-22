<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  <link rel ="stylesheet" type="text/css" href="<c:url value='/css/savingForm.css' />">
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
    <script src="<c:url value='/js/listMore.js' />"></script>
    
  </head>
  <body>
  <div class="prdList">
			<table summary="">
			<colgroup>
				<col width="*">
				<col width="30%">
			</colgroup> 
		<tbody>
		<section id="container">
			<div class="contents" >
    <c:forEach var="deposit" items='${depositList }'>
    <table summary="" id="js-load" class="lists__item js-load">
		<tr>
			<td class="c_info" >
				<div class="logo">
						<c:choose> 
						
						<c:when test = "${deposit.comName eq '디비저축은행'}">
							<div class= "bankImg DB"></div>
						</c:when>
							
						<c:when test="${deposit.comName eq '한국스탠다드차타드은행'}">
							<div class= "bankImg SC"></div>
						</c:when>
						<c:when test="${deposit.comName eq '주식회사 케이뱅크'}">
							<div class= "bankImg K"></div>
							
						</c:when>
						<c:when test="${deposit.comName eq '국민은행'}">
							<div class= "bankImg KB"></div>				
						</c:when>
						
						<c:when test="${deposit.comName eq '부산은행'}">
							<div class= "bankImg BNK"></div>			
						</c:when>
						
						<c:when test="${deposit.comName eq 'BNK저축은행'}">
							<div class= "bankImg BNK"></div>
							
						</c:when>
						<c:when test="${deposit.comName eq '경남은행'}">
							<div class= "bankImg BNK"></div>							
						</c:when>
						
						<c:when test="${deposit.comName eq '중소기업은행'}">
						<div class= "bankImg IBK"></div>							
						</c:when>
						
						<c:when test="${deposit.comName eq '상상인플러스저축은행'}">
						<div class= "bankImg SangSangPlus"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '조은저축은행'}">
						<div class= "bankImg Choeun"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '한국산업은행'}">
						<div class= "bankImg KDB"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '전북은행'}">
						<div class= "bankImg JB"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '주식회사 카카오뱅크'}">
						<div class= "bankImg Kakao"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '농협은행주식회사'}">
						<div class= "bankImg NH"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '토스뱅크 주식회사'}">
						<div class= "bankImg Toss"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '우리은행'}">
						<div class= "bankImg Woori"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '대구은행'}">
						<div class= "bankImg DG"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '광주은행'}">
						<div class= "bankImg GJ"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '제주은행'}">
						<div class= "bankImg JJ"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '애큐온저축은행'}">
						<div class= "bankImg Acuon"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq 'OSB저축은행'}">
						<div class= "bankImg OSB"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '스카이저축은행'}">
						<div class= "bankImg Sky"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '청주저축은행'}">
						<div class= "bankImg Cheongju"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '금화저축은행'}">
						<div class= "bankImg GH"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '인천저축은행'}">
						<div class= "bankImg IC"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '모아저축은행'}">
						<div class= "bankImg MA"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '대백저축은행'}">
						<div class= "bankImg Daeback"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '부림저축은행'}">
						<div class= "bankImg BR"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '영진저축은행'}">
						<div class= "bankImg YG"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '페퍼저축은행'}">
						<div class= "bankImg PP"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq 'CK저축은행'}">
						<div class= "bankImg CK"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '대명상호저축은행'}">
						<div class= "bankImg DMSH"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '아산저축은행'}">
						<div class= "bankImg AS"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '대한저축은행'}">
						<div class= "bankImg DHJC"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '센트럴저축은행'}">
						<div class= "bankImg STR"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '드림저축은행'}">
						<div class= "bankImg Dream"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '머스트삼일저축은행'}">
						<div class= "bankImg MS"></div>
						</c:when>
						
						<c:when test="${deposit.comName eq '오성저축은행'}">
						<div class= "bankImg OS"></div>
						</c:when>
						
						<c:otherwise>이미지<br>준비중</c:otherwise>
						</c:choose>
						</div>
						
						<div class="list">												
					<dl>
						<%-- <dt><a href=<c:url value='/deposit/detailViewDeposit/${deposit.prdNum }'/>">${deposit.prdNum }</a></dt> --%>
						<dd class="text01">${deposit.joinWay }</dd>
						<dd class="text02">${deposit.comName }</dd>
						<dd class="text03">${deposit.prdName }</dd>
						<%-- <dd class="text04">${deposit.joinMember }</dd> --%>
						<dd>최고 연 <strong>${deposit.intrRate2}%</strong> ${deposit.saveTrm}개월</dd>
					</dl>
				</div>
			</td>
			<td class="c_date">
				<div class="btn_in">
					<a class="openBtn" id="compare" onclick="toggleBtn1()"
						data-comName="${deposit.comName}" data-comNum="${deposit.comNum}" data-dclsMonth="${deposit.dclsMonth}"
						data-interest="${deposit.interest}" data-intrRate="${deposit.intrRate}" data-intrRate2="${deposit.intrRate2}"data-intrRateTypeName="${deposit.intrRateTypeName}"
						data-joinMember="${deposit.joinMember}"data-joinWay="${deposit.joinWay}" data-maxLimit="${deposit.maxLimit}" data-prdName="${deposit.prdName}" 
						data-prdNum="${deposit.prdNum}" data-saveTrm="${deposit.saveTrm}" data-savingID="${deposit.depositID}" data-spclCnd="${deposit.spclCnd}">비교하기</a>
					<a href="#">가입하기</a>
				</div>
			</td>
		</tr>
		</table>									
	</c:forEach>
	
	
	</section>
	</tbody>
	 </table> 
	</div>
	
	
	<script id="compare-template" type="text/template">
		<li class="prod_lists">
		<div class="oo">
			<div class="id6">
				<input type="checkbox" name="Chk_list" class="chkDelete" value="null">
				<input class="prdName" type="hidden" value="">
			</div>
			<div class="oo_detail">
			<input type="hidden" class="comName" value=""><span class="comNameSpan"></span><br>
			<input type="hidden" class="prdName" value=""><span class="prdNameSpan"></span><br>
			<input type="hidden" class="joinWay" value="">
			<input type="hidden" class="interest" value="">
			<input type="hidden" class="maxLimit" value="">
			<input type="hidden" class="joinMember" value="">
			<input type="hidden" class="intrRate" value="">
			<input type="hidden" class="intrRate2" value="">최고 연 <span class="intrRate2Span">%</span>
			<input type="hidden" class="saveTrm" value="">(<span class="saveTrmSpan"></span>개월)<br>
			<input type="hidden" class="intrRateTypeName" value="">
			<input type="hidden" class="spclCnd" value="">
			</div>
		</div>
		</li>
	</script>
	<script>
		$(function(){
			$(".openBtn").click(function(){
				
				var html = $("#compare-template").text().trim();
				html = $.parseHTML(html);
				
				$(html).find(".comName").val($(this).data("comname"));
				$(html).find(".comNameSpan").text($(this).data("comname"));
				$(html).find(".prdName").val($(this).data("prdname"));
				$(html).find(".prdNameSpan").text($(this).data("prdname"));
				$(html).find(".joinWay").val($(this).data("joinway"));
				$(html).find(".interest").val($(this).data("interest"));
				$(html).find(".maxLimit").val($(this).data("maxlimit"));
				$(html).find(".joinMember").val($(this).data("joinmember"));
				$(html).find(".intrRate").val($(this).data("intrrate"));
				$(html).find(".intrRate2").val($(this).data("intrrate2"));
				$(html).find(".intrRate2Span").text($(this).data("intrrate2"));
				$(html).find(".saveTrm").val($(this).data("savetrm"));
				$(html).find(".saveTrmSpan").text($(this).data("savetrm"));
				$(html).find(".intrRateTypeName").val($(this).data("intrratetypename"));
				$(html).find(".prdName").text($(this).data("prdname"));
				$(html).find(".spclCnd").val($(this).data("spclcnd"));
				
				$("ul.prod_list").append(html);		
			
			});
		});
	</script>
  </body>
</html>