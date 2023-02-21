<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드비교</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/List.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/List_out.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/more.css'/>">
	<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/more.js' />"></script>
	<script src="<c:url value='/js/cardSearch.js' />"></script>
	<script src="<c:url value='/js/none.js' />"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/popup.css'/>">
<script src="<c:url value='/js/popup.js'/>"></script>
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="cardSec">
	<div class="filters">
		<div class="table">
			<div class="category">
				<form id="CardList">
					<div class="search ">
						<input id="cardId" type="text" name="keyword"
							class="input-search-word" placeholder="카드이름을 입력해주세요."> <img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							id="sreachimg">

					</div>

				</form>
			</div>
	<form id="CardListFi">

			<div class="category">
				<h5 class="title">카드사</h5>
				<div class="btncontainer">
					<button class="item" type="button" name="comCtg" value="">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					<button class="item" type="button" name="comCtg" value="KB">
						<span class="cardbtnImg"><img class="iogo" alt="국민카드"
							src="/image/KB.png"></span>
					</button>
					<button class="item" type="button" name="comCtg" value="현대" >
						<span class="cardbtnImg"><img class="iogo" alt="현대카드"
							src="/image/HD.png"></span>
					</button>
					<button class="item" type="button" name="comCtg" value="lotte" >
						<span class="cardbtnImg"><img class="iogo" alt="롯데카드"
							src="/image/LOTTE.png"></span>
					</button>
					<button class="item" type="button" name="comCtg" value="hana" >
						<span class="cardbtnImg"><img class="iogo" alt="하나은행"
							src="/image/HN.png"></span>
					</button>
					
				</div>
			</div>
			<div class="category">
				<h5 class="title">혜택</h5>
				<div class="btncontainer">
					<button class="item" type="button"  name="cardDes" value="">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					<button class="item" type="button"  name="cardDes" value="주유">
						<span class="w-btn w-btn-indigo">주유</span>
					</button>
					<button class="item" type="button"  name="cardDes" value="통신">
						<span class="w-btn w-btn-indigo">통신</span>
					</button>
					<button class="item" type="button" name="cardDes" value="교통">
						<span class="w-btn w-btn-indigo">교통</span>
					</button>
					<button class="item" type="button" name="cardDes" value="쇼핑">
						<span class="w-btn w-btn-indigo">쇼핑</span>
					</button>
					<button class="item" type="button" name="cardDes" value="외식">
						<span class="w-btn w-btn-indigo">외식</span>
					</button>
					<button class="item" type="button" name="cardDes" value="차">
						<span class="w-btn w-btn-indigo">자동차</span>
					</button>
					<button class="item" type="button" name="cardDes" value="해외">
						<span class="w-btn w-btn-indigo">해외</span>
					</button>
					<button class="item" type="button" name="cardDes" value="편의점">
						<span class="w-btn w-btn-indigo">편의점</span>
					</button>
					<button class="item" type="button" name="cardDes" value="보험">
						<span class="w-btn w-btn-indigo">보험</span>
					</button>
					<button class="item" type="button" name="cardDes" value="OTT">
						<span class="w-btn w-btn-indigo">OTT</span>
					</button>
					
					<!-- 더 추가가능 -->
				</div>

			</div>

			<div class="category">
				<h5 class="title">연회비</h5>
				<div class="btncontainer">
				
					<button class="item" type="button" name="cardFee" value="0" >
						<span class="w-btn w-btn-indigo">전체</span>
						
					</button>
					
					
					<button class="item" type="button" name="cardFee" value="1">
					
						<span class="w-btn w-btn-indigo" >~1만원</span>
					</button>
					<button class="item" type="button" name="cardFee" value="2">
						<span class="w-btn w-btn-indigo">~3만원</span>
					</button>
					<button class="item" type="button" name="cardFee" value="3">
						<span class="w-btn w-btn-indigo">~10만원</span>
					</button>
					<button class="item" type="button" name="cardFee" value="4">
						<span class="w-btn w-btn-indigo">10만원 이상</span>
					</button>
				</div>
			</div>

</form>
		</div>
	</div>
	<!-- cardSearchResultView -->
	<div id="searchResultBox"></div>


	<div class="comp_prod_selector" style="display: none" id='btn1'>
		<!-- compsel_head -->
		<div class="compsel_head compsel_show">
			<h4 class="compsel_title">
				상품비교<span class="comp_num"></span>
				<div class="head_opt">
				<button type="button" onclick="productCompare12();"
					class="btn_layer_toggle">닫기</button>
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
				<ul class="prod_list" style="width: 280px;">
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
						onclick="productCompare1()">상품비교</button>
						</div>
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
	</section>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
