<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>적금 리스트</title>
    <link rel ="stylesheet" type="text/css" href="<c:url value='/css/savingForm.css' />">
    <script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/savingSearch.js' />"></script>
	<script src="<c:url value='/js/prdModal.js' />"></script>
	<script src="<c:url value='/js/prdPopup.js' />"></script>
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
						<form id="SavingList">
						<div class="searchbox">
							<ul>
								<li class="searchbar">
									<label for="prdName">은행명</label>
									<input type="text" name="prdName" id="prdName" style="width:800px" >
								</li>
								
								<li>
									<p>가입방법</p>
									<div class="radio_list">
									<input type="radio" name="joinWay" id="way01" checked="checked" value="">
										<label for="way01">전체</label>
										<input type="radio" name="joinWay" id="way02" value="인터넷">
										<label for="way02">인터넷</label>
										<input type="radio" name="joinWay" id="way03" value="스마트폰">
										<label for="way03">스마트폰</label>
										<input type="radio" name="joinWay" id="way04" value="영업점">
										<label for="way04">영업점</label>
									</div>
								</li>
								<li>
									<p>가입기간</p>
									<div class="radio_list">
										<input type="radio" name="saveTrm" id="date_01" checked="checked" value="">
										<label for="date_01">전체</label>										
										<input type="radio" name="saveTrm" id="date_03" value="6">
										<label for="date_03">3~6개월 미만</label>
										<input type="radio" name="saveTrm" id="date_04" value="12">
										<label for="date_04">6~12개월 미만</label>
										<input type="radio" name="saveTrm" id="date_05" value="24">
										<label for="date_05">12~24개월 미만</label>
										<input type="radio" name="saveTrm" id="date_06" value="36">
										<label for="date_06">24개월 이상</label>
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
				상품 비교<span class="comp_num"></span>
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
			</div>
			<!-- //compsel_prods -->

			<!-- compsel_opt_area -->
			<div class="compsel_opt_area">
				<div class="opt_select">

					<div id="chcdel">
					<input type="checkbox" id="allCheck" name="allCheck"class="allCheck">
					<button type="button" class="btn_compsel" id="deleteCardBtn" >삭제</button>
					
					</div>
					<div id="compbtn">
					 
					<button type="button" class="btn_compsel sel_prod_comp"
						onclick="productCompare1()">비교하기</button>
					
					<!-- <button type="button" class="btn_compsel sel_prod_comp">비교하기</button>
						</div> -->
				</div>
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
				<tr><th>만기 후 이자율</th><td class="interestTd"></td></tr>
				<tr><th>우대조건</th><td class="spclCndTd"></td></tr>
				<tr><th>최고한도</th><td class="maxLimitTd"></td></tr>
				<tr><th>가입대상</th><td class="joinMemberTd"></td></tr>
				<tr><th>기타 유의사항</th><td class="etcNoteTd"></td></tr>
				<tr><th>저축 금리</th><td class="intrRateTd"></td></tr>
				<tr><th>최고 우대금리</th><td class="intrRate2Td"></td></tr>
				<tr><th>저축 기간</th><td class="saveTrmTd"></td></tr>
				<tr><th>적립유형명</th><td class="rsrvTypeNameTd"></td></tr>
				<tr><th>저축 금리 유형명</th><td class="intrRateTypeNameTd"></td></tr>
			</tbody>			
		</table>
		<div class="line"></div>
  </script>
  </body>
</html>