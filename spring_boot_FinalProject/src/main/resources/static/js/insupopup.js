/**
 * 
*/
function productCompare1(){ 

//상품 비교 모달 창
var insuId = $('.prod_list .oo .id6 .chkDelete').get();
var prdLogo = $('.prod_list .oo .prdLogo').get();
var insuName = $('.prod_list  .oo .insuName').get();
var insuDes = $('.prod_list .oo .desc').get();
var insuPrice = $('.prod_list .oo .Price').get();
var male = $('.prod_list .oo .malefee').get();
var female = $('.prod_list .oo .femalefee').get();
var insuIndex = $('.prod_list .oo .insuIndex').get();
var age = $('.prod_list .oo .age').get();
var insuNote = $('.prod_list .oo .insuNote').get();
var cardUrl = $('.prod_list .oo .button .button--wayra').get();




$('.body-contentbox').append(
	'<table class="modallist">' +
		'<thead>'+
			'<tr>'+
				'<th class="imgtr">' + '상품명' +'</th>' +
        		'<th class="destr">' +'보장상품'+'</th>' +
        		'<th class="pricetr">' +'보장금'+'</th>' +
        		'<th class="maletr">' +'보험료(남)'+'</th>' +
        		'<th class="femaletr">' +'보험료(여)'+'</th>' +
        		'<th class="agetr" >' +'나이'+'</th>'+
        		'<th class="indextr" >' +'보험지수'+'</th>'+
        		'<th class="insuNotetr" >' +'상품설명'+'</th>'+
        		
		'</thead>'+
		'<tbody class="tb">'+
			 
		'</tbody>'+
			 	 
	'</table>');
 
 var shap = '#';
 for(var i=0; i< insuId.length; i++){
//	var idx = insuDes[i].indexOf("#"); 
//	var mail1 = insuDes[i].substring(0, idx);
//	var mail2 = insuDes[i].substring(idx+1);
	   		
   var arr_dess1 = insuDes[i].value.split('#');
   var arr_dess2 = insuPrice[i].value.split('#');
   
   var str_result='<tr class="classtr">'+
	 	
	 	 '<th class="imgth">'+'<img class="cardImg" src='+prdLogo[i].src+'>'+'<br>'+insuName[i].value+'</th>'+
	 	
	 	 
	 	  '<th class="desth">';
   for(var j=0; j<arr_dess1.length; j++ ){
   
   str_result += '<span>' + arr_dess1[j] + '</span>'+'<br>';
   }
   
   str_result +=  '</th>'+
 	   
	 	    '<th class="priceth">';
	 	    
	for(var k=0; k<arr_dess2.length; k++ ){
   
   str_result += '<span>' + arr_dess2[k] + '</span>'+'<br>';
   } 	    
	 	    
   str_result +='</th>'+   
			'<th class="maleth">'+ male[i].value + ' ₩' +'</th>'+
			'<th class="femaleth">'+ female[i].value +' ₩' +'</th>'+
			'<th class="ageth">'+ age[i].value + '</th>'+
			'<th class="indexth">'+ insuIndex[i].value + ' %' +  '</th>'+
			'<th class="insuNoteth">'+ insuNote[i].value + '</th>'+

	 '</tr>'+
	 '<div class="line"></div>'	;
   
	$('.tb').append(	
	str_result 
	);
	



/*
	$('.body-contentbox').append('<div class="qq">' +'<img class="cardImg" src='  +cardImgUrl[i].src + '>' + '<br>' +  '</div>');
	$('.body-contentbox').append('<div class="qq">' + cardId[i].value +'<br>' +  '</div>');
	$('.body-contentbox').append('<div class="qq">' + cardDes[i].value +'<br>' +  '</div>');
	$('.body-contentbox').append('<div class="qq">' + cardName[i].value +'<br>' +  '</div>');
	$('.body-contentbox').append('<i class="annual_fee1">'+ '<fmt:formatNumber value="'+cardFee[i].value+'"pattern="#,###"/>' +cardFee[i].value + ' ₩'+'</i>');
	*/
}
	// 토글 할 버튼 선택 (btn1)

	const popup = document.getElementById('popup');
	// const cardList = document.getElementById('btn1');
				  
	// btn1 보이기 (display: block)
	if(popup.style.display == 'none') {
	popup.style.display = 'flex';
	} 

}  


/*$.ajax({
 			type:"post",
 			url:"/CardComparemodal",
 			data:{"cardId": cardId},	
 			success:function(result){
 			
 			// var refine = $("#oo").html(result);
 			  alert(refine);
 			//console.log(result);
            console.log(refine);
           	console.log(typeof(refine));
            $('.body-contentbox').append(result.cardImgUrl);				
 			},
 			error:function(){
 			
 				alert("실패");
 			}
 		}); // ajax 종료 
*/


 
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




