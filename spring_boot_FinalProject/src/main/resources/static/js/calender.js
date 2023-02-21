/**
 * calender.js
 */
 
 //날짜 받아오기
let date = new Date();

//유저 아이디
let sid = "";

//캘린더
jQuery.randerCalender = function(){
	//연도, 달 선택창 가리기
	$('#year-select-Box').hide();
	$('#month-select-Box').hide();
	
	//캘린더 박스 비워서 원래 있는 내용에 추가되지 않게
	$('#calender-view-box').empty();
	
	//지금 보고 있는 연도, 달, 일을 받아옴
	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();
	
	//실제 년, 월, 일(오늘 기준) 받아옴
	const toDate = new Date();
	const nowYear = toDate.getFullYear();
	const nowMonth = toDate.getMonth();
	const nowDate = toDate.getDate();
	
	//캘린더쪽 헤더에 표기할 달, 2글자가 아니면 앞에 0을 추가
	let viewMonth2 = viewMonth+1;
	viewMonth2 = viewMonth2.toString().padStart(2, '0');
	
	$("#now-year").text(viewYear);
	$("#now-month").text(viewMonth2);
	
	
	//저번달의 마지막 날짜와 요일, 이번달의 마지막 날짜와 요일을 받아옴
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);
	const PLDate = prevLast.getDate();
  	const PLDay = prevLast.getDay();
  	const TLDate = thisLast.getDate();
  	const TLDay = thisLast.getDay();
  	 
  	const prevDates = [];
  	//TLDate+1까지의 key값을 thisDates 배열에 저장하고 0을 출력하지 않게 하기 위해 1부터 끝까지 잘라 저장한다
  	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
  	const nextDates = [];
	
	// prevDates 계산
	if (PLDay != 6) {
	  //PLDate - i부터 순차적으로 작아지기 때문에 unshift를 이용해 새로운 값을 배열 가장 앞에 저장할 수 있게 코딩함
	  for (let i = 0; i < PLDay + 1; i++) {
	    prevDates.unshift(PLDate - i);
	  }
	}
	
	// nextDates 계산
	if(TLDay == 6){
		//다음달은 최대 2주까지 출력해야해서 i <= 14
		for (let i = 1; i <= 14; i++) {
		  nextDates.push(i);
		}
	}
	else{
		for (let i = 1; i <= 14 - TLDay; i++) {
		  nextDates.push(i);
		}
	}
	
	//저번 달 일수를 모아둔 배열에 이번달과 다음달 배열을 합쳐 전체적인 캘린더 날짜를 출력할 배열을 생성한다
	let dates = prevDates.concat(thisDates, nextDates);
	let randerDate = "";
	let randerWeek = "";
	
	//6주치 캘린더
    for(let weekCnt = 0; weekCnt < 6; weekCnt++){
    	//1주가 지날 때마다 비워준다
    	randerDate = "";
		
		//1일부터 7일까지
		for(let dayCnt = 0; dayCnt < 7; dayCnt++){
			//우선은 날짜를 채워넣음
			randerDate += `<td class="dates">${dates[weekCnt*7+(dayCnt)]}</td>`;
		}		
		//하나로 합치는 작업
		randerWeek += `<tr>${randerDate}</tr>`;
	}
		
	//tbody 삽입
	$('#calender-view-box').append(`
							<tr><th class="dates-head-text sun">일</th><th class="dates-head-text">월</th><th class="dates-head-text">화</th><th class="dates-head-text">수</th><th class="dates-head-text">목</th><th class="dates-head-text">금</th><th class="dates-head-text sat">토</th></tr>
							${randerWeek}
					   `);
	
	//6주치 캘린더
    for(let weekCnt = 0; weekCnt < 6; weekCnt++){
		
		//1일부터 7일까지
		for(let dayCnt = 0; dayCnt < 7; dayCnt++){
				//실제 오늘인지 class로 표기 
				if(nowYear == viewYear && nowMonth == viewMonth && nowDate == dates[weekCnt*7+(dayCnt)]){
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('real-date');
				}
				
				//저번 달 일수인지를 표기해주는 if문(class, id 추가)
			    if(weekCnt*7+(dayCnt) < prevDates.length) {
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('past-dates');
					$('.dates').eq(weekCnt*7+(dayCnt)).attr('id', `${dates[weekCnt*7+(dayCnt)]}prev`);
				}
				//이번달 달 일수인지를 표기해주는 if문(class, id 추가)
				else if((weekCnt*7+(dayCnt)) < thisDates.length + prevDates.length ){
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('nowDays');
					$('.dates').eq(weekCnt*7+(dayCnt)).attr('id', `${dates[weekCnt*7+(dayCnt)]}now`);
				}		
				//만일 뒤에 공간이 남으면 다음 달 날짜로 채우기(class, id 추가)
				else{
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('fut-dates');
					$('.dates').eq(weekCnt*7+(dayCnt)).attr('id', `${dates[weekCnt*7+(dayCnt)]}fut`);
				}
				
				//일요일인지 표기해주는 if문
				if(dayCnt == 0){
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('sun');
				}
				//토요일인지 표기해주는 if문
				else if(dayCnt == 6){
					$('.dates').eq(weekCnt*7+(dayCnt)).addClass('sat');
				}
			}
	}
	
					   
	$.ajax({
        type: 'POST',
        url: '/profile/calender/getPlanData',
        dataType: 'json',
        success: function(result) {
				$.each(result, function(index, item){
					
					const fullDate = item.calSubDate;
					const startYear = Number(fullDate.slice(0,4));
					let month = fullDate.slice(5,7);
					month = Number(month.replace("0", ""));
					let date = fullDate.slice(8,10);
					date = Number(date.replace("0", ""));
					
					const endYear = startYear+item.calMaturity;
					const transferDate = item.calTransfer;
					
					prdName = item.prdName;
					
					let payment = item.calPayment;
					payment = payment.toLocaleString('ko-KR');
				
					let planTitle = "";
					
					if(startYear == viewYear && month == viewMonth+1 && date <= transferDate){
						for(let i = $(".past-dates").length; i < 42; i++){
							if($(".dates").eq(i).text() == transferDate){
								planTitle = `
									<div class="calender-plan">
												<div class="calender-plan-title"><span class="calender-plan-name">${prdName}</span><span> 이체일</span></div>`;
								
								$(".dates").eq(i).append(`
										<div id="${item.prdID}" class="calender-plan-box ${item.prdType}">
											<div class="plan-title">
												${planTitle}
												<div class="payment">
													<span>${payment} 원</span>
												</div>
											</div>
										</div>
									`);
							}
						}
					}
					
					else if(startYear == viewYear && month == viewMonth+1 && date > transferDate){
						for(let i = $(".past-dates").length + $(".nowDays").length; i < 42; i++){
							if($(".dates").eq(i).text() == transferDate){
								planTitle = `
									<div class="calender-plan">
												<div class="calender-plan-title"><span class="calender-plan-name">${prdName}</span><span> 이체일</span></div>`;
								
								$(".dates").eq(i).append(`
										<div id="${item.prdID}" class="calender-plan-box ${item.prdType}">
											<div class="plan-title">
												${planTitle}
												<div class="payment">
													<span>${payment} 원</span>
												</div>
											</div>
										</div>
									`);
							}
						}
					}
					else if(endYear == viewYear && month >= viewMonth+1){
						for(let i = 0; i < $(".nowDays").length + $(".past-dates").length; i++){
							if($(".dates").eq(i).text() == transferDate){
									planTitle = `
												<div class="calender-plan">
										<div class="calender-plan-title"><span class="calender-plan-name">${prdName}</span><span> 이체일</span></div>`;
								
								$(".dates").eq(i).append(`
										<div id="${item.prdID}" class="calender-plan-box ${item.prdType}">
											<div class="plan-title">
												${planTitle}
												<div class="payment">
													<span>${payment} 원</span>
												</div>
											</div>
										</div>
									`);
							}
						}
					}
					else if(startYear == viewYear && month < viewMonth+1){
						for(let i = 0; i < 42; i++){
							if($(".dates").eq(i).text() == transferDate){
									planTitle = `
												<div class="calender-plan">
													<div class="calender-plan-title"><span class="calender-plan-name">${prdName}</span><span> 이체일</span></div>`;
								
								$(".dates").eq(i).append(`
										<div id="${item.prdID}" class="calender-plan-box ${item.prdType}">
											<div class="plan-title">
												${planTitle}
												<div class="payment">
													<span>${payment} 원</span>
												</div>
											</div>
										</div>
									`);
							}
						}
					}
					else if(startYear < viewYear && endYear > viewYear){
						for(let i = 0; i < 42; i++){
							if($(".dates").eq(i).text() == transferDate){
									planTitle = `
									<div class="calender-plan">
										<div class="calender-plan-title"><span class="calender-plan-name">${prdName}</span><span> 이체일</span></div>`;
								
								$(".dates").eq(i).append(`
										<div id="${item.prdID}" class="calender-plan-box ${item.prdType}">
											<div class="plan-title">
												${planTitle}
												<div class="payment">
													<span>${payment} 원</span>
												</div>
											</div>
										</div>
									`);
							}
						}
					}
					
				});
        },
    });
	
	$('#calender-view-box').show();
}
 
