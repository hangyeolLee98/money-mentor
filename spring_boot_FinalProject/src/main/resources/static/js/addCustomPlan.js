/**
 * 
 */
 
 $(document).ready(function(){
 	//일정 추가하기
	$('.calender-add-custom-btn').on('click', function(){
		const prdID = "0";
	  	const prdType = $('#prd-type-select option:selected').val();
		const kind = $('#prd-type-selec option:selected').val();
		
		const name = $('#prdName');
		const subDate = $('#calSubDate');
		const transfer = $('#calTransfer');
		const maturity = $('#calMaturity');
		const payment = $('#calPayment');
		const deposit = $('#calDeposit');
		
		
		
		$('.plan-warning-text').empty();
		
		if(subDate.val() == ""){
			subDate.focus();
			subDate.css('outline', '1px solid red');
			$('.plan-warning-text').append(
				'계약일을 입력해주세요!'
			);
			return false;
		}
		else if(transfer.val() == "" && (kind != "deposit" || kind != "saving")){
			transfer.focus();
			transfer.css('outline', '1px solid red');
			$('.plan-warning-text').append(
				'이체일을 입력해주세요!'
			);
			return false;
		}
		else if(maturity.val() == ""){
			maturity.focus();
			maturity.css('outline', '1px solid red');
			$('.plan-warning-text').append(
				'만기를 입력해주세요!'
			);
			return false;
		}
		else if(payment.val() == "" && (kind != "deposit" || kind != "saving")){
			payment.focus();
			payment.css('outline', '1px solid red');
			$('.plan-warning-text').append(
				'이체 금액을 입력해주세요!'
			);
			return false;
		}
		else if(deposit.val() == "" && (kind == "deposit" || kind == "saving")){
			deposit.focus();
			deposit.css('outline', '1px solid red');
			$('.plan-warning-text').append(
				'예치금을 입력해주세요!'
			);
			return false;
		}
		
		let prdName = name.val();
		const calSubDate = subDate.val();
		let calTransfer = transfer.val();
		const calMaturity = maturity.val();
		let calPayment = payment.val();
		let calDeposit = deposit.val();
		
		console.log(prdName);
		
		if(prdName.length == 0){
			prdName = "사용자 정의 상품";
		}
		if(calDeposit.length == 0){
			calDeposit = 0;
		}
		if(calTransfer.length == 0){
			calTransfer = 0;
		}
		if(calPayment.length == 0){
			calPayment = 0;
		}
		
		$.ajax({
			url:`/profile/calender/sendFormData/${prdType}/${prdID}`,
			type:'POST',
			data:{
				'calSubDate': calSubDate, 
				'calTransfer': calTransfer, 
				'calMaturity': calMaturity, 
				'calPayment': calPayment,
				'prdName': prdName,
				'calDeposit': calDeposit,
			},
			dataType:'text',
			success: function(result){
				alert("일정을 등록했습니다.");	
				
 				const answer = confirm("일정을 더 등록하시겠습니까?");
 				if(answer){
 					location.reload();
					opener.parent.location.reload();
 				}
 				else{
					opener.parent.location.reload();
 					window.close();
 				}
			},
		});
	});
	
	$('#prd-type-select').on('change', function(){
		const kind = $('#prd-type-select option:selected').val();
		
		if(kind == "deposit" || kind == "saving"){
			$('#prdDeposit').show();
		}
		else{
			$('#prdDeposit').hide();
		}
	});
 });