/**
 * 
 */
 //차트
 jQuery.randerChart = function(){
 	
	$('#chart-view').empty();
 	$.ajax({
			url:"/profile/calender/categoryChart",
			method:"POST",
			dataType:'json',
			success:function(result){
				let total = 0;
				for(let i = 0; i < result.length; i++){
					total += result[i]
				}
				if(total == 0){
					$('#chart-view').append(`
						<div class="warning-text">등록된 일정이 없습니다. 일정을 등록해주세요.</div>
					`);
				}
				else{
					$('#chart-view').append(`
							<div class="chart-view-box">
								<div>사용하는 돈 비율(가제)</div>
								<canvas id="money-ratio-chart"></canvas>
							</div>
					`);
					const ratioChart = new Chart('money-ratio-chart', {
						type:'doughnut',
						data:{
							labels :["카드", "보험"],
							datasets:[{
								backgroundColor :['yellow', 'red'],
								data:[result[0], result[1]]
							}]
						},
						options : {
							responsive:false
						}
					});	
				}
			}
		});
		
	$.ajax({
		url:"/profile/calender/totalAssetChart",
		method:"POST",
		dataType:'json',
		success:function(result){
		let total = 0;
		for(let i = 0; i < result.length; i++){
			total += result[i]
		}
		if(total != 0){
			$('#chart-view').append(`
					<div class="chart-view-box">
						<div>전체 자산 차트(가제)</div>
						<canvas id="total-asset-chart"></canvas>
					</div>
			`);
			const assetChart = new Chart('total-asset-chart', {
			type:'doughnut',
			data:{
				labels :["모은돈", "빌린돈"],
				datasets:[{
					backgroundColor :['blue', 'gray'],
					data:[result[0], result[1]]
				}]
			},
			options : {
				responsive:false,
				rotation: 1 * Math.PI, 
				circumference: 1 * Math.PI 
					}
				});	
			}
		}
	});
 }
 
$(document).ready(function(){
	jQuery.randerChart();
});