//연도 선택창
function randerYear(){
	$('#calender-view-box').hide();
	$('#month-select-Box').hide();
	$('#year-select-Box').empty();
		
	const nowDate = new Date();
	const nowYear = nowDate.getFullYear();
	const viewYear = date.getFullYear();
	const delYear = viewYear - viewYear%10 - 10;
		
	let randerYear = "";
	let years = "";
		
	for(let i =0; i < 21; i++){
		if(delYear+i == nowYear){
			years += `<td id="${delYear+i}" class="years now real-date">${delYear+i}</td>`;
		}
		else if(delYear+i <= nowYear+10 && delYear+i >= nowYear-10){
			years += `<td id="${delYear + i}" class="years now">${delYear + i}</td>`;
		}
		else years += `<td id="${delYear + i}" class="years">${delYear + i}</td>`;
		
		if((delYear + i +1)%5 == 0){
			randerYear += `<tr>${years}</tr>`;
			years = "";
		}
	}
	
		
	$('#year-select-Box').append(`
		${randerYear}
	`);
	
	$('#year-select-Box').show();
}


//달 선택창
function randerMonth(){
	$('#calender-view-box').hide();
	$('#year-select-Box').hide();
	$('#month-select-Box').empty();
		
	const nowDate = new Date();
	const nowMonth = nowDate.getMonth();
		
	let randerMonth = "";
	let months = "";
		
	for(let i =0; i < 12; i++){
		if(i == nowMonth){
			months += `<td id="${i+1}" class="months now real-date">${i+1}</td>`;
		}
		else months += `<td id="${i+1}" class="months">${i+1}</td>`;
		if((i+1)%4 == 0){
			randerMonth += `<tr>${months}</tr>`;
		months = "";
			}
	}
		
	$('#month-select-Box').append(`
		${randerMonth}
	`);
		
	$('#month-select-Box').show();
}


