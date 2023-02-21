/**
 * 
 */
function productCompare1(){

	
			
    			
    			$(".prod_list .oo").each(function(){
    				var creditLoanID = $(this).find('.chkDelete').val();
        			var comName = $(this).find('.comName').val();
        			var prdName = $(this).find('.prdName').val();
        			var joinWay = $(this).find('.joinWay').val();
        			var crdtTypeName = $(this).find('.crdtTypeName').val();
        			var cbName = $(this).find('.cbName').val();
        			var crdtLendRateTypeName = $(this).find('.crdtLendRateTypeName').val();
        			var crdtGrade9Up = $(this).find('.crdtGrade9Up').val();
        			var crdtGrade8Up = $(this).find('.crdtGrade8Up').val();
        			var crdtGrade7Up = $(this).find('.crdtGrade7Up').val();
        			var crdtGrade6Up = $(this).find('.crdtGrade6Up').val();
        			var crdtGrade5Up = $(this).find('.crdtGrade5Up').val(); 
        			var crdtGrade4Up = $(this).find('.crdtGrade4Up').val();
        			var crdtGrade3Up = $(this).find('.crdtGrade3Up').val();
        			var crdtGrade3Down = $(this).find('.crdtGrade3Down').val();
        			var crdtGradeAvg = $(this).find('.crdtGradeAvg').val();
        			
        			var html = $.parseHTML($("#compare-detail-template").text());
        			
        			$(html).find(".comNameTd").text(comName);
        			$(html).find(".prdNameTd").text(prdName);
        			$(html).find(".joinWayTd").text(joinWay);
        			$(html).find(".crdtTypeNameTd").text(crdtTypeName);
        			$(html).find(".cbNameTd").text(cbName);
        			$(html).find(".crdtLendRateTypeNameTd").text(crdtLendRateTypeName);
        			$(html).find(".crdtGrade9UpTd").text(crdtGrade9Up);
        			$(html).find(".crdtGrade8UpTd").text(crdtGrade8Up);
        			$(html).find(".crdtGrade7UpTd").text(crdtGrade7Up);
        			$(html).find(".crdtGrade6UpTd").text(crdtGrade6Up);
        			$(html).find(".crdtGrade5UpTd").text(crdtGrade5Up);
        			$(html).find(".crdtGrade4UpTd").text(crdtGrade4Up);
        			$(html).find(".crdtGrade3UpTd").text(crdtGrade3Up);
        			$(html).find(".crdtGrade3DownTd").text(crdtGrade3Down);
        			$(html).find(".crdtGradeAvgTd").text(crdtGradeAvg);
        			
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




	
			