<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <script type="text/javascript">
$(function(){
    $(".lists__item").slice(0, 10).show(); // select the first ten
    $("#js-btn-wrap").click(function(e){ // click event for load more
        e.preventDefault();
        $(".lists__item:hidden").slice(0, 10).show(); // select next 10 hidden divs and show them
        
    });
});
</script> 
	
	<div class="cards">
			<div class="table">
				
			  	<div id="js-load" class="main">
				<ul class="list">
				<c:forEach var="card" items="${cardList1}" varStatus="status">

						<li value="${card.cardId}" id="${card.cardId}" class="lists__item js-load"  style="cursor: pointer;"> <!-- OnClick="location.href ='http://URL주소'" -->  
							
							<div class = "dd">
							<!-- 위에 상세주소  --> <a class="anchor" href=""> <!-- 상세페이지 url 넣기 -->
								<img class="cardImg" src="<c:url value='${card.cardImgUrl}'/>">
						</a> 
						<div class="info">
						<!-- 상세페이지 url 넣기 -->
							
						<a class="anchor"> <!-- 상세페이지 url 넣기 --> <b class="name">${card.cardName}</b>
						</a>
											
						<p class="desc">${card.cardDes}</p>
					</div>
					<div class="preview">
						<!-- 기본구문법1 -->
						<c:if test="${card.comCtg eq '현대'}">
							<a class="button button--wayra button--border-thick button--text-upper button--size-s"
							href="https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=${card.cardUrl}">카드신청</a>
						</c:if>
						<!-- 기본구문법2 -->
						<c:if test="${card.comCtg eq 'KB'}">
							<a class="button button--wayra button--border-thick button--text-upper button--size-s"
							href="https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=${card.cardUrl}">카드신청</a>
						</c:if>
						
						<c:if test="${card.comCtg eq 'lotte'}">
						<a class="button button--wayra button--border-thick button--text-upper button--size-s"
							href="${card.cardUrl}">카드신청</a>
						</c:if>
						<c:if test="${card.comCtg eq 'hana'}">
						<a class="button button--wayra button--border-thick button--text-upper button--size-s"
							href="${card.cardUrl}">카드신청</a>
						</c:if>
						
						<a class="button button--wayra button--border-thick button--text-upper button--size-s"
						 id="compare" onclick="toggleBtn1(${card.cardId})">
							<span class="icon"></span>
							<span class="compare_txt">상품비교</span>
						</a>
					</div>
	
					</div>
					</li>
					
				</c:forEach>
					
			</ul>
				 <div id="js-btn-wrap" class="btn-wrap"> <a href="#" class="morebutton" id="morebtn">
			더보기</a> </div>
				</div></div></div>
    				
    
			  
			

