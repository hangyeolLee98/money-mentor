/**
 * 
 */
 //달별 일정
jQuery.randerPlan = function(){
	const userID = sid;	
	$("#plan-list-toMonth").empty();	
			   
	$.ajax({
        type: 'POST',
        url: '/profile/calender/getPlanData',
        dataType: 'json',
        success: function(result) {
	
			if(userID == ""){
				$('.warning-text').empty();
				$('#calender-view').append(`
										<div class="warning-text">
											일정을 확인하고 싶다면 로그인을 해주세요
										</div>
									`);
				$('#plan-view-header').empty();
				$('#plan-view-header').append(`
										<div class="warning-text">
											일정을 확인하고 싶다면 로그인을 해주세요
										</div>
									`);
				$('#plan-list-box').append(`
										<div class="warning-text">
											일정을 확인하고 싶다면 로그인을 해주세요
										</div>
									`);	
			}
			else if(result.length == 0){
				$('#calender-view').append(`
										<div class="warning-text">
											등록된 일정이 없습니다. 일정을 등록해주세요.
										</div>
									`);
				$('#plan-list-box').append(`
										<div class="warning-text">
											등록된 일정이 없습니다. 일정을 등록해주세요.
										</div>
									`);
			}
			else{
				$.each(result, function(index, item){
					let fullDate = item.calSubDate;
					fullDate = fullDate.replace(/-/gi, ".");
					const startYear = Number(fullDate.slice(0,4));
					let month = fullDate.slice(5,7);
					month = Number(month.replace("0", ""));
					let getDate = fullDate.slice(8,10);
					getDate = Number(getDate.replace("0", ""));
					
					const endYear = startYear+item.calMaturity;
					const transferDate = item.calTransfer;
					
					const viewYear = date.getFullYear();
					let viewMonth = date.getMonth();
					
					let planDate = new Date();
					planDate.setFullYear(viewYear);
					planDate.setMonth(viewMonth);
					planDate.setDate(transferDate);
					
					const planDay = planDate.getDay();
					
					viewMonth += 1;
	
					//아니면 안 보여주기
					if(startYear == viewYear && month > viewMonth || endYear == viewYear && month < viewMonth
						|| startYear > viewYear && month < viewMonth || endYear < viewYear && month > viewMonth){
					}
					//기간에 맞으면 보여주고
					else{
					
						prdName = item.prdName;
						
						let plan = `
								<div class="plans">
									<span class="plan-date`;
									
						if(planDay == 0){
							plan += ` sun`;
						}
						else if(planDay == 6){
							plan += ` sat`;
						}
						
						plan += `">${transferDate}</span>`;
						
						$(".year-month").empty();
						
						$(".year-month").append(`
											<div class="plan-list-title">${viewYear}</div>
											<div class="title-month">${viewMonth} 월</div>
											`);
						
						
						let payment = item.calPayment;
						payment = payment.toLocaleString('ko-KR');
						
						
						plan += `
								<span class="plan-title"><span class="plan-prd-title"><span id="${item.dataID}" class="plan-prd-name">${prdName}</span> 이체일</span> <input class="plan-checkBox" type="checkbox"></span>
		
							`;
						
						plan += `
													<div class="payment">
														<span>${payment} 원</span>
													</div>
																			</div>`;
						
						$("#plan-list-toMonth").append(`
											${plan}
											`);
										
					}
					
				});
			}
        },
    });
}

//전체 일정 
jQuery.randerAllPlan = function(){
	const userID = sid;	
	
	$("#plan-list-box").empty()
			   
	$.ajax({
        type: 'POST',
        url: '/profile/calender/getPlanData',
        dataType: 'json',
        success: function(result) {

			if(result.length != 0 && userID != ""){
				//plan-list-box에 미리 추가
				$("#plan-list-box").append(`
									<div id="all-delete">
										<span>
											<button id="plan-del">삭제</button>		
										</span>
										<span><input id="all-plan-checkBox" type="checkbox"></span>
									</div>
									`);
			}
			$.each(result, function(index, item){
				let fullDate = item.calSubDate;
				fullDate = fullDate.replace(/-/gi, ".");
				const startYear = Number(fullDate.slice(0,4));
				let month = fullDate.slice(5,7);
				month = Number(month.replace("0", ""));
				let getDate = fullDate.slice(8,10);
				getDate = Number(getDate.replace("0", ""));
				
				const endYear = startYear+item.calMaturity;
				const transferDate = item.calTransfer;
				
				const viewYear = date.getFullYear();
				let viewMonth = date.getMonth();
				
				let planDate = new Date();
				planDate.setFullYear(viewYear);
				planDate.setMonth(viewMonth);
				planDate.setDate(transferDate);
				
				const planDay = planDate.getDay();
				
				viewMonth += 1;

				prdName = item.prdName;
					
				let payment = item.calPayment;
				payment = payment.toLocaleString('ko-KR');
				
				
				let allPlan = `
						<div id="all-plan">
							<div class="all-plans">
								<span class="all-plan-date">${fullDate}</span>
								<span class="all-plan-title">${prdName}</span>
								<span class="all-payment">
									<span>${payment} 원</span>
								</span>
								<input id="${item.dataID}"  class="plan-list-checkBox" type="checkbox">
							</div>
							<div>
								<button id="mod-${item.dataID}" class="plan-modify" >수정</button>
							</div>
						</div>
						`;
							
				allPlan += `
							`
				$("#plan-list-box").append(`
									${allPlan}
									`);
				
			});
        },
    });
}
 
