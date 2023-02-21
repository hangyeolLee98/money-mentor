/**
 * prdNoCheck.js
 */

 		
 $(document).ready(function(){  
 
var insuNames = "";
var prdlo ="";
var index = 0;
$.ajax({
 			type:"post",
 			url:"/insuallList",		
 			data:{"insuId" : $("#insuId").val()},
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
 			url:"/insuSearch",
 			data:{"insuId" : $("#insuId").val()},		
 			dataType:"text",
 			success:function(result){
 			$('#searchResultBox').html(result);		
 			},
 			error:function(){
 				alert("실패");
 			}
 		}); // ajax 종료 
	

 	});// submit 종료
 	
 	

 	
 	$('button[name="insuCtg"]').on('click', function(){ 	
 		event.preventDefault(); 		
 		var insuCtg = $(this).val();
 		
 		insuNames = insuCtg; 
 	
	$.ajax({
 			type:"post",
 			url:"/insuCategory1",
 			data: {"insuCtg": insuCtg},
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 		
 		});// submit 종료
 	
   		
 	$('button[name="prdLogo"]').on('click', function(){ 	
 	event.preventDefault(); 	
 
 	var prdLogo = $(this).val();
 	
 	prdlo = prdLogo;
 	

 
 $.ajax({
 			type:"post",
 			url:"/insuCategory4",
 			data: {"insuCtg":insuNames,
 				   "prdLogo" : prdlo,
 				  
 				 },
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 
 
});


/*
	$('button[name="insuIndex"]').on('click', function(){ 	
 	event.preventDefault(); 	
 
 	var insuIndex = $(this).val();
 	cardPrice= insuIndex;

 	 $.ajax({
 			type:"post",
 			url:"/insuCategory3",
 			data: {
 			 	   "insuIndex" : insuIndex 
 				 },
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 			
 			
 		}); // ajax 종료 	
 
 
});
*/
	
	$('button[name="insuIndex"]').on('click', function(){ 	
	 	event.preventDefault(); 	
	 	var insuIndex = $(this).val();
	 	index= insuIndex;
	 	
	 	alert(insuIndex);
	 	 $.ajax({
	 			type:"post",
	 			url:"/insuCategory5",
	 			data: {"insuCtg" : insuNames,
	 				   "prdLogo" : prdlo,
	 			 	   "insuIndex" :index 
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

 