$(document).ready(function(){
	//다음 달로 가는 버튼
	$(document).on('click', '.next-month-btn', function(e){
	  	e.preventDefault();
	  	date.setDate(1);
		date.setMonth(date.getMonth() + 1);
		jQuery.randerCalender();
		jQuery.randerPlan();
	})
	//저번 달로 가는 버튼
	$(document).on('click', '.prev-month-btn', function(e){
	  	e.preventDefault();
	  	date.setDate(1);
		date.setMonth(date.getMonth() - 1);
		jQuery.randerCalender();
		jQuery.randerPlan();
	})
	//오늘로 가는 버튼
	$(document).on('click', '.view-today-btn', function(e){
	  	e.preventDefault();
		const today = new Date();
	  	date.setDate(today.getDate());
		date.setMonth(today.getMonth());
		date.setFullYear(today.getFullYear());
		jQuery.randerCalender();
		jQuery.randerPlan();
	})
	
	//연도 선택 버튼 보이기
	$(document).on('click', '#year-select-btn', function(e){
	  	e.preventDefault(e);
	  	randerYear();
		
	});
	
	$("#year-select-Box").on("mousewheel", function (e) {
		e.preventDefault();
		let wheel = e.originalEvent.wheelDelta;
		const viewYear = date.getFullYear();
		
		if (wheel > 0) {
		   //스크롤 올릴때
		  if(viewYear-20 >= 1910){
			date.setFullYear(viewYear-20);
			randerYear();
		}
			
		 } else {
		    //스크롤 내릴때
		    if(viewYear+20 <= 2200){
				date.setFullYear(viewYear+20);
				randerYear();
			}
		}
	})
	
	$(document).on('click', '.years', function(e){
	  	e.preventDefault();  
	  	const selYear = $(this).attr('id');
	  	date.setFullYear(selYear);
		randerMonth();
	})
	
	//달 선택 버튼 보이기
	$(document).on('click', '#month-select-btn', function(e){
	  	e.preventDefault();
		randerMonth();
	});
	
	$(document).on('click', '.months', function(e){
	  e.preventDefault();  
	  const selMonth = $(this).attr('id');
	  date.setDate(1);
	  date.setMonth(selMonth - 1);
	  jQuery.randerCalender();
	  jQuery.randerPlan();
	})
	
	$(document).on('click', '.like', function(e){
	  e.preventDefault();
	  const clickIndex = $('.like').index(this);
	  
	  if($('.deco-btn-like').eq(clickIndex).hasClass('off')){
		  $('.deco-btn-like').eq(clickIndex).removeClass('off');
		  $('.deco-btn-like').eq(clickIndex).addClass('on');
		  $(this).children('i').removeClass('fa-heart-o');
		  $(this).children('i').addClass('fa-heart');
		  $(this).children('i').css('color', 'red');
	  }
	  else if($('.deco-btn-like').eq(clickIndex).hasClass('on')){
		  $('.deco-btn-like').eq(clickIndex).removeClass('on');
		  $('.deco-btn-like').eq(clickIndex).addClass('off');
		  $(this).children('i').removeClass('fa-heart');
		  $(this).children('i').addClass('fa-heart-o');
		  $(this).children('i').css('color', 'rgb(64 60 67 / 60%)');
	  }
	})
	
	$(document).on('click', '.bookMark', function(e){
	  e.preventDefault();
	  const clickIndex = $('.bookMark').index(this);
	  
	  if($('.deco-btn-bookMark').eq(clickIndex).hasClass('off')){
		  $('.deco-btn-bookMark').eq(clickIndex).removeClass('off');
		  $('.deco-btn-bookMark').eq(clickIndex).addClass('on');
		  $(this).children('i').removeClass('fa-star-o');
		  $(this).children('i').addClass('fa-star');
		  $(this).children('i').css('color', 'yellow');
	  }
	  else if($('.deco-btn-bookMark').eq(clickIndex).hasClass('on')){
		  $('.deco-btn-bookMark').eq(clickIndex).removeClass('on');
		  $('.deco-btn-bookMark').eq(clickIndex).addClass('off');
		  $(this).children('i').removeClass('fa-star');
		  $(this).children('i').addClass('fa-star-o');
		  $(this).children('i').css('color', 'rgb(64 60 67 / 60%)');
	  }
	})
	
	
	//아이디 받아오기
	$.ajax({
		type:'POST',
		url:'/profile/calender/getSID',
		dataType:'text',
		async:false,
		success:function(result){
			sid = result;
		}
	});
	
	$('#select-view').on('change', function(e){
	  e.preventDefault();
	  
	  const kind = $('#select-view option:selected').val();
	  if(kind == 'calender'){
	  	$('#calender-view').show();
		$('#chart-view').hide();
		
		jQuery.randerCalender();
		if(!($('#calender-view').hasClass('select')))
			$('#calender-view').addClass('select');
		
		if($('#chart-view').hasClass('select'))
			$('#chart-view').removeClass('select');
	  }
	  else if(kind == "chart"){
	  	$('#chart-view').show();
		$('#calender-view').hide();
		if(!($('#chart-view').hasClass('select')))
			$('#chart-view').addClass('select');
		
		if($('#calender-view').hasClass('select'))
			$('#calender-view').removeClass('select');
	  }
	});
	
	
	jQuery.randerCalender();
});
