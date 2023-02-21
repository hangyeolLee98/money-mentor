/**
 * 
 */
function productCompare1(){
		
    			
    			$(".prod_list .oo").each(function(){
    				var rentHouseLoanID = $(this).find('.chkDelete').val();
        			var comName = $(this).find('.comName').val();
        			var prdName = $(this).find('.prdName').val();
        			var joinWay = $(this).find('.joinWay').val();
        			var loanInciExpn = $(this).find('.loanInciExpn').val();
        			var erlyRpayFee = $(this).find('.erlyRpayFee').val();
        			var dlyRate = $(this).find('.dlyRate').val();
        			var loanLimit = $(this).find('.loanLimit').val();
        			var rpayTypeName = $(this).find('.rpayTypeName').val();
        			var lendRateTypeName = $(this).find('.lendRateTypeName').val();
        			var lendRateMin = $(this).find('.lendRateMin').val();
        			var lendRateMax = $(this).find('.lendRateMax').val(); 
        			var lendRateAvg = $(this).find('.lendRateAvg').val();
        			
        			
        			var html = $.parseHTML($("#compare-detail-template").text());
        			
        			$(html).find(".comNameTd").text(comName);
        			$(html).find(".prdNameTd").text(prdName);
        			$(html).find(".joinWayTd").text(joinWay);
        			$(html).find(".loanInciExpnTd").text(loanInciExpn);
        			$(html).find(".erlyRpayFeeTd").text(erlyRpayFee);
        			$(html).find(".dlyRateTd").text(dlyRate);
        			$(html).find(".loanLimitTd").text(loanLimit);
        			$(html).find(".rpayTypeNameTd").text(rpayTypeName);
        			$(html).find(".lendRateTypeNameTd").text(lendRateTypeName);
        			$(html).find(".lendRateMinTd").text(lendRateMin);
        			$(html).find(".lendRateMaxTd").text(lendRateMax);
        			$(html).find(".lendRateAvgTd").text(lendRateAvg);
        			
        			$(".body-contentbox").append(html);
        			
        			const popup = document.getElementById('popup');
        			// const cardList = document.getElementById('btn1');
        						  
        			// btn1 보이기 (display: block)
        			if(popup.style.display == 'none') {
        				popup.style.display = 'flex';
        			} 
    			});
    			
    			
    

    		
    	};

$(function(){
	  $("#confirm").click(function(){
	 
	      modalClose(); //모달 닫기 함수 호출
       	 $( '.modallist').empty();
      //컨펌 이벤트 처리
  });
  $("#modal-open").click(function(){        
      $("#popup").css('display','flex').hide().fadeIn();
      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
  });
  $("#close").click(function(){
   
   
      modalClose(); //모달 닫기 함수 호출
        $( '.modallist').remove();
  });
  function modalClose(){
      $("#popup").fadeOut(); //페이드아웃 효과
  }
  
});




	
			