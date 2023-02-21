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
    <c:forEach var="creditLoan" items='${creditLoanList }'>
    <table summary="" id="js-load" class="lists__item js-load">
		<tr>
			<td class="c_info" >
			
					<div class="list">									
					<dl>
						<%--<dt><a href=<c:url value='/creditLoan/detailViewCreditLoan/${creditLoan.prdNum }'/>">${creditLoan.prdNum }</a></dt>--%>
						<dd class="text01">${creditLoan.joinWay }</dd>
						<dd class="text02">${creditLoan.comName }</dd>
						<dd class="text03">${creditLoan.prdName }</dd>
						
						<!-- <dd>최고 연 <strong>3.25%</strong> 36개월</dd> -->
					</dl>
					</div>

			</td>
			<td class="c_date">
				<div class="btn_in">
					<a class="openBtn" id="compare" onclick="toggleBtn1()"
						data-creditLoanID="${creditLoan.creditLoanID }"data-comName="${creditLoan.comName }"data-prdName="${creditLoan.prdName }"data-joinWay="${creditLoan.joinWay }" 
						data-crdtTypeName="${creditLoan.crdtTypeName }"data-cbName="${creditLoan.cbName }"data-crdtLendRateTypeName="${creditLoan.crdtLendRateTypeName }"
						data-crdtGrade9Up="${creditLoan.crdtGrade9Up }"data-crdtGrade8Up="${creditLoan.crdtGrade8Up }"data-crdtGrade7Up="${creditLoan.crdtGrade7Up }"
						data-crdtGrade6Up="${creditLoan.crdtGrade6Up }"data-crdtGrade5Up="${creditLoan.crdtGrade5Up }"data-crdtGrade4Up="${creditLoan.crdtGrade4Up }"
						data-crdtGrade3Up="${creditLoan.crdtGrade3Up }"data-crdtGrade3Down="${creditLoan.crdtGrade3Down }"data-crdtGradeAvg="${creditLoan.crdtGradeAvg }">비교하기</a>
					<a href="#">가입하기</a>
				</div>
			</td>
		</tr>
		</table>									
	</c:forEach>
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
			<input type="hidden" class="crdtTypeName" value="">
			<input type="hidden" class="cbName" value="">
			<input type="hidden" class="crdtLendRateTypeName" value="">
			<input type="hidden" class="crdtGrade9Up" value="">
			<input type="hidden" class="crdtGrade8Up" value="">
			<input type="hidden" class="crdtGrade7Up" value="">
			<input type="hidden" class="crdtGrade6Up" value="">
			<input type="hidden" class="crdtGrade5Up" value="">
			<input type="hidden" class="crdtGrade4Up" value="">
			<input type="hidden" class="crdtGrade3Up" value="">
			<input type="hidden" class="crdtGrade3Down" value="">
			<input type="hidden" class="crdtGradeAvg" value="">
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
				$(html).find(".crdtTypeName").val($(this).data("crdttypename"));
				$(html).find(".cbName").val($(this).data("cbname"));
				$(html).find(".crdtLendRateTypeName").val($(this).data("crdtlendratetypename"));
				$(html).find(".crdtGrade9Up").val($(this).data("crdtgrade9up"));
				$(html).find(".crdtGrade8Up").val($(this).data("crdtgrade8up"));
				$(html).find(".crdtGrade7Up").val($(this).data("crdtgrade7up"));
				$(html).find(".crdtGrade6Up").val($(this).data("crdtgrade6up"));
				$(html).find(".crdtGrade5Up").val($(this).data("crdtgrade5up"));
				$(html).find(".crdtGrade4Up").val($(this).data("crdtgrade4up"));
				$(html).find(".crdtGrade3Up").val($(this).data("crdtgrade3up"));
				$(html).find(".crdtGrade3Down").val($(this).data("crdtgrade3down"));
				$(html).find(".crdtGradeAvg").val($(this).data("crdtgradeavg"));
				
				$("ul.prod_list").append(html);		
			
			});
		});
	</script>
  </body>
</html>