$(document).ready(function(){
	 $(document).on('click', '.plan-checkBox', function(e){
		const planIndex = $('.plan-checkBox').index(this);
		if( $('.plan-checkBox').eq(planIndex).is(':checked')){
			$('.plans').eq(planIndex).css('text-decoration', 'line-through');
			$('.calender-plan').eq(planIndex).css('text-decoration', 'line-through');
		}
		else{
			$('.plans').eq(planIndex).css('text-decoration', 'none');
			$('.calender-plan').eq(planIndex).css('text-decoration', 'none');
		}
	 });
	 
	 $(document).on('click', '#all-plan-checkBox', function(e){
	 
		if( $('#all-plan-checkBox').is(':checked')){
			$('.plan-list-checkBox').attr('checked', true);
		}
		else{
			$('.plan-list-checkBox').attr('checked', false);
		}
	 });
	       
	
	//일정 이름 변경하기
	$(document).on('dblclick', '.plan-prd-name', function(e){
		e.preventDefault();
		
		if($('input[name=plan-prdName]').length > 0){
			$('.plan-prdName').eq(0).focus();
		}
		else{
			const index = $('.plan-prd-name').index(this);
			const prdName = $('.plan-prd-name').eq(index).text();
			const dataID = $('.plan-prd-name').eq(index).attr('id');
			
			
			$('.plan-prd-name').eq(index).empty();
			$('.plan-prd-name').eq(index).append(`
											<input placeholder="${prdName}" type="text" id="plan-prdName" name="plan-prdName">
											`)
			
			$('.plan-prd-title').eq(index).append(`
											<button type="button" id="pln-${dataID}" class="change-prdName-btn" name="cngPrdName">변경</button>
											`)
		}
	});
	
	//일정 이름 변경하기(버튼 클릭)
	$(document).on('click', '.change-prdName-btn', function(e){
		e.preventDefault();
		
		let prdName = $('#plan-prdName').val();
		const index = $('.change-prdName-btn').index(this);
		let dataID = $('.change-prdName-btn').eq(index).attr("id");
		dataID = dataID.replace('pln-', '');
		
		if(prdName.length == 0){
			prdName = $('#plan-prdName').attr('placeholder');
		}
		
		$.ajax({
			type:'POST',
			url:'/profile/calender/changePrdName',
			dataType:'text',
			data:{'prdName':prdName, 
				  'dataID':dataID,
				  },
			success:function(){
				$('.calender-plan-name').eq(index).empty();
				$('.change-prdName-btn').remove();
				jQuery.randerPlan();
				jQuery.randerAllPlan();
				jQuery.randerCalender();
			},
		});
	});  
	
	//일정 이름 변경하기
	$(document).on('keyup', '#plan-prdName', function(e){
		if(e.keyCode == 13){
			$('.change-prdName-btn').click();
		}
	}); 
	
	//일정관리 숨기기 보이기
	$('#plan-list-view-btn').on('click', function(e){
	  	e.preventDefault();
		if($('#plan-list-view-box').hasClass('hide')){
			$('#plan-list-view-box').removeClass('hide');
			$('#plan-list-view-box').addClass('show');
			$('#plan-icon').removeClass('fa-plus');
			$('#plan-icon').addClass('fa-minus');
			$('#plan-list-box').show();
		}
		else if($('#plan-list-view-box').hasClass('show')){
			$('#plan-list-view-box').removeClass('show');
			$('#plan-list-view-box').addClass('hide');
			$('#plan-icon').removeClass('fa-minus');
			$('#plan-icon').addClass('fa-plus');
			$('#plan-list-box').hide();
		}
	});
	
	
	
	//일정 추가하기
	$(document).on('click', '.calender-add-btn', function(e){
		e.preventDefault();
		const clickBtn = $('.calender-add-btn').index(this);
		const prdID = $(this).attr('id');
	  	const prdType = $('#prd-kind-select option:selected').val();
		const kind = $('#prd-kind-select option:selected').val();
		
		const name = $('.prdName').eq(clickBtn);
		const subDate = $('.calSubDate').eq(clickBtn);
		const transfer = $('.calTransfer').eq(clickBtn);
		const maturity = $('.calMaturity').eq(clickBtn);
		const payment = $('.calPayment').eq(clickBtn);
		const deposit = $('.calDeposit').eq(clickBtn);
		let resultData = ""
		
		$('.plan-warning-text').empty();
		
		if(subDate.val() == ""){
			subDate.focus();
			subDate.css('outline', '1px solid red');
			$('.plan-warning-text').eq(clickBtn).append(
				'계약일을 입력해주세요!'
			);
			return false;
		}
		else if(transfer.val() == ""  && (kind != "deposit" || kind != "saving")){
			transfer.focus();
			transfer.css('outline', '1px solid red');
			$('.plan-warning-text').eq(clickBtn).append(
				'이체일을 입력해주세요!'
			);
			return false;
		}
		else if(maturity.val() == ""){
			maturity.focus();
			maturity.css('outline', '1px solid red');
			$('.plan-warning-text').eq(clickBtn).append(
				'만기를 입력해주세요!'
			);
			return false;
		}
		else if(payment.val() == "" && (kind != "deposit" || kind != "saving")){
			payment.focus();
			payment.css('outline', '1px solid red');
			$('.plan-warning-text').eq(clickBtn).append(
				'이체 금액을 입력해주세요!'
			);
			return false;
		}
		else if(deposit.val() == "" && (kind == "deposit" || kind == "saving")){
			deposit.focus();
			deposit.css('outline', '1px solid red');
			$('.plan-warning-text').eq(clickBtn).append(
				'예치금을 입력해주세요!'
			);
			return false;
		}
		
		const calSubDate = subDate.val();
		let calTransfer = transfer.val();
		const calMaturity = maturity.val();
		let calPayment = payment.val();
		let calDeposit = deposit.val();
		let prdName = name.val();
			
		if(prdName.length == 0){
			prdName = $('.prd-name').eq(Number(prdID)-1).text();
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
			data:{'calSubDate': calSubDate, 
				'calTransfer': calTransfer, 
				'calMaturity': calMaturity, 
				'calPayment': calPayment,
				'prdName': prdName,
				'calDeposit': calDeposit,
			},
			dataType:'text',
			success: function(result){
				if(result == "fail"){
					alert("일정이 이미 등록되어 있습니다.");
				}else if(result == "ok"){
					jQuery.randerPlan();
					jQuery.randerAllPlan();
					jQuery.randerChart();
					alert("일정을 등록했습니다.");	
					$('prd-detail-view').hide();
				}	
			},
		});

		$('.prd-detail-view').eq(Number(prdID)-1).empty();
		$('.prd-detail-view').eq(Number(prdID)-1).hide();
		$('.calender-add-form').eq(Number(prdID)-1).css('width', '30%');
		$('.prd-detail-view').eq(Number(prdID)-1).css('display', 'none');
		$('.add-prd-btn').eq(Number(prdID)-1).text('추가하기');
		$('.add-prd-btn').eq(Number(prdID)-1).addClass('open');
		$('.add-prd-btn').eq(Number(prdID)-1).removeClass('close');		
	});
	
	
	//일정 수정
	$(document).on('click', '#plan-modify', function(e){
	  	e.preventDefault();
		const clickIndex = $('.plan-modify').index(this);
	});
	
	
	//일정 삭제
	$(document).on('click', '#plan-del', function(e){
	  	e.preventDefault();
	  	const checked = $('.plan-list-checkBox').is(':checked');
	  	
	  	if(checked){  		
 			const answer = confirm("선택된 일정을 삭제하시겠습니까?");
 			
 			if(answer){
		  		const checkArr = new Array();
		  		$('.plan-list-checkBox:checked').each(function(){
		  			checkArr.push($(this).attr('id'));
		  		});
		  		
		  		$.ajax({
		  			type:'POST',
 					url:"/profile/calender/deletePlan",
					data:{"chbox":checkArr},
					dataType:'text',
					success:function(result){
						if(result == 1){
							alert("일정 삭제 완료");
						}
						jQuery.randerCalender();
						jQuery.randerPlan();
						jQuery.randerAllPlan();
					},
		  		});
			}
	  	}
	});
	
	$('#add-custom-prd').on('click', function(){
		window.open("/profile/calender/addPlan", 'add-custom-plan', 'width=700, height=280');
	});
	
	
	
	$(document).on('click', '.plan-modify', function(){
		let dataID = $('.plan-modify').eq($('.plan-modify').index(this)).attr('id');
		dataID = dataID.replace("mod-", "");
		window.open(`/profile/calender/modifyPlanView/${dataID}`, "일정 수정", "width=700, height=280");
	});
	
	jQuery.randerPlan();
	jQuery.randerAllPlan();
 });