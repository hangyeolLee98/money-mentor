<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>전세 자금 대출</title>
  <link rel ="stylesheet" type="text/css" href="<c:url value='/css/savingForm.css' />">
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/rentHouseLoanSearch.js' />"></script>
	<script src="<c:url value='/js/prdModal.js' />"></script>
	<script src="<c:url value='/js/rentHouseLoanPopup.js' />"></script>
    <c:import url="/WEB-INF/views/layout/head.jsp" />
   
  </head>
  <body>
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
						<form id="RentHouseLoanList">
						<div class="searchbox">
							<ul>
								
								<li class="searchbar">
									<label for="prdName">은행명</label>
									<input type="text" name="prdName" id="prdName" style="width:800px">
									
								</li>
								
								<li>
									<p>가입방법</p>
									<div class="radio_list">
									<input type="radio" name="joinWay" id="joinWay01" checked="checked" value="">
										<label for="joinWay01">전체</label>
										<input type="radio" name="joinWay" id="joinWay02" value="인터넷">
										<label for="joinWay02">인터넷</label>
										<input type="radio" name="joinWay" id="joinWay03" value="스마트폰">
										<label for="joinWay03">스마트폰</label>
										<input type="radio" name="joinWay" id="joinWay04" value="영업점">
										<label for="joinWay04">영업점</label>
										<input type="radio" name="joinWay" id="joinWay06" value="모집인">
										<label for="joinWay06">모집인</label>
									</div>
								</li>
								<li>
									<p>대출상환유형</p>
									<div class="radio_list">
										<input type="radio" name="rpayTypeName" id="rpayTypeName01" checked="checked" value="">
										<label for="rpayTypeName01">전체</label>										
										<input type="radio" name="rpayTypeName" id="rpayTypeName02" value="분할상환방식">
										<label for="rpayTypeName02">분할상환방식</label>
										<input type="radio" name="rpayTypeName" id="rpayTypeName03" value="만기일시상환방식">
										<label for="rpayTypeName03">만기일시상환방식</label>
										
										
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
				<tr><th>가입방법</th><td class="joinWayTd"></td></tr>
				<tr><th>대출 부대비용</th><td class="loanInciExpnTd"></td></tr>
				<tr><th>중도상환 수수료</th><td class="erlyRpayFeeTd"></td></tr>
				<tr><th>연체 이자율</th><td class="dlyRateTd"></td></tr>
				<tr><th>대출한도</th><td class="loanLimitTd"></td></tr>
				<tr><th>대출상환유형</th><td class="rpayTypeNameTd"></td></tr>
				<tr><th>대출금리유형</th><td class="lendRateTypeNameTd"></td></tr>
				<tr><th>대출금리_최저[소수점 2자리]</th><td class="lendRateMinTd"></td></tr>
				<tr><th>대출금리_최고[소수점 2자리]</th><td class="lendRateMaxTd"></td></tr>
				<tr><th>전월 취급 평균금리</th><td class="lendRateAvgTd"></td></tr>
			</tbody>
		</table>
		<div class="line"></div>
	</script>
  </body>
</html>