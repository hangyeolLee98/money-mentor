/**
 * 
 */
 
  //상품목록
 jQuery.randerProduct = function(){
	const kind = $('#prd-kind-select option:selected').val();
	const kindDetail = $('#prd-kind-select-option option:selected').val();
	const order = $('#prd-order-select option:selected').val();

	$('#prd-list-box').empty();
	
	$.ajax({
    type: 'POST',
    url: `/profile/calender/getPrdData/${kind}/${kindDetail}/${order}`,
    dataType: 'json',
    success: function(result) {
		$.each(result, function(index, item){	
			let viewData =	`
							<div class="prd-item">`;
							
			
			let linkData = "";
			
			if(item.prdCom == 'KB'){
				linkData = `"window.open('https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=${item.prdURL}')"`;
			}
			else if(item.prdCom == '현대'){
				linkData = `"window.open('https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=${item.prdURL}')"`;
			}
			else if(item.prdCom == null){
				linkData = '#';
			}
			else{
				linkData = `"window.open('{item.prdURL}')"`;
			}
			
			if(item.prdImg != null){
				viewData += `
							<div class="img-box">
								<a onclick=${linkData}>
									<img src="${item.prdImg}"/>
								</a>
							</div>
							`;
			}
			viewData += `
							<div class="prd-info-box">
								<div class="prd-title">`;
								
			
			
			if(item.prdCom == 'KB'){
				viewData += `<span class="prd-com">[국민카드]</span>`;
			}
			else if(item.prdCom == '현대'){
				viewData += `<span class="prd-com">[현대카드]</span>`;
			}
			else if(item.prdCom == 'lotte'){
				viewData += `<span class="prd-com">[롯데카드]</span>`;
			}
			else{
				viewData += `<span class="prd-com">${item.prdCom}</span>`;
			}
			
			viewData += `
								<div class="prd-name">${item.prdName}</div>
							</div>`;
				
			
			let prdDes = item.prdDes;
			
			if(prdDes != null){
				viewData += `
								<div class="prd-des">
									<div>${prdDes}</div>
								</div>
								`;
			}
			
			viewData += `
							<div class="deco-btn-box">
								<span class="deco-btn-like off"><button class="deco-btn like"><i id="like" class="fa fa-heart-o"></i></button></span>
								<span class="deco-btn-bookMark off"><button class="deco-btn bookMark"><i id="bookMark" class="fa fa-star-o"></i></button></span>
							</div>
						`;
						
			if(linkData != '#'){
				viewData += `
							<div class="item-btn-box">
								<button onclick=${linkData}>상세보기</button>
						`;
			
			}
						
			if(sid != ""){
							viewData += `<button class="add-prd-btn open">추가하기</button>`;
							}
							viewData += `
							</div>
	  									<div class="prd-detail-view" style="display:none">
										</div>
						</div>
					</div>`;
					
				$('#prd-list-box').append(`
										${viewData}
										`);		
			});
     	},
	});
}
 
 
$(document).ready(function(){
	//상품추가 숨기기 보이기
	$(document).on('click', '.prd-items-view-btn', function(e){
	  	e.preventDefault();
		if($('#prd-items-view').attr('class') == 'hide'){
			$('#prd-items-view').removeClass('hide');
			$('#prd-items-view').addClass('show');
			$('#prd-icon').removeClass('fa-plus');
			$('#prd-icon').addClass('fa-minus');
			$('#search-option').show();
			$('#prd-list-box').show();
			$('#prd-detail-view').hide();
			if(sid != ""){			
				$('#add-custom-prd').show();
			}
		}
		else if($('#prd-items-view').attr('class') == 'show'){
			$('#prd-items-view').removeClass('show');
			$('#prd-items-view').addClass('hide');
			$('#prd-icon').removeClass('fa-minus');
			$('#prd-icon').addClass('fa-plus');
			$('#search-option').hide();
			$('#add-custom-prd').hide();
			$('#itemsView').hide();
			$('#prd-list-box').hide();
			$('#prd-detail-view').hide();
		}
	});
	
	
	$(document).on('change', '#prd-kind-select', function(e){
	  e.preventDefault();
	  const kind = $('#prd-kind-select option:selected').val();
	  $('#prd-kind-select-option').empty();
	$('#prd-kind-select-option').append(`
										<option value="default" selected>선택</option>
										`);
	  
	  
	  $.ajax({
	        type: 'POST',
	        url: `/profile/calender/insertPrdCategory`,
	        dataType: 'json',
	        data:{'kind': kind},
	        success:function(result){
	        	for(let i = 0; i < result.length; i++){
		        	$('#prd-kind-select-option').append(`
										<option value="${result[i]}">${result[i]}</option>
		        	`);
	        	}
	        }
	  });
	  jQuery.randerProduct();
	});
	
	$(document).on('change', '#prd-kind-detail-select', function(e){
	  e.preventDefault();
	  jQuery.randerProduct();
	});
	
	$(document).on('change', '#prd-order-select', function(e){
	  e.preventDefault();
	  jQuery.randerProduct();
	});
	
	$(document).on('change', '#prd-kind-select-option', function(e){
	  e.preventDefault();
	  jQuery.randerProduct();
	});
	
	//상품선택 툴 보이기
	$(document).on('click', '.open', function(e){
	  	e.preventDefault();
	  	
	  	const clickIndex = $('.add-prd-btn').index(this);
	  	
		$('.prd-detail-view').eq(clickIndex).show();
		
		$('.calender-add-form').eq(clickIndex).css('width', '100%');
		$('.prd-detail-view').eq(clickIndex).css('display', 'flex');
		$('.add-prd-btn').eq(clickIndex).text('닫기');
		$('.add-prd-btn').eq(clickIndex).addClass('close');
		$('.add-prd-btn').eq(clickIndex).removeClass('open');
		
		const kind = $('#prd-kind-select option:selected').val();
		const kindDetail = $('#prd-kind-select-option option:selected').val();
		const order = $('#prd-order-select option:selected').val();
		 
		$.ajax({
	        type: 'POST',
	        url: `/profile/calender/getPrdData/${kind}/${kindDetail}/${order}`,
	        dataType: 'json',
	        success: function(result) {
	        	const data = result;
	        	
				if(kind == "insu"){
		        	const prdID = data[clickIndex].prdID;
		        	const prdType = kind;
		        	
		        	let female = data[clickIndex].female;
		        	female = female.toLocaleString('ko-KR');

		        	let male = data[clickIndex].male;
		        	male = male.toLocaleString('ko-KR');

		        	$('.prd-detail-view').eq(clickIndex).append(`
																<table>
																	<tbody>
																		<tr class="prdName-box">
																			<td class="prd-table-title">별명</td>
																			<td><input placeholder="미기입시 상품명" type="text" id="prdName" class="prdName" name="prdName"></td>
																		</tr>
																		<tr class="prdFee">
																			<td class="prd-table-title" rowspan="2">수수료</td>
																			<td class="male">남자 : </td>
																			<td>${male} 원</td>
																		</tr>
                                                                        <tr>
                                                                            <td class="female">여자 : </td>
                                                                            <td>${female} 원</td>
                                                                        </tr>
																		<tr class="prdSubDate">
																			<td class="prd-table-title">계약일</td>
																			<td><input type="date" id="calSubDate" class="calSubDate" name="calSubDate"></td>
																		</tr>
																		<tr class="prdTransfer">
																			<td class="prd-table-title">이체일</td>
																			<td><input type="text" id="calTransfer" class="calTransfer" name="calTransfer"> 일</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">만기</td>
																			<td><input type="text" id="calMaturity" class="calMaturity" name="calMaturity"> 년</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">납부금</td>
																			<td><input type="text" id="calPayment" class="calPayment" name="calPayment"> 원</td>
																		</tr>
																		<tr>
																			<td><button type="submit" class="calender-add-btn" id="${prdID}">추가</button></td>
																			<td><div class="plan-warning-text"></div></td>
																		</tr>
																	</tbody>
																</table>
					  										`);
				  
				  }
				  else if(kind == "saving" || kind == "deposit"){
		        	let prdPrice = data[clickIndex].prdPrice;
		        	const prdID = data[clickIndex].prdID;
		        	const prdType = kind;
		        	prdPrice = prdPrice.toLocaleString('ko-KR');
		        	prdPrice += ' 원';
		        	
		        	if(prdPrice == '0 원'){
		        		prdPrice = '없음';
		        	}
		        	
		        	$('.prd-detail-view').eq(clickIndex).append(`
																<table>
																	<tbody>
																		<tr class="prdName-box">	
																			<td class="prd-table-title">별명</td>
																			<td><input placeholder="미기입시 상품명" type="text" id="prdName" class="prdName" name="prdName"></td>
																		</tr>
																		<tr class="prdFee">
																			<td class="prd-table-title">최고한도</td>
																			<td>${prdPrice}</td>
																		</tr>
																		<tr class="prdSubDate">
																			<td class="prd-table-title">계약일</td>
																			<td><input type="date" id="calSubDate" class="calSubDate" name="calSubDate"></td>
																		</tr>
																		<tr class="prdTransfer">
																			<td class="prd-table-title">이체일</td>
																			<td><input type="text" id="calTransfer" class="calTransfer" name="calTransfer"> 일</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">만기</td>
																			<td><input type="text" id="calMaturity" class="calMaturity" name="calMaturity"> 년</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">납부금</td>
																			<td><input type="text" id="calPayment" class="calPayment" name="calPayment"> 원</td>
																		</tr>
																		<tr class="prdDeposit">
																			<td class="prd-table-title">예치금</td>
																			<td><input type="text" id="calDeposit" class="calDeposit" name="calDeposit"> 원</td>
																		</tr>
																		<tr>
																			<td><button type="submit" class="calender-add-btn" id="${prdID}">추가</button></td>
																			<td><div class="plan-warning-text"></div></td>
																		</tr>
																	</tbody>
																</table>
					  										`);
	  		  }
	        	else{
		        	let prdPrice = data[clickIndex].prdPrice;
		        	const prdID = data[clickIndex].prdID;
		        	const prdType = kind;
		        	prdPrice = prdPrice.toLocaleString('ko-KR');
		        	$('.prd-detail-view').eq(clickIndex).append(`
																<table>
																	<tbody>
																		<tr class="prdName-box">	
																			<td class="prd-table-title">별명</td>
																			<td><input placeholder="미기입시 상품명" type="text" id="prdName" class="prdName" name="prdName"></td>
																		</tr>
																		<tr class="prdFee">
																			<td class="prd-table-title">수수료</td>
																			<td>${prdPrice} 원</td>
																		</tr>
																		<tr class="prdSubDate">
																			<td class="prd-table-title">계약일</td>
																			<td><input type="date" id="calSubDate" class="calSubDate" name="calSubDate"></td>
																		</tr>
																		<tr class="prdTransfer">
																			<td class="prd-table-title">이체일</td>
																			<td><input type="text" id="calTransfer" class="calTransfer" name="calTransfer"> 일</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">만기</td>
																			<td><input type="text" id="calMaturity" class="calMaturity" name="calMaturity"> 년</td>
																		</tr>
																		<tr class="prdMaturity">
																			<td class="prd-table-title">납부금</td>
																			<td><input type="text" id="calPayment" class="calPayment" name="calPayment"> 원</td>
																		</tr>
																		<tr>
																			<td><button type="submit" class="calender-add-btn" id="${prdID}">추가</button></td>
																			<td><div class="plan-warning-text"></div></td>
																		</tr>
																	</tbody>
																</table>
					  										`);
				  }
	  		  }
	  	});
	});

	//상품선택 툴 숨기기
	$(document).on('click', '.close', function(e){
	  	e.preventDefault();
	  	const clickIndex = $('.add-prd-btn').index(this);
		$('.prd-detail-view').eq(clickIndex).empty();
		$('.prd-detail-view').eq(clickIndex).hide();
		$('.calender-add-form').eq(clickIndex).css('width', '30%');
		$('.prd-detail-view').eq(clickIndex).css('display', 'none');
		$('.add-prd-btn').eq(clickIndex).text('추가하기');
		$('.add-prd-btn').eq(clickIndex).addClass('open');
		$('.add-prd-btn').eq(clickIndex).removeClass('close');
	});
	
	$.ajax({
	   type: 'GET',
	   url: "/profile/calender/insertPrdCategory",
	   dataType: 'json',
	   data:{'kind': 'card'},
	   success:function(result){
	        for(let i = 0; i < result.length; i++){
		       	$('#prd-kind-select-option').append(`
									<option value="${result[i]}">${result[i]}</option>
		       	`);
	        }
	     }
	  });
	  
	  //검색 기능
	  $('#searchBtn').on('click', function(){
	  	const text = $('#searchTextBox').val();
		const kind = $('#prd-kind-select option:selected').val();
		
		$.ajax({
			type: 'GET',
			url: "/profile/calender/search",
	   		dataType: 'json',
			data:{'text': text,
				  'kind': kind},
			success:function(result){
				$('#prd-list-box').empty();
				if(result.length == 0){
					$('#prd-list-box').append(`<div>검색 결과가 없습니다.</div>`);
				}
				else{
					$.each(result, function(index, item){	
						let viewData =	`
							<div class="prd-item">`;
							
			
						let linkData = "";
						
						if(item.prdCom == 'KB'){
							linkData = `"window.open('https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=${item.prdURL}')"`;
						}
						else if(item.prdCom == '현대'){
							linkData = `"window.open('https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=${item.prdURL}')"`;
						}
						else if(item.prdCom == null){
							linkData = '#';
						}
						else{
							linkData = `"window.open('{item.prdURL}')"`;
						}
						
						if(item.prdImg != null){
							viewData += `
										<div class="img-box">
											<a onclick=${linkData}>
												<img src="${item.prdImg}"/>
											</a>
										</div>
										`;
						}
						viewData += `
										<div class="prd-info-box">
											<div class="prd-title">`;
											
						
						
						if(item.prdCom == 'KB'){
							viewData += `<span class="prd-com">[국민카드]</span>`;
						}
						else if(item.prdCom == '현대'){
							viewData += `<span class="prd-com">[현대카드]</span>`;
						}
						else if(item.prdCom == 'lotte'){
							viewData += `<span class="prd-com">[롯데카드]</span>`;
						}
						else{
							viewData += `<span class="prd-com">${item.prdCom}</span>`;
						}
						
						viewData += `
											<div class="prd-name">${item.prdName}</div>
										</div>`;
							
						
						let prdDes = item.prdDes;
						
						if(prdDes != null){
							viewData += `
											<div class="prd-des">
												<div>${prdDes}</div>
											</div>
											`;
						}
						
						viewData += `
										<div class="deco-btn-box">
											<span class="deco-btn-like off"><button class="deco-btn like"><i id="like" class="fa fa-heart-o"></i></button></span>
											<span class="deco-btn-bookMark off"><button class="deco-btn bookMark"><i id="bookMark" class="fa fa-star-o"></i></button></span>
										</div>
									`;
									
						if(linkData != '#'){
							viewData += `
										<div class="item-btn-box">
											<button onclick=${linkData}>상세보기</button>
									`;
						
						}
									
						if(sid != ""){
										viewData += `<button class="add-prd-btn open">추가하기</button>`;
										}
										viewData += `
										</div>
				  									<div class="prd-detail-view" style="display:none">
													</div>
									</div>
								</div>`;
								
							$('#prd-list-box').append(`
													${viewData}
													`);		
					});
				}
			}
		});
	  });
	  
	  $("#searchTextBox").on("keyup",function(key){
        if(key.keyCode==13) {
	  		$('#searchBtn').click();
        }
	  });
	
	  jQuery.randerProduct();
});