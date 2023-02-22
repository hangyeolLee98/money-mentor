<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel ="stylesheet" type="text/css" href="<c:url value='/css/savingForm.css' />">
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/annuitySavingSearch.js' />"></script>
	<script src="<c:url value='/js/prdModal.js' />"></script>
	<script src="<c:url value='/js/annuitySavingPopup.js' />"></script>
    <c:import url="/WEB-INF/views/layout/head.jsp" />
   
  </head>
  <body>
    <div class="">
    	<div id="List_All">	
    	<c:import url="/WEB-INF/views/layout/top.jsp" />
    	   				
		<!-- 리스트 -->
			 <colgroup>
				<col width="*">
				<col width="30%">
			</colgroup> 

		<section id="container">
			<div class="contents">
					<fieldset>
						<legend>조회</legend>
						<form id="AnnuitySavingList">
						<div class="searchbox">
							<ul>
								<li class="searchbar">
									<label for="prdName">은행명</label>
									<input type="text" name="prdName" id="prdName" style="width:800px">
								</li>
								
								<li>
									<p>연금종류</p>
									<div class="radio_list">
									<input type="radio" name="pnsnKindName" id="pnsnKindName01" checked="checked" value="">
										<label for="pnsnKindName01">전체</label>
										<input type="radio" name="pnsnKindName" id="pnsnKindName02" value="연금저축펀드">
										<label for="pnsnKindName02">연금저축펀드</label>
										<input type="radio" name="pnsnKindName" id="pnsnKindName03" value="연금저축보험(생명)">
										<label for="pnsnKindName03">연금저축보험(생명)</label>
										<input type="radio" name="pnsnKindName" id="pnsnKindName04" value="연금저축보험(손해)">
										<label for="pnsnKindName04">연금저축보험(손해)</label>
									</div>
								</li>
								<li>
									<p>상품유형</p>
									<div class="radio_list">
										<input type="radio" name="prdtTypeName" id="prdtTypeName01" checked="checked" value="">
										<label for="prdtTypeName01">전체</label>										
										<input type="radio" name="prdtTypeName" id="prdtTypeName03" value="주식형">
										<label for="prdtTypeName03">주식형</label>
										<input type="radio" name="prdtTypeName" id="prdtTypeName04" value="재간접형">
										<label for="prdtTypeName04">재간접형</label>
										<input type="radio" name="prdtTypeName" id="prdtTypeName05" value="금리연동형">
										<label for="prdtTypeName05">금리연동형</label>
									</div>
								</li>
							</ul>

							<!-- button -->
							<div class="btn_set btn_center">
								<div class="btn btn01">
									<input type="submit" value="조회">
								</div>
							</div>							
						</div>
						</form>
					</fieldset>
						
					</div>
					
					
							
						<div id="searchResultBox"></div>
								
						<div class="btn_set btn_center" id="js-btn-wrap">
							<div class="btn btn03">
								<a href="javascript:;" id="load">더보기</a>
							</div>
						</div>
						

		<div class="comp_prod_selector"style="display: none" id="btn1" >
		<!-- compsel_head -->
		<div class="compsel_head compsel_show">
			<h4 class="compsel_title">
				상품 비교함<span class="comp_num"></span>
				<div class="head_opt">
				<button type="button" onclick="productCompare12();"
					class="btn_layer_toggle">X
				</button>
				</div>
			</h4>
			<!-- head_opt -->
			
			<!-- //head_opt -->
		</div>
		<!-- //compsel_head -->

		<!-- compsel_body -->
		<div class="compsel_body" style="">

			<!-- compsel_prods -->
			<div class="compsel_prods">
			
				<!-- 안에 li 개수에 따라 ul.prod_list의 너비 값을 주어야 함 (li개수 x 140) li 개수 최대 10개 -->
				<ul class="prod_list" >
				
					<!-- none.js append 내부 데이터 들어옴 -->

				</ul>
				<div class="compselText">* [비교하기] 버튼을 클릭하면 위 상품들끼리 비교할 수 있습니다</div>
			</div>
			<!-- //compsel_prods -->

			<!-- compsel_opt_area -->
			<div class="compsel_opt_area">
				<div class="opt_select">

					<div id="chcdel">
					<div class="allCheckBox">
					<input type="checkbox" id="allCheck" name="allCheck"class="allCheck">
					</div>
					<button type="button" class="btn_compsel" id="deleteCardBtn" ><span>전체삭제</span></button>
					
					</div>
					
					<div id="compbtn">
					 
					<button type="button" class="btn_compsel sel_prod_comp"
						onclick="productCompare1()"><span>비교하기</span></button>
					</div>
					<!-- <button type="button" class="btn_compsel sel_prod_comp">비교하기</button>
						</div> -->
				
				<!-- //opt_select -->
				<!-- opt_delete -->
				<div class="opt_delete"></div>
				<!-- //opt_delete -->
			</div>
			<!-- //compsel_opt_area -->
		</div>
		<!-- //compsel_body -->
	</div>
	
	<!-- 상품 선택 모달 창 -->
	<div class="container">
		<div class="popup-wrap" id="popup" style="display: none">
			<!-- style="display: none" -->
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">PRODUCT COMPARE</span>
				</div>
				<div class="popup-body">
					<div class="body-content">

						<div class="body-contentbox"></div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm">확인</span> <span
						class="pop-btn close" id="close">창 닫기</span>
				</div>
			</div>
		</div>
	</div>

	</div>
				
				</section>
						
							
				<c:import url="/WEB-INF/views/layout/footer.jsp" />	
    	
    </div>
    				
    	
    
    
    <script id="compare-detail-template" type="text/template">
		<table class="modallist">
			<thead></thead>
			<tbody>
				<tr><th>회사명</th><td class="comNameTd"></td></tr>
				<tr><th>상품명</th><td class="prdNameTd"></td></tr>
				<tr><th>연금종류명</th><td class="pnsnKindNameTd"></td></tr>
				<tr><th>우대조건</th><td class="saleStartTd"></td></tr>
				<tr><th>최고한도</th><td class="prdtTypeNameTd"></td></tr>
				<tr><th>연평균 수익율</th><td class="avgPrftRateTd"></td></tr>
				<tr><th>공시이율</th><td class="dclsRateTd"></td></tr>
				<tr><th>최저 보증 이율</th><td class="guarRateTd"></td></tr>
				<tr><th>1년전 수익</th><td class="btrmPrftRate1Td"></td></tr>
				<tr><th>2년전 수익</th><td class="btrmPrftRate2Td"></td></tr>
				<tr><th>3년전 수익</th><td class="btrmPrftRate3Td"></td></tr>
				<tr><th>판매회사</th><td class="saleComTd"></td></tr>
				<tr><th>연금 수령기간</th><td class="pnsnRecTrmTd"></td></tr>
				<tr><th>연금 가입 연령</th><td class="pnsnEnterAgeTd"></td></tr>
				<tr><th>월 납입액</th><td class="monPayTd"></td></tr>
				<tr><th>납입기간</th><td class="payPeriodTd"></td></tr>
				<tr><th>연금 개시연령</th><td class="pnsnStartAgeTd"></td></tr>
				<tr><th>연금 수령액</th><td class="pnsnRecAmtTd"></td></tr>
			</tbody>
		</table>
		<div class="line"></div>
	</script>
  </body>
</html>