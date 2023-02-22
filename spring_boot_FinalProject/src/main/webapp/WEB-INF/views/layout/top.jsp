<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header id="header_main">
			<div class="header_main_div">
				<div class="hd_div">
					<!-- width1150이상 -->
					<div class="hd_row2_menu">
						<ul class="hd_menu1" id="hd_menu1_id1">
							<li id="menu1_1"><a id="momentor_loge" href="<c:url value='/'/>"><img id="main_logo"src="<c:url value='/image/MomentorLogo.png'/>"></a></li>
						</ul>
						<ul class="hd_menu1 menu1_ul2">
							<li id="menu1_2"><div>고객센터</div>
								<ul class="hd_menu_sub">
									<li><a href="<c:url value='/chatbotForm'/>" onclick="window.open(this.href, '_blank', 'width=500,height=740,toolbars=no,scrollbars=no, left=300, top=150'); return false;" >챗봇</a></li>
									<li><a href="<c:url value='/calculator'/>" onclick="window.open(this.href, '_blank', 'width=850,height=600,toolbars=no,scrollbars=no, left=300, top=150'); return false;">계산기</a></li>
									<li><a href="<c:url value='/all/serviceCenter'/>">고객센터</a></li>
								</ul>
							</li>
							<li id="menu1_2"><div>사업소개</div>
								<ul class="hd_menu_sub">
									<li><a href="<c:url value='/all/introduce'/>">모멘토란</a></li>
								</ul>
							</li>
							<li id="menu1_3"><div>비교 & 추천</div>
								<ul class="hd_menu_sub">
									<li><a href="<c:url value='/CardList'/>">카드 상품</a></li>
									<li><a href="<c:url value='/savingForm'/>">적금 상품</a></li>
									<li><a href="<c:url value='/depositForm'/>">예금 상품</a></li>
									<li><a href="<c:url value='/creditLoanForm'/>">신용 대출 상품</a></li>
									<li><a href="<c:url value='/rentHouseLoanForm'/>">전세 대출 상품</a></li>
									<li><a href="<c:url value='/annuitySavingForm'/>">연금 상품</a></li>
									<li><a href="<c:url value='/InsuList'/>">보험 상품</a></li>
								</ul>
							</li>
							<li id="menu1_4"><div>My Momentor</div>
								<ul class="hd_menu_sub">
									<li><a href="<c:url value='/profile/calender'/>">캘린더</a></li>
									<c:if test="${empty sessionScope.sid}">
										<li><a href="<c:url value='/user/loginForm'/>">정보입력</a></li>
									</c:if>
									<c:if test="${not empty sessionScope.sid}">
										<li><a href="<c:url value='/user/assetInfoForm/${sessionScope.sid}'/>">정보입력</a></li>
									</c:if>
								</ul>
							</li>
						</ul>
					</div>
					<div class="hd_row1_menu">
				
					 <c:if test="${empty sessionScope.sid}">
						<span id="span_text"><a href="<c:url value='/user/loginForm'/>">로그인</a></span>
						<span id="span_line">ㅣ</span>
						<span id="span_text"><a href="<c:url value='/user/joinForm'/>">회원가입</a></span>
						<span id="span_line">ㅣ</span>
						<span id="span_text"><a>이용약관</a></span>
					</c:if>	
					<c:if test="${not empty sessionScope.sid}">
						<span id="span_text">${sessionScope.suserName}님  &nbsp;</span>
						<span id="span_text"><a href="<c:url value='/user/logout'/>">로그아웃</a></span>
						<span id="span_line">ㅣ</span>
						<span id="span_text"><a>이용약관</a></span>
					</c:if>
					
					</div>
				</div>	
				<!-- width1150이하 -->
				<div class="hd_div2">
					<div class="menu_under1100">
						<div id="under_span"><a  class="underList" href="<c:url value='/#'/>">목록</a>
							<ul class="under_span_ul">
								<li><a href="<c:url value='/all/introduce'/>">모멘토란</a></li>
								<li><a href="<c:url value='/user/assetInfoForm'/>">정보입력</a></li>
								<li><a href="<c:url value='/CardList'/>">카드 상품</a></li>
								<li><a href="<c:url value='/savingForm'/>">적금 상품</a></li>
								<li><a href="<c:url value='/depositForm'/>">예금 상품</a></li>
								<li><a href="<c:url value='/insuList'/>">보험 상품</a></li>
								<li><a href="<c:url value='/creditLoanForm'/>">신용 대출 상품</a></li>
								<li><a href="<c:url value='/rentHouseLoanForm'/>">전세 대출 상품</a></li>
								<li><a href="<c:url value='/annuitySavingForm'/>">연금 상품</a></li>
								<li><a href="<c:url value='/profile/calender'/>">캘린더</a></li>
								<li><a href="<c:url value='/all/chatbot'/>">챗봇</a></li>
								<li><a href="<c:url value='/all/serviceCenter'/>">고객센터</a></li>
							</ul>
						</div>
						<div id="under_span"><a id="momentor_loge" href="<c:url value='/'/>">Momentor</a></div>
						<c:if test="${empty sessionScope.sid}">
							<div id="under_span"><a href="<c:url value='/user/loginForm'/>"><ion-icon name="lock-closed-outline" /></a>
							</div>
						</c:if>
						<c:if test="${not empty sessionScope.sid}">
							<div id="under_span"><a href="<c:url value='/user/logout'/>"><ion-icon name="lock-open-outline" /></a>
							</div>
						</c:if>
					</div>
				</div>				
			</div>
			<div class="progress_div">
				<div class="progress_bar" id="indicator"></div>
			</div>
		</header>