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
				<c:forEach var="insu" items="${insuList1}" varStatus="status">

						<li value="${insu.insuId}" id="${insu.insuId}" class="lists__item js-load"  style="cursor: pointer;"> <!-- OnClick="location.href ='http://URL주소'" -->  
							
							<div class = "dd">
							<!-- 위에 상세주소  --> <a class="anchor" href=""> <!-- 상세페이지 url 넣기 -->
								<img class="cardImg" src="<c:url value='${insu.prdLogo}'/>">
						</a> 
						<div class="info">
						<!-- 상세페이지 url 넣기 -->
							
						<a class="anchor"> <!-- 상세페이지 url 넣기 --> <b class="name">${insu.insuName}</b>
						</a>
											
						<p class="desc">${insu.insuCtg} 보험</p>
					</div>
					
					<div class="preview">
						<!-- 기본구문법1 -->
						
							<a class="button button--wayra button--border-thick button--text-upper button--size-s"
							href="${insu.insuJoinURL}">보험신청</a>
						
						<a class="button button--wayra button--border-thick button--text-upper button--size-s"
						 id="compare" onclick="toggleBtn1(${insu.insuId})">
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
    				
    
			  
			

