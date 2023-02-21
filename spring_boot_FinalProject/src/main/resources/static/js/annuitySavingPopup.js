/**
 * 
 */
function productCompare1(){

    			
    			$(".prod_list .oo").each(function(){
    				var annuitySavingID = $(this).find('.chkDelete').val();
        			var comName = $(this).find('.comName').val();
        			var prdName = $(this).find('.prdName').val();
        			var pnsnKindName = $(this).find('.pnsnKindName').val();
        			var saleStart = $(this).find('.saleStart').val();
        			var prdtTypeName = $(this).find('.prdtTypeName').val();
        			var avgPrftRate = $(this).find('.avgPrftRate').val();
        			var dclsRate = $(this).find('.dclsRate').val();
        			var guarRate = $(this).find('.guarRate').val();
        			var btrmPrftRate1 = $(this).find('.btrmPrftRate1').val();
        			var btrmPrftRate2 = $(this).find('.btrmPrftRate2').val();
        			var btrmPrftRate3 = $(this).find('.btrmPrftRate3').val(); 
        			var saleCom = $(this).find('.saleCom').val();
        			var pnsnRecTrm = $(this).find('.pnsnRecTrm').val();
        			var pnsnEnterAge = $(this).find('.pnsnEnterAge').val();
        			var monPay = $(this).find('.monPay').val();
        			var payPeriod = $(this).find('.payPeriod').val();
        			var pnsnStartAge = $(this).find('.pnsnStartAge').val();
        			var pnsnRecAmt = $(this).find('.pnsnRecAmt').val();
        			
        			var html = $.parseHTML($("#compare-detail-template").text());
        			
        			$(html).find(".comNameTd").text(comName);
        			$(html).find(".prdNameTd").text(prdName);
        			$(html).find(".pnsnKindNameTd").text(pnsnKindName);
        			$(html).find(".saleStartTd").text(saleStart);
        			$(html).find(".prdtTypeNameTd").text(prdtTypeName);
        			$(html).find(".avgPrftRateTd").text(avgPrftRate);
        			$(html).find(".dclsRateTd").text(dclsRate);
        			$(html).find(".guarRateTd").text(guarRate);
        			$(html).find(".btrmPrftRate1Td").text(btrmPrftRate1);
        			$(html).find(".btrmPrftRate2Td").text(btrmPrftRate2);
        			$(html).find(".btrmPrftRate3Td").text(btrmPrftRate3);
        			$(html).find(".saleComTd").text(saleCom);
        			$(html).find(".pnsnRecTrmTd").text(pnsnRecTrm);
        			$(html).find(".pnsnEnterAgeTd").text(pnsnEnterAge);
        			$(html).find(".monPayTd").text(monPay);
        			$(html).find(".payPeriodTd").text(payPeriod);
        			$(html).find(".pnsnStartAgeTd").text(pnsnStartAge);
        			$(html).find(".pnsnRecAmtTd").text(pnsnRecAmt);
        			
        			$(".body-contentbox").append(html);
        			
        			const popup = document.getElementById('popup');
        			
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




	
			