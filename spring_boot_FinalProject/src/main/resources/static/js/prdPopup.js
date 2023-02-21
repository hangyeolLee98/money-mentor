/**
 * 
 */
function productCompare1(){
		
    			$(".prod_list .oo").each(function(){
    				var savingID = $(this).find('.chkDelete').val();
        			var comName = $(this).find('.comName').val();
        			var prdName = $(this).find('.prdName').val();
        			var joinWay = $(this).find('.joinWay').val();
        			var interest = $(this).find('.interest').val();
        			var spclCnd = $(this).find('.spclCnd').val();
        			var maxLimit = $(this).find('.maxLimit').val();
        			var joinMember = $(this).find('.joinMember').val();
        			var etcNote = $(this).find('.etcNote').val();
        			var intrRate = $(this).find('.intrRate').val();
        			var intrRate2 = $(this).find('.intrRate2').val();
        			var saveTrm = $(this).find('.saveTrm').val(); 
        			var rsrvTypeName = $(this).find('.rsrvTypeName').val();
        			var intrRateTypeName = $(this).find('.intrRateTypeName').val();
        			
        			var html = $.parseHTML($("#compare-detail-template").text());
        			
        			$(html).find(".comNameTd").text(comName);
        			$(html).find(".prdNameTd").text(prdName);
        			$(html).find(".joinWayTd").text(joinWay);
        			$(html).find(".interestTd").text(interest);
        			$(html).find(".spclCndTd").text(spclCnd);
        			$(html).find(".maxLimitTd").text(maxLimit);
        			$(html).find(".joinMemberTd").text(joinMember);
        			$(html).find(".etcNoteTd").text(etcNote);
        			$(html).find(".comNameTd").text(comName);
        			$(html).find(".intrRateTd").text(intrRate);
        			$(html).find(".intrRate2Td").text(intrRate2);
        			$(html).find(".rsrvTypeNameTd").text(rsrvTypeName);
        			$(html).find(".saveTrmTd").text(saveTrm);
        			$(html).find(".intrRateTypeNameTd").text(intrRateTypeName);
        			
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




	
			