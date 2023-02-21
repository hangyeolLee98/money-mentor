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
    <c:forEach var="rentHouseLoan" items='${rentHouseLoanList }'>
    <table summary="" id="js-load" class="lists__item js-load">
		<tr>
			<td class="c_info" >
			<div class="List">
															
					<dl>
						<%--<dt><a href=<c:url value='/creditLoan/detailViewCreditLoan/${creditLoan.prdNum }'/>">${creditLoan.prdNum }</a></dt>--%>
						<dd class="text01">${rentHouseLoan.joinWay }</dd>
						<dd class="text02">${rentHouseLoan.comName }</dd>
						<dd class="text03">${rentHouseLoan.prdName }</dd>
						
						<!-- <dd>최고 연 <strong>3.25%</strong> 36개월</dd> -->
					</dl>
			</div>	
			
			</td>

			
			<td class="c_date">
				<div class="btn_in">
					<a class="openBtn" id="compare" onclick="toggleBtn1()"
						data-rentHouseLoanID="${rentHouseLoan.rentHouseLoanID }"
						data-comName="${rentHouseLoan.comName }"
						data-prdName="${rentHouseLoan.prdName }"
						data-joinWay="${rentHouseLoan.joinWay }"
						data-loanInciExpn="${rentHouseLoan.loanInciExpn }"
						data-erlyRpayFee="${rentHouseLoan.erlyRpayFee }"
						data-dlyRate="${rentHouseLoan.dlyRate }"
						data-loanLimit="${rentHouseLoan.loanLimit }"
						data-rpayTypeName="${rentHouseLoan.rpayTypeName }"
						data-lendRateTypeName="${rentHouseLoan.lendRateTypeName }"
						data-lendRateMin="${rentHouseLoan.lendRateMin }"
						data-lendRateMax="${rentHouseLoan.lendRateMax }"
						data-lendRateAvg="${rentHouseLoan.lendRateAvg }"
					>비교하기</a>
					<a href="#">가입하기</a>
				</div>
			</td>
		</tr>
		</table>									
	</c:forEach>
		<div class="btn_set btn_center" id="js-btn-wrap">
							<div class="btn btn03">
								<a href="javascript:;" id="load">더보기</a>
							</div>
						</div>
	</div>
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
			<input type="hidden" class="loanInciExpn" value="">
			<input type="hidden" class="erlyRpayFee" value="">
			<input type="hidden" class="dlyRate" value="">
			<input type="hidden" class="loanLimit" value="">
			<input type="hidden" class="rpayTypeName" value="">
			<input type="hidden" class="lendRateTypeName" value="">
			<input type="hidden" class="lendRateMin" value="">
			<input type="hidden" class="lendRateMax" value="">
			<input type="hidden" class="lendRateAvg" value="">
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
				$(html).find(".joinWay").text($(this).data("joinway"));
				$(html).find(".loanInciExpn").val($(this).data("loaninciexpn"));
				$(html).find(".erlyRpayFee").val($(this).data("erlyrpayfee"));
				$(html).find(".dlyRate").val($(this).data("dlyrate"));
				$(html).find(".loanLimit").val($(this).data("loanlimit"));
				$(html).find(".rpayTypeName").val($(this).data("rpaytypename"));
				$(html).find(".lendRateTypeName").val($(this).data("lendratetypename"));
				$(html).find(".lendRateMin").val($(this).data("lendratemin"));
				$(html).find(".lendRateMax").val($(this).data("lendratemax"));
				$(html).find(".lendRateAvg").val($(this).data("lendrateavg"));
				
				
				$("ul.prod_list").append(html);		
			
			});
		});
	</script>
  </body>
</html>