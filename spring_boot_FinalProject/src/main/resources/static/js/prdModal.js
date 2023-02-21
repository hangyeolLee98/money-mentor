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
 	/*$.ajax({
 			type:"post",
 			url:"/SavingCompare",
 			data:{"savingID": savingID},
 				
 			success:function(result){
 			
 			//console.log('result >>>' + JSON.stringify(result));

 			$('.prod_list').append('<li class="prod_lists">' +  
	 			'<div class="oo">' + 
	 			'<input  type="hidden" class="comName" value="'+result.comName+ '"/>'+ result.comName + '</input>' + '<br>' +
	 			'<input  type="hidden" class="prdName" value="'+result.prdName+ '"/>'+ result.prdName + '</input>' +'<br>' + 
	 			'<input  type="hidden" class="joinWay" value="'+result.joinWay + '"/>'+ '</input>' +
	 			'<input  type="hidden" class="interest" value="'+result.interest + '"/>'+ '</input>' +
	 			'<input  type="hidden" class="spclCnd" value="'+result.spclCnd + '"/>'+ '</input>' +
	 			'<input  type="hidden" class="maxLimit" value="'+result.maxLimit + '"/>'+ '</input>' +
	 			'<input  type="hidden" class="joinMember" value="'+result.joinMember + '"/>'+ '</input>' +
	 			'<input  type="hidden" class="etcNote" value="'+result.etcNote+ '"/>'+ '</input>' +
	 			'<input  type="hidden" class="intrRate" value="'+result.intrRate + '"/>'+'</input>' +
	 			'<input  type="hidden" class="intrRate2" value="'+result.intrRate2+ '"/>'+result.intrRate2 + '</input>' +'<br>' +
	 			'<input  type="hidden" class="saveTrm" value="'+result.saveTrm+ '"/>'+ result.saveTrm +'</input>' +'<br>' +
	 			'<input  type="hidden" class="rsrvTypeName" value="'+result.rsrvTypeName+ '"/>'+result.rsrvTypeName+ '</input>' +
	 			'<input  type="hidden" class="intrRateTypeName" value="'+result.intrRateTypeName+ '"/>'+'</input>' +
	 			
	 			
	 
	 				'<div class="id6">' + 
	 					'<input type="checkbox" name="Chk_list" class="chkDelete" value="'+ result.savingID  +'"/>'+ 
	 					'<input class="prdName" type="hidden" value="' +result.prdName + '"/>' + 
	 				'</div>' +
	 				
	 					
	 			'</div>'+
	 		'</li>');
	 		

 		// 비교 임시테이블에 저장하기위함 함수호출
 
 												
 			},
 			error:function(){
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 
 		
 		*/

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
 		var answer = confirm("선택된 상품을 삭제하시겠습니까?");
 		if(answer){
 		 for(var i=$('.chkDelete').length-1; i>-1; i--){ 

﻿                    $('.chkDelete').eq(i).closest('.oo').remove(); 
 		
 		
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