/**
 * prdModal.js
 
 */
 
 function toggleBtn1(){ 

	// 토글 할 버튼 선택 (btn1)
	const btn1 = document.getElementById('btn1');
				  
	// btn1 보이기 (display: block)
	if(btn1.style.display == 'none') {
	   btn1.style.display = 'block';
	}
 	
}	
    $(function(){
    
	
     $(document).ready(function(){
 	// [전체 선택] 체크박스 체크했을 때
 	$('#allCheck').on('click', function(){
	 	var chk = $("#allCheck").prop("checked");
	 	
	 	// 체크 되었다면 (true) : 모든 개별 체크박스 true로 설정
	 	if(chk) {
	 		$('.chkDelete').prop("checked", true);
	 	} else {
	 		$('.chkDelete').prop("checked", false);
	 	}
	 	
	 	
	});
	
	// 개별 체크박스 해제할 경우 [전체 선택] 체크박스 해제
 	// 개별 체크박스 모두 체크되었을 때 [전체 선택] 체크
 	$('.chkDelete').on('click', function(){
 		var total = $('.chkDelete').length; //개별 체크박스의 전체 개수
 		var checked = $('.chkDelete:checked').length; // 체크된 체크박스 개수
 		
 		if(total != checked)  // 같지 않다면 (모두 선택된 상태가 아니라면)
 			$("#allCheck").prop("checked", false); // 해제
 		else
 			$("#allCheck").prop("checked", true); // 체크
 	});
 	
     
    });
    
        $( document ).ready( function() {
 // [선택상품삭제] 버튼을 클릭했을 때 장바구니에서 선택된 상품 삭제
 	$('#deleteCardBtn').on('click', function(){
 		// 선택 여부 확인 : 하나라도 선택하면 ture, 아무것도 선택하지 않으면 false
 		var checked = $('.chkDelete').is(':checked');
 		
 		if(checked){ // 하나라도 선택한 경우
 		var answer = confirm("전체 상품을 삭제하시겠습니까?");
 		if(answer){
 		 for(var i=$('.chkDelete').length-1; i>-1; i--){ 

﻿        $('.chkDelete').eq(i).closest('.oo').remove(); 
 		$("#allCheck").prop("checked", false); // 해제
 		
 		}
 		   
 		    const btn1 = document.getElementById('btn1');
 		     if(btn1.style.display == 'block') {
			    btn1.style.display = 'none';
			    }
			    
 		   }
 		 
 		  
 			}
 	
 	 });
    });
   }); 
    
 function productCompare12(){
 		
 		    const btn1 = document.getElementById('btn1');
 		     if(btn1.style.display == 'block') {
			    btn1.style.display = 'none';
			    }
			} 