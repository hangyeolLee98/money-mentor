<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>연금 리스트</title>
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
    <c:forEach var="annuitySaving" items='${annuitySavingList }'>
    <table summary="" id="js-load" class="lists__item js-load">
		<tr>
			<td class="c_info" >
			<div class="logo">
						<c:choose> 
						
						<c:when test = "${annuitySaving.comName eq '디비저축은행'}">
							<div class= "bankImg DB"></div>
						</c:when>
							
						<c:when test="${annuitySaving.comName eq '한국스탠다드차타드은행'}">
							<div class= "bankImg SC"></div>
						</c:when>
						<c:when test="${annuitySaving.comName eq '주식회사 케이뱅크'}">
							<div class= "bankImg K"></div>
							
						</c:when>
						<c:when test="${annuitySaving.comName eq '국민은행'}">
							<div class= "bankImg KB"></div>				
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '부산은행'}">
							<div class= "bankImg BNK"></div>			
						</c:when>
						
						<c:when test="${annuitySaving.comName eq 'BNK저축은행'}">
							<div class= "bankImg BNK"></div>
							
						</c:when>
						<c:when test="${annuitySaving.comName eq '경남은행'}">
							<div class= "bankImg BNK"></div>							
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '중소기업은행'}">
						<div class= "bankImg IBK"></div>							
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '상상인플러스저축은행'}">
						<div class= "bankImg SangSangPlus"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '조은저축은행'}">
						<div class= "bankImg Choeun"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '한국산업은행'}">
						<div class= "bankImg KDB"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '전북은행'}">
						<div class= "bankImg JB"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '주식회사 카카오뱅크'}">
						<div class= "bankImg Kakao"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '농협은행주식회사'}">
						<div class= "bankImg NH"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '토스뱅크 주식회사'}">
						<div class= "bankImg Toss"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '우리은행'}">
						<div class= "bankImg Woori"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '대구은행'}">
						<div class= "bankImg DG"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '광주은행'}">
						<div class= "bankImg GJ"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '제주은행'}">
						<div class= "bankImg JJ"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '애큐온저축은행'}">
						<div class= "bankImg Acuon"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq 'OSB저축은행'}">
						<div class= "bankImg OSB"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '스카이저축은행'}">
						<div class= "bankImg Sky"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '청주저축은행'}">
						<div class= "bankImg Cheongju"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '금화저축은행'}">
						<div class= "bankImg GH"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '인천저축은행'}">
						<div class= "bankImg IC"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '모아저축은행'}">
						<div class= "bankImg MA"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '대백저축은행'}">
						<div class= "bankImg Daeback"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '부림저축은행'}">
						<div class= "bankImg BR"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '영진저축은행'}">
						<div class= "bankImg YG"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '페퍼저축은행'}">
						<div class= "bankImg PP"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq 'CK저축은행'}">
						<div class= "bankImg CK"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '대명상호저축은행'}">
						<div class= "bankImg DMSH"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '아산저축은행'}">
						<div class= "bankImg AS"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '대한저축은행'}">
						<div class= "bankImg DHJC"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '센트럴저축은행'}">
						<div class= "bankImg STR"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '드림저축은행'}">
						<div class= "bankImg Dream"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '머스트삼일저축은행'}">
						<div class= "bankImg MS"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '오성저축은행'}">
						<div class= "bankImg OS"></div>
						</c:when>
						
						
						<c:when test="${annuitySaving.comName eq '교보라이프플래닛생명보험주식회사'}">
						<div class= "bankImg KBLIFE"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '솔브레인저축은행'}">
						<div class= "bankImg SOL"></div>
						</c:when>
						
						<c:when test="${annuitySaving.comName eq '미래에셋자산운용'}">
						<div class= "bankImg MRAS"></div>
						</c:when>
						<c:otherwise>이미지<br>준비중</c:otherwise>
						</c:choose>
						</div>
						
						<div class="list">							
					<dl>
						<%-- <dt><a href=<c:url value='/saving/detailViewAnnuitySaving/${annuitySaving.prdNum }'/>">${annuitySaving.prdNum }</a></dt> --%>
						<dd class="text01">${annuitySaving.comName }</dd>
						<dd class="text03">${annuitySaving.prdName }</dd>
						<dd class="text02">${annuitySaving.pnsnKindName }</dd>
						<dd class="text04">${annuitySaving.prdtTypeName }</dd>
						<dd>연평균 수익율 <strong>${annuitySaving.avgPrftRate}%</strong></dd>
					</dl>
				</div>
			</td>
			
			<td class="c_date">
				<div class="btn_in">
					<a class="openBtn" id="compare" onclick="toggleBtn1()"
						data-comName="${annuitySaving.comName}" data-comNum="${annuitySaving.comNum}" data-dclsMonth="${annuitySaving.dclsMonth}"
						data-pnsnKindName="${annuitySaving.pnsnKindName}" data-saleStart="${annuitySaving.saleStart}" data-prdtTypeName="${annuitySaving.prdtTypeName}"data-avgPrftRate="${annuitySaving.avgPrftRate}"
						data-maxLimit="${annuitySaving.dclsRate}" data-guarRate="${annuitySaving.guarRate}" data-pnsnRecAmt="${annuitySaving.pnsnRecAmt }" data-dclsRate="${annuitySaving.dclsRate }"
						data-btrmPrftRate1="${annuitySaving.btrmPrftRate1 }"data-btrmPrftRate2="${annuitySaving.btrmPrftRate2 }"data-btrmPrftRate3="${annuitySaving.btrmPrftRate3 }"
						data-saleCom="${annuitySaving.saleCom }"data-pnsnRecTrm="${annuitySaving.pnsnRecTrm }"data-pnsnEnterAge="${annuitySaving.pnsnEnterAge }"
						data-monPay="${annuitySaving.monPay }"data-payPeriod="${annuitySaving.payPeriod }"data-pnsnStartAge="${annuitySaving.pnsnStartAge }"						
						data-prdNum="${annuitySaving.prdNum}"  data-prdName="${annuitySaving.prdName}"data-annuitySavingID="${annuitySaving.annuitySavingID}">비교하기</a>
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
			<input type="hidden" class="pnsnKindName" value=""><span class="pnsnKindNameSpan"></span><br>
			<input type="hidden" class="saleStart" value="">
			<input type="hidden" class="prdtTypeName" value=""><span class="prdtTypeNameSpan"></span><br>
			<input type="hidden" class="avgPrftRate" value="">연평균 수익율 <span class="avgPrftRateSpan"></span>%<br>
			<input type="hidden" class="dclsRate" value="">
			<input type="hidden" class="guarRate" value="">
			<input type="hidden" class="btrmPrftRate1" value="">
			<input type="hidden" class="btrmPrftRate2" value="">
			<input type="hidden" class="btrmPrftRate3" value="">
			<input type="hidden" class="saleCom" value="">
			<input type="hidden" class="pnsnRecTrm" value="">
			<input type="hidden" class="pnsnEnterAge" value="">
			<input type="hidden" class="monPay" value="">
			<input type="hidden" class="payPeriod" value="">
			<input type="hidden" class="pnsnStartAge" value="">
			<input type="hidden" class="pnsnRecAmt" value="">
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
				$(html).find(".pnsnKindName").val($(this).data("pnsnkindname"));
				$(html).find(".pnsnKindNameSpan").text($(this).data("pnsnkindname"));
				$(html).find(".saleStart").val($(this).data("salestart"));
				$(html).find(".prdtTypeName").val($(this).data("prdttypename"));
				$(html).find(".prdtTypeNameSpan").text($(this).data("prdttypename"));
				$(html).find(".avgPrftRate").val($(this).data("avgprftrate"));
				$(html).find(".avgPrftRateSpan").text($(this).data("avgprftrate"));
				$(html).find(".dclsRate").val($(this).data("dclsrate"));
				$(html).find(".dclsRateSpan").text($(this).data("dclsrate"));
				$(html).find(".guarRate").val($(this).data("guarrate"));
				$(html).find(".btrmPrftRate1").val($(this).data("btrmprftrate1"));
				$(html).find(".btrmPrftRate2").val($(this).data("btrmprftrate2"));
				$(html).find(".btrmPrftRate3").val($(this).data("btrmprftrate3"));
				$(html).find(".saleCom").val($(this).data("salecom"));
				$(html).find(".saleComSpan").text($(this).data("salecom"));
				$(html).find(".pnsnRecTrm").val($(this).data("pnsnrectrm"));
				$(html).find(".pnsnRecTrm").text($(this).data("pnsnrectrm"));
				$(html).find(".pnsnEnterAge").val($(this).data("pnsnenterage"));
				$(html).find(".pnsnEnterAge").text($(this).data("pnsnenterage"));
				$(html).find(".monPay").val($(this).data("monpay"));
				$(html).find(".payPeriod").val($(this).data("payperiod"));
				$(html).find(".payPeriodSpan").text($(this).data("payperiod"));
				$(html).find(".pnsnStartAge").val($(this).data("pnsnstartage"));
				$(html).find(".pnsnStartAgeSpan").text($(this).data("pnsnstartage"));
				$(html).find(".pnsnRecAmt").val($(this).data("pnsnrecamt"));
				$(html).find(".pnsnRecAmtSpan").text($(this).data("pnsnrecamt"));
				
				
				$("ul.prod_list").append(html);		
			
			});
		});
	</script>
  </body>
</html>