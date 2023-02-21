/**
 * prdNoCheck.js
 */

 		
 $(document).ready(function(){  
 
var cardNames = "";
var cardde ="";
var cardPrice = 0;
$.ajax({
 			type:"post",
 			url:"/cardallList",
 			
 			data:{"cardId" : $("#cardId").val()},
 			success:function(result){
 			$('#searchResultBox').html(result);
 			
 												
 			},
 			error:function(){
 				alert("실패");
 			}
}); // ajax 종료 
 
 	$('#CardList').on('submit', function(){ 	
 		event.preventDefault(); 		
 		$.ajax({
 			type:"post",
 			url:"/cardsearch",
 			data:{"cardId" : $("#cardId").val()},		
 			dataType:"text",
 			
 			success:function(result){
 			$('#searchResultBox').html(result);
 			
 												
 			},
 			error:function(){
 				alert("실패");
 			}
 		}); // ajax 종료 


 	});// submit 종료
 	
 	
 	
 	
 	$('button[name="comCtg"]').on('click', function(){ 	
 		event.preventDefault(); 		
 		var comCtg = $(this).val();
 		
 		cardNames = comCtg; 
 	
	$.ajax({
 			type:"post",
 			url:"/cardCategory",
 			data: {"comCtg": comCtg},
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 		
 		});// submit 종료
 	
 	
 	$('button[name="cardDes"]').on('click', function(){ 	
 	event.preventDefault(); 	
 
 	var cardDes = $(this).val();
 	
 	cardde = cardDes;
 
 $.ajax({
 			type:"post",
 			url:"/cardCategory4",
 			data: {"comCtg" : cardNames,
 				   "cardDes" : cardde,
 				  
 				 },
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 
 
});

	$('button[name="cardFee"]').on('click', function(){ 	
 	event.preventDefault(); 	
 
 	var cardFee = $(this).val();
 	cardPrice= cardFee;
 	
 	alert(cardFee);
 	 $.ajax({
 			type:"post",
 			url:"/cardCategory5",
 			data: {"comCtg" : cardNames,
 				   "cardDes" : cardde,
 			 	   "cardFee" : cardPrice 
 				 },
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 
 
});
 
 });
