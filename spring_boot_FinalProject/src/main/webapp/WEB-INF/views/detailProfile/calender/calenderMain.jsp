<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>캘린더</title>
	 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/calenderIndex.css' />">
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
		<script src="https://kit.fontawesome.com/bb34e32cb3.js" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	</head>
	<body>
		<!--헤더-->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<div id="body">
			<section>
				<div id="calender-head">
					<select id="select-view" name="select-view" class="calender-head-items calender-head-text">
						<option value="calender" selected>캘린더</option>
						<option value="chart">차트</option>
					</select>
					<div class="calender-date-view">
						<div class="calender-head-items view-date">
							<button id="year-select-btn" class="calender-head-text">
								<span id="now-year"></span>
							</button>
							<button id="month-select-btn" class="calender-head-text">
								<span id="now-month"></span>
							</button>
						</div>
						<div class="calender-head-items calender-head-text">
							<button class="prev-month-btn btn" title="이전 달로 이동">
								<i class="fa fa-chevron-left"></i>
							</button>
							<button class="next-month-btn btn" title="다음 달로 이동">
								<i class="fa fa-chevron-right"></i>
							</button>
							<button class="view-today-btn btn" title="오늘로 이동">
								<span class="today-btn-text">오늘</span>
							</button>
						</div>
					</div>
				</div>
				<div id="main">
					<div id="plan-view">
						<div id="plan-view-header">
							<div class="plan-view-title view-header-title">일정</div>
							<div class="year-month"></div>
							<div id="plan-list-toMonth"></div>
						</div>
						<div id="plan-list-view-box" class="view-box hide">
							<div id="plan-list-view" class="list-view">
								<div class="plan-view-title">일정 관리하기</div>
								<button id="plan-list-view-btn" class="p-btn" title="일정 관리 버튼">
									<i id="plan-icon" class="fa fa-plus"></i>
								</button>
							</div>
							<div id="plan-list-box" style="display:none">
							</div>
						</div>
					</div>
					<div id="calender"> 
						<div id="calender-view">
							<table>
								<tbody id="calender-view-box">
								</tbody>
								<tbody id="year-select-Box">
								</tbody>
								<tbody id="month-select-Box">
								</tbody>
							</table>
						</div>
						<div id="chart-view" style="display:none">
						</div>
						<div id="prd-view-option-box">
							<div id="prd-items-view" class="hide">
								<div id="prd-items-btn-box">
									<button class="prd-items-view-btn p-btn">
										<i id="prd-icon" class="fa fa-plus"></i>
									</button>
									<button id="add-custom-prd" style="display:none">
										일정추가
									</button>
								</div>
								<div id="search-option" style="display:none">
									<div id="search-box">
										<input type="text" id="searchTextBox" name="searchText" placeholder="검색어 입력"><button id="searchBtn" class="p-btn"><i class="fa fa-search"></i></button>
									</div>
									<select id="prd-kind-select" name="prd-kind-select">
										<option value="card" selected>카드</option>
										<option value="insu">보험</option>
										<option value="deposit">예금</option>
										<option value="saving">적금</option>
									</select>
									<select id="prd-kind-select-option" name="prd-kind-select-option">
										<option value="default" selected>선택</option>
									</select>
									<select id="prd-order-select" name="order">
										<option value="default" selected>기본</option>
										<option value="name">이름순</option>
										<option value="latest">최신순</option>
										<option value="recomment">추천순</option>
									</select>
								</div>
							</div>
							<div id="prd-list-box" style="display:none">
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<c:import url="/WEB-INF/views/layout/footer.jsp" />
	</body>
	 <script src="<c:url value='/js/calender.js' />"> </script>
	 <script src="<c:url value='/js/calenderProduct.js' />"> </script>
	 <script src="<c:url value='/js/plan.js' />"> </script>
	 <script src="<c:url value='/js/calenderChart.js' />"> </script>
</html>