/**
 * rentHouseLoanSearch.js
 */

 $(document).ready(function(){
 
$.ajax({
			
 			type:"post",
 			url:"/rentHouseLoanListAll",
 			
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				alert("실패");
 			}
 		}); //ajax 종료
 
 	$('#RentHouseLoanList').on('submit', function(){ 	
 		event.preventDefault(); 		
 		
 		var prdName = $('#prdName').val();
 		var joinWay = $('input:radio[name="joinWay"]:checked').val();
 		var crdtTypeName = $('input:radio[name="rpayTypeName"]:checked').val();
 		
 		$.ajax({
 			type:"post",
 			url:"/rentHouseLoanSearch",
 			data: {"prdName":prdName,
					"joinWay":joinWay,
					"rpayTypeName":crdtTypeName
					},
 			success:function(result){
			  $('#searchResultBox').html(result);
			},
 			error:function(){
 				
 				alert("실패");
 			}
 		}); // ajax 종료 	
 	});// submit 종료
});