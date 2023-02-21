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
    <script src="<c:url value='/js/prdModal.js' />"></script>
    
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
    <c:forEach var="saving" items='${savingList }' >
    
    <table summary="" id="js-load" class="lists__item js-load">
		<tr>
			<td class="c_info" >
							
						<div class="logo">
						<c:choose> 
						
						<c:when test = "${saving.comName eq '디비저축은행'}">
							<div class= "bankImg DB"></div>
						</c:when>
							
						<c:when test="${saving.comName eq '한국스탠다드차타드은행'}">
							<div class= "bankImg SC"></div>
						</c:when>
						<c:when test="${saving.comName eq '주식회사 케이뱅크'}">
							<div class= "bankImg K"></div>
							
						</c:when>
						<c:when test="${saving.comName eq '국민은행'}">
							<div class= "bankImg KB"></div>				
						</c:when>
						
						<c:when test="${saving.comName eq '부산은행'}">
							<div class= "bankImg BNK"></div>			
						</c:when>
						
						<c:when test="${saving.comName eq 'BNK저축은행'}">
							<div class= "bankImg BNK"></div>
							
						</c:when>
						<c:when test="${saving.comName eq '경남은행'}">
							<div class= "bankImg BNK"></div>							
						</c:when>
						
						<c:when test="${saving.comName eq '중소기업은행'}">
						<div class= "bankImg IBK"></div>							
						</c:when>
						
						<c:when test="${saving.comName eq '상상인플러스저축은행'}">
						<div class= "bankImg SangSangPlus"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '조은저축은행'}">
						<div class= "bankImg Choeun"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '한국산업은행'}">
						<div class= "bankImg KDB"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '전북은행'}">
						<div class= "bankImg JB"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '주식회사 카카오뱅크'}">
						<div class= "bankImg Kakao"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '농협은행주식회사'}">
						<div class= "bankImg NH"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '토스뱅크 주식회사'}">
						<div class= "bankImg Toss"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '우리은행'}">
						<div class= "bankImg Woori"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '대구은행'}">
						<div class= "bankImg DG"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '광주은행'}">
						<div class= "bankImg GJ"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '제주은행'}">
						<div class= "bankImg JJ"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '애큐온저축은행'}">
						<div class= "bankImg Acuon"></div>
						</c:when>
						
						<c:when test="${saving.comName eq 'OSB저축은행'}">
						<div class= "bankImg OSB"></div>
						</c:when>
						
						<c:when test="${saving.comName eq '스카이저축은행'}">
						<div class= "bankImg Sky"></div>
						</c:when>
						
						<c:otherwise>이미지<br>준비중</c:otherwise>
						</c:choose>
						</div>
						
						
						<div class="list">									
					<dl>
						<%-- <dt><a href=<c:url value='/saving/detailViewSaving/${saving.prdNum }'/>">${saving.prdNum }</a></dt> --%>						
						<dd class="text01">${saving.joinWay }</dd>
						<dd class="text02">${saving.comName }</dd>
						<dd class="text03">${saving.prdName }</dd>
						<%-- <dd class="text04">${saving.joinMember }</dd> --%>
						<dd>최고 ${saving.saveTrm }개월 기준 연 <strong>${saving.intrRate2}%</strong></dd>
					</dl>	
						
						</div>
						
					
				
			</td>
			<td class="c_date">
				<div class="btn_in">
				
					<%-- EL은 HTML 주석으로 주석 처리가 안됩니다 --%>
					<%--  
					<a class="openBtn" id="compare" onclick="toggleBtn1('${saving.savingID}')">비교하기</a>
					 --%>
					<a class="openBtn" id="compare" onclick="toggleBtn1()"
						data-comName="${saving.comName}" data-comNum="${saving.comNum}" data-dclsMonth="${saving.dclsMonth}" 
						data-dclsStart="${saving.dclsStart}" data-etcNote="${saving.etcNote}" data-interest="${saving.interest}" 
						data-intrRate="${saving.intrRate}" data-intrRate2="${saving.intrRate2}"
						data-intrRateTypeName="${saving.intrRateTypeName}" data-joinMember="${saving.joinMember}" 
						data-joinWay="${saving.joinWay}" data-maxLimit="${saving.maxLimit}" data-prdName="${saving.prdName}" 
						data-prdNum="${saving.prdNum}" data-rsrvTypeName="${saving.rsrvTypeName}"
						data-saveTrm="${saving.saveTrm}" data-savingID="${saving.savingID}" data-spclCnd="${saving.spclCnd}">비교하기</a>
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
			<input type="hidden" class="comName" value=""><span class="comNameSpan"></span><br>
			<input type="hidden" class="prdName" value=""><span class="prdNameSpan"></span><br>
			<input type="hidden" class="joinWay" value="">
			<input type="hidden" class="interest" value="">
			<input type="hidden" class="maxLimit" value="">
			<input type="hidden" class="joinMember" value="">
			<input type="hidden" class="etcNote" value="">
			<input type="hidden" class="intrRate" value="">
			<input type="hidden" class="intrRate2" value=""><span class="intrRate2Span"></span><br>
			<input type="hidden" class="saveTrm" value=""><span class="saveTrmSpan"></span><br>
			<input type="hidden" class="rsrvTypeName" value=""><span class="rsrvTypeNameSpan"></span>
			<input type="hidden" class="intrRateTypeName" value="">
			<input type="hidden" class="spclCnd" value="">
			<div class="id6">
				<input type="checkbox" name="Chk_list" class="chkDelete" value="null">
				<input class="prdName" type="hidden" value="">
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
				$(html).find(".etcNote").val($(this).data("etcnote"));
				$(html).find(".intrRate").val($(this).data("intrrate"));
				$(html).find(".intrRate2").val($(this).data("intrrate2"));
				$(html).find(".intrRate2Span").text($(this).data("intrrate2"));
				$(html).find(".saveTrm").val($(this).data("savetrm"));
				$(html).find(".saveTrmSpan").text($(this).data("savetrm"));
				$(html).find(".rsrvTypeName").val($(this).data("rsrvtypename"));
				$(html).find(".rsrvTypeNameSpan").text($(this).data("rsrvtypename"));
				$(html).find(".intrRateTypeName").val($(this).data("intrratetypename"));
				$(html).find(".prdName").text($(this).data("prdname"));
				$(html).find(".spclCnd").val($(this).data("spclcnd"));
				
				
				$("ul.prod_list").append(html);		
			
			});
		});
	</script>
  </body>
</html>