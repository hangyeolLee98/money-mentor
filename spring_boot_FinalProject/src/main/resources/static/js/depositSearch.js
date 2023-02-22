/**
 * depositSearch.js
 */

 $(document).ready(function(){
 
	$.ajax({
		type:"post",
		url:"/depositListAll",
		success:function(result){
		  $('#searchResultBox').html(result);
		},
		error:function(){
			alert("실패");
		}
	}); //ajax 종료
 
 	$('#DepositList').on('submit', function(){ 	
 	
 		event.preventDefault(); 		
 		
 		
 		var prdName = $('#prdName').val();
 		var joinWay = $('input:radio[name="joinway"]:checked').val();
 		var saveTrm =$('input:radio[name="saveTrm"]:checked').val();
 		
 		
 		$.ajax({
 			type:"post",
 			url:"/depositSearch",
 			data: {"prdName":prdName,
					"joinWay":joinWay,
					"saveTrm":saveTrm},
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 		}); // ajax 종료 	
 	});// submit 종료
});