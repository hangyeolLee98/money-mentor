<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/image/MomentorLogo.png'/>">
		<title>momentor</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/index.css' />">
	<script src="<c:url value='/js/jquery-3.6.1.min.js'/>" ></script>
	<script src="<c:url value='/js/index.js'/>" ></script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		<section id="section_main">
		<div class="sec_main_div">
			<div class="img_main">
					<div class="img_box_center">
						<img class="mainimg" src="<c:url value='/image/mainimgreal.png'/>" >
					</div>
				<div class="sec_img_div">
				 	<div class="img_text">
				 		<span id="text_p">2</span>0<span id="text_p">3</span>0의 자산관리 𝒎𝒆𝒏𝒕𝒐𝒓, 모멘토
				 	</div>
				 	<p class="img_text2">𝑻𝒉𝒆 𝒄𝒉𝒐𝒊𝒄𝒆 𝒐𝒇 𝒕𝒉𝒆 𝒎𝒐𝒎𝒆𝒏𝒕 𝒅𝒆𝒕𝒆𝒓𝒎𝒊𝒏𝒆𝒔 𝒕𝒉𝒆 𝒇𝒖𝒕𝒖𝒓𝒆</p>
				 	<div>
				 		<div class="img_text3">
				 			흩어진 데이터를 한눈에 비교
				 		</div>
				 		<div class="img_text3">
				 			연령별 데이터의 정제화 
				 		</div>
				 	</div>
				 </div>
			</div>
			<div class="disunite_div" ></div>
			<div class="menubar">
				<div class="menubar_div">
					<div><a href="<c:url value='/calculator'/>" onclick="window.open(this.href, '_blank', 'width=850,height=600,toolbars=no,scrollbars=no, left=300, top=150'); return false;">계산기</a></div>
					<div><a href="<c:url value='/chatbotForm'/>" onclick="window.open(this.href, '_blank', 'width=450,height=600,toolbars=no,scrollbars=no, left=300, top=150'); return false;" >챗봇</a></div>
					<div><a href="<c:url value='/profile/calender'/>">캘린더</a></div>
					<div><a href="<c:url value='/CardList'/>">카드 상품</a></div>
					<div><a href="<c:url value='/savingForm'/>">적금 상품</a></div>
				</div>
			</div>
			<div class="sec_pick">
				<div class="pick_main_div">
					<div class="pick_title">
						<div class="pick_title_1">금융 상품 비교 어렵지 않아요</div> 
						<div class="pick_title_2">모멘토의 서비스는 편하게 비교합니다.</div> 
					</div>
					<div class="pick_img">
			 			<span class="pick_card_img"><ion-icon name="card-outline" /></span>
			 			<span class="pick_bank_img"><ion-icon name="storefront-outline" /></span>
			 			<span class="pick_cel_img"><ion-icon name="calendar-outline" /></span>
			 		</div>
			 		<div class="pick_text">
						<span class="pick_card_text">
							<div class="text_title">다양한 <span id="title_name">카드</span> 상품</div><br>
							<span>은행사, 카드사의 모든 카드를 비교</span><br>
							<span>개인자산에 맞는 카드 추천 까지 </span><br>
							<span>직접 찾지말고 모멘토의 데이터를 이용해요</span><br>
						</span> 
						<span class="pick_bank_text">
							<div class="text_title">편리한 <span id="title_name">금융</span> 상품</div><br>
							<span>쏟아져나오는 높은 금리 상품들</span><br>
							<span>예금, 적금 찾아보기 힘드시죠?</span><br>
							<span>모멘토에서 간단히 비교해보세요</span><br>
						</span> 
						<span class="pick_cel_text">
							<div class="text_title"><span id="title_name">캘린더</span>로 일정관리</div><br>
							<span>계획 세우기 힘들고 바쁜 2030</span><br>
							<span>자산입력 후 체크만 하면 보기 편하게</span><br>
							<span>캘린더로 보여드릴게요.</span>
						</span> 
			 		</div>
				</div>
			</div>
			<div class="disunite_div" ></div>
			<div class="sec_finance">
			 	<div class="fin_main_div">
			 		<div class="fin_tag">
			 			<button class="finBtn" id="fin_card">카드</button>
			 			<button class="finBtn" id="fin_loan">보험</button>
			 			<button class="finBtn" id="fin_sd">적금</button>
			 			<button class="finBtn" id="fin_ann">연금</button>
			 		</div>
			 		<div class="fin_tag_see">
			 			<div class="fin_see cardSee">
			 				<div class="fin_see_title">카드 카테고리</div>
			 				<div class="see_sec">
			 					<div class="see_sec1"><br>
			 						<div class="img_section">
			 							<div class="card_Img_div">
	 							 			
			 							</div>
			 						</div>
			 					</div>
			 				</div>
			 			</div>
						<div class="fin_see loanSee">
			 				<div class="fin_see_title">보험 카테고리</div>
			 				<div class="see_sec">
			 					<div  class="see_sec1">
			 						<div class="img_section">
			 							<div  class="loan_Img_div">
			 							
			 							</div>
			 						</div>
			 					</div>
			 				</div>
			 			</div>
			 			<div class="fin_see sdSee">
			 				<div class="fin_see_title">적금 카테고리</div>
			 				<div class="see_sec">
			 					<div  class="see_sec1">
			 						<div class="img_section">
			 							<div  class="sd_Img_div">
			 							
			 							</div>
			 						</div>
			 					</div>
			 					
			 				</div>
			 			</div>
			 			<div class="fin_see annSee">
			 				<div class="fin_see_title">연금 카테고리</div>
			 				<div class="see_sec">
			 					<div  class="see_sec1">
				 					<div class="img_section">
				 						<div  class="ann_Img_div">
				 						
				 						</div>
			 						</div>
		 						</div>
			 				</div>
			 			</div>
			 		</div>
			 	</div>	
			 	
			</div>
			
		</div>
		<div class="disunite_div" ></div>
		</section>
		
		<!-- footer.jsp -->
		<c:import url="/WEB-INF/views/layout/footer.jsp" />
	</body>
</html>
						