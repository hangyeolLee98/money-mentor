<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보험비교</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Insu.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/insu_out.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/more.css'/>">
	<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
	<script src="<c:url value='/js/more.js' />"></script>
	<script src="<c:url value='/js/insuSearch.js' />"></script>
	<script src="<c:url value='/js/insunone.js' />"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/insupopup.css'/>">
<script src="<c:url value='/js/insupopup.js'/>"></script>
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section class="cardSec">
	<div class="filters">
		<div class="table">
			<div class="category">
				<form id="CardList">
					<div class="search">
						<input id="insuId" type="text" name="keyword"
							class="input-search-word" placeholder="카드이름을 입력해주세요."> <img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							id="sreachimg">

					</div>

				</form>
			</div>
	<form id="CardListFi">
	
	<div class="category">
				<h5 class="title">Insurance</h5>
				<div class="btncontainer">
					<button class="item" type="button" name="insuCtg" value="">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="암진단">
						<span class="w-btn w-btn-indigo">암보험</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="질병" >
						<span class="w-btn w-btn-indigo">질병보험</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="상해" >
						<span class="w-btn w-btn-indigo">상해보험</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="화재" >
						<span class="w-btn w-btn-indigo">화재보험</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="자동차" >
						<span class="w-btn w-btn-indigo">자동차보험</span>
					</button>
					<button class="item" type="button" name="insuCtg" value="실손의료" >
						<span class="w-btn w-btn-indigo">실손의료보험</span>
					</button>
				</div>
	</div>

			<div class="category">
				<h5 class="title">보험사</h5>
				<div class="btncontainer">
					<button class="item" type="button" name="prdLogo" value="">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					
					<button class="item" type="button" name="prdLogo" value="AIA생명" >
						<span class="cardbtnImg"><img class="iogo" alt="AIA생명"
							src="https://www.e-insmarket.or.kr/img/company/L52.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="BNP파리바카디프생명" >
						<span class="cardbtnImg"><img class="iogo" alt="BNP파리바카디프생명"
							src="https://www.e-insmarket.or.kr/img/company/L78.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="DB생명" >
						<span class="cardbtnImg"><img class="iogo" alt="DB생명"
							src="https://e-insmarket.or.kr/img/company/L71.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="DB손보" >
						<span class="cardbtnImg"><img class="iogo" alt="DB손보"
							src="https://www.e-insmarket.or.kr/img/company/N11.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="DGB생명" >
						<span class="cardbtnImg"><img class="iogo" alt="DGB생명"
							src="https://www.e-insmarket.or.kr/img/company/L31.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="KB라이프생명" >
						<span class="cardbtnImg"><img class="iogo" alt="KB라이프생명"
							src="https://www.e-insmarket.or.kr/img/company/L61.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="KB손보" >
						<span class="cardbtnImg"><img class="iogo" alt="KB손보"
							src="https://www.e-insmarket.or.kr/img/company/N10.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="KDB생명" >
						<span class="cardbtnImg"><img class="iogo" alt="KDB생명"
							src="https://www.e-insmarket.or.kr/img/company/L33.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="MG손보" >
						<span class="cardbtnImg"><img class="iogo" alt="MG손보"
							src="https://www.e-insmarket.or.kr/img/company/N04.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="교보라이프플래닛" >
						<span class="cardbtnImg"><img class="iogo" alt="교보라이프플래닛"
							src="https://www.e-insmarket.or.kr/img/company/L43.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="교보생명" >
						<span class="https://e-insmarket.or.kr/img/company/L05.png"><img class="iogo" alt="교보생명"
							src="https://www.e-insmarket.or.kr/img/company/L43.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="농협생명" >
						<span class="cardbtnImg"><img class="iogo" alt="농협생명"
							src="https://www.e-insmarket.or.kr/img/company/L42.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="농협손보" >
						<span class="cardbtnImg"><img class="iogo" alt="농협손보"
							src="https://www.e-insmarket.or.kr/img/company/N71.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="동양생명" >
						<span class="cardbtnImg"><img class="iogo" alt="동양생명"
							src="https://www.e-insmarket.or.kr/img/company/L74.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="라이나생명" >
						<span class="cardbtnImg"><img class="iogo" alt="라이나생명"
							src="https://www.e-insmarket.or.kr/img/company/L51.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="롯데손보" >
						<span class="cardbtnImg"><img class="iogo" alt="롯데손보"
							src="https://www.e-insmarket.or.kr/img/company/N03.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="메리츠화재" >
						<span class="cardbtnImg"><img class="iogo" alt="메리츠화재"
							src="https://e-insmarket.or.kr/img/company/N01.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="메트라이프생명" >
						<span class="cardbtnImg"><img class="iogo" alt="메트라이프생명"
							src="https://www.e-insmarket.or.kr/img/company/L72.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="미래에셋생명" >
						<span class="cardbtnImg"><img class="iogo" alt="미래에셋생명"
							src="https://www.e-insmarket.or.kr/img/company/L34.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="삼성생명" >
						<span class="cardbtnImg"><img class="iogo" alt="삼성생명"
							src="https://www.e-insmarket.or.kr/img/company/L03.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="삼성화재" >
						<span class="cardbtnImg"><img class="iogo" alt="삼성화재"
							src="https://www.e-insmarket.or.kr/img/company/N08.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="신한라이프생명" >
						<span class="cardbtnImg"><img class="iogo" alt="신한라이프생명"
							src="https://www.e-insmarket.or.kr/img/company/L11.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="에이스보험" >
						<span class="cardbtnImg"><img class="iogo" alt="에이스보험"
							src="https://www.e-insmarket.or.kr/img/company/N52.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="캐롯손보" >
						<span class="cardbtnImg"><img class="iogo" alt="캐롯손보"
							src="https://www.e-insmarket.or.kr/img/company/N69.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="푸본현대생명" >
						<span class="cardbtnImg"><img class="iogo" alt="푸본현대생명"
							src="https://www.e-insmarket.or.kr/img/company/L17.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="하나생명" >
						<span class="cardbtnImg"><img class="iogo" alt="하나생명"
							src="https://www.e-insmarket.or.kr/img/company/L63.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="하나손보" >
						<span class="cardbtnImg"><img class="iogo" alt="하나손보"
							src="https://www.e-insmarket.or.kr/img/company/N17.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="한화생명" >
						<span class="cardbtnImg"><img class="iogo" alt="한화생명"
							src="https://www.e-insmarket.or.kr/img/company/L01.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="한화손보" >
						<span class="cardbtnImg"><img class="iogo" alt="한화손보"
							src="https://www.e-insmarket.or.kr/img/company/N02.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="현대해상" >
						<span class="cardbtnImg"><img class="iogo" alt="현대해상"
							src="https://www.e-insmarket.or.kr/img/company/N09.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="흥국생명" >
						<span class="cardbtnImg"><img class="iogo" alt="흥국생명"
							src="https://www.e-insmarket.or.kr/img/company/L04.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="흥국화재" >
						<span class="cardbtnImg"><img class="iogo" alt="흥국화재"
							src="https://e-insmarket.or.kr/img/company/N05.png"></span>
					</button>
					<button class="item" type="button" name="prdLogo" value="ABL생명">
						<span class="cardbtnImg"><img class="iogo" alt="ABL생명"
							src="https://www.e-insmarket.or.kr/img/company/L02.png"></span>
					</button>
					
				</div>
			</div>
			<div class="category">
				<h5 class="title">보험가격지수</h5>
				<div class="btncontainer">
					<button class="item" type="button"  name="insuIndex" value="0">
						<span class="w-btn w-btn-indigo">전체</span>
					</button>
					<button class="item" type="button"  name="insuIndex" value="1">
						<span class="w-btn w-btn-indigo">~80%</span>
					</button>
					<button class="item" type="button"  name="insuIndex" value="2">
						<span class="w-btn w-btn-indigo">~90%</span>
					</button>
					<button class="item" type="button" name="insuIndex" value="3">
						<span class="w-btn w-btn-indigo">~100%</span>
					</button>
					<button class="item" type="button" name="insuIndex" value="4">
						<span class="w-btn w-btn-indigo">~110%</span>
					</button>
					<button class="item" type="button" name="insuIndex" value="5">
						<span class="w-btn w-btn-indigo">~120%</span>
					</button>
					<button class="item" type="button" name="insuIndex" value="6">
						<span class="w-btn w-btn-indigo">120%~</span>
					</button>
					<!-- 더 추가가능 -->
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
