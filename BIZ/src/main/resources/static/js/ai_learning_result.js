/**
 * AI 학습 결과 자바스크립트 코드
 */
var currentValue = 0;

function handleClick(myRadio) {
    currentValue = myRadio.value;
    
    connectLearningResult();
}
  
function radioInit(myRadio) {  
	if(myRadio != 0){
		currentValue = myRadio;
	}
}

// 파라메터 존재하는 캠페인 찾기 메서드 사용하려면 밑의 new 접두어가 들어간 메서드 사용할 것!!!
function newCampaignPage(){
	var campaignData = { 
		cam_name : $("#cam_name").val(), 
		cam_type : $("#cam_type").val(),
		cam_status : $("#cam_status").val()
	};
			
	$.ajax({
		url:"/campaign/count",
		data:campaignData,
		success:function(pagingData) {
			createPagenationCam(pagingData["realEndPage"], pagingData["displayPageNum"]);
		}
	});
}

function createPagenationCam(totalPage, displayPage) {
	$("#pagination_cam").twbsPagination("destroy");
	
	// 데이터 존재 시(페이지 수 0 아님)
	if(totalPage != 0) {
		$("#pagination_cam").twbsPagination({
	        totalPages: totalPage,
	        visiblePages: displayPage,
	        onPageClick: function (event, page) {
	        	newSearchCampaign(page);
	        }
	    });
	} else {		// 데이터 미 존재 시
		currentValue = 0;		// 캠페인 ID 초기화
		
		noDataCamId();
	}
}

function newSearchCampaign(clickPage){
	var campaignData = { 
		cam_name : $("#cam_name").val(), 
		cam_type : $("#cam_type").val(),
		cam_status : $("#cam_status").val(),
		page : clickPage
	};
		
	$.ajax({
		url:"/campaign/list",
		data:campaignData,
		success:function(data) {
			createTableCampaign(data);
		}
	});	
}

function createTableCampaign(arr){
	var html = "<table id='cpi_ai_table' class='table table-bordered table-hover'>";
	var first = true;
	
	html += "<thead><tr><th class='text-center'>체크</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>캠페인이름</th>";
	html += "<th class='text-center'>등록자</th>";
	html += "<th class='text-center'>캠페인목적</th>";
	html += "<th class='text-center'>캠페인상태</th>";
	/*html += "<th class='text-center'>AI진행상태</th>";*/
	html += "<th class='text-center'>캠페인 등록일자</th>";
	html += "<th class='text-center'>설명</th>";
	html += "</tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				switch (val) {
					case "src_id":
						if(first == true) {
							html += "<td class='text-center'><input name='cam_check' type='radio' value='" + arr[arrIdx][val] + "' onclick='handleClick(this);' checked='checked'></td>";
							
							radioInit(arr[arrIdx][val]);
							
							first = false;
						} else {
							html += "<td class='text-center'><input name='cam_check' type='radio' value='" + arr[arrIdx][val] + "' onclick='handleClick(this);'></td>";
						}
						
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "src_name":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "adm_id":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "src_type":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "status_cd":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					/*case "cam_itype":
						switch (arr[arrIdx][val]) {
							case "0":
								html += "<td><span class='label label-info'>데이터 로딩 필요</span></td>";
								
								break;
							case "1":
								html += "<td><span class='label label-warning'>데이터 엑셀 로딩중</span></td>";
								
								break;
							case "2":
								html += "<td><span class='label label-warning'>데이터 엑셀 처리중</span></td>";
								
								break;
							case "3":
								html += "<td><span class='label label-danger'>데이터 엑셀 처리 오류</span></td>";
								
								break;
							case "4":
								html += "<td><span class='label label-primary'>데이터 엑셀 처리 종료</span></td>";
								
								break;
							case "7":
								html += "<td><span class='label label-primary'>전처리완료</span></td>";
								
								break;
							case "10":
								html += "<td><span class='label label-primary'>모델생성완료</span></td>";
								
								break;
							case "14":
								html += "<td><span class='label label-primary'>대상자예측완료</span></td>";
								
								break;
							default:
								html += "<td><span class='label label-primary'>학습완료</span></td>";
								
								break;
						}
						
						break;*/
					case "created":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "desc_text":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						break;
					default:
						break;
				}
			});
			
			html += "</tr>";
		});	
	}
	
	html += "</tbody></table>";
	  	
	$("#div_campaign").html(html);					// innerHtml jquery버전
	
	connectLearningResult();
}

//캠페인 아이디로 학습결과 테이블 불러오기
function connectLearningResult() {
	if(currentValue != 0) {
		$.ajax({
			url:"/Learning/result",
			data:{
				cam_id : currentValue
			},
			success:function(data) {
				createTableLearningResult(data);
			}
		});
	}
}

function createTableLearningResult(arr){
	// 임시 학습모델
	var tempTrainMethod;
	// 모델 플래그 'Y' 값인 학습모델
	var yTrainMethod;
	
	var html = "<table id='learning_result_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>학습모델</th>";
	html += "<th class='text-center'>기존정확도</th>";
	html += "<th class='text-center'>AI정확도</th>";
	html += "<th class='text-center'>학습시작시간</th>";
	html += "<th class='text-center'>학습종료시간</th>";
	html += "<th class='text-center'>선택Model</th>";
	html += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				switch (val) {
					case "src_id":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "train_method":
						html += "<td>" + arr[arrIdx][val] + "</td>";
						
						tempTrainMethod = arr[arrIdx][val];
						
						break;
					case "original_acc":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "%</td>";
						
						break;
					case "so_acc":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "%</td>";
						
						break;
					case "train_start":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "train_end":
						html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						
						break;
					case "model_flg":
						if(arr[arrIdx][val] == "Y") {
							html += "<td class='bg-yellow text-center'>" + arr[arrIdx][val] + "</td>";
							
							yTrainMethod = tempTrainMethod;
						} else {
							html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
						}
						
						break;
					case "desc_text":
						if((arr[arrIdx][val] == null) || (arr[arrIdx][val] == "null") || (arr[arrIdx][val] == "")) {
							html += "<td></td>";
						} else {
							html += "<td>" + arr[arrIdx][val] + "</td>";
						}
						
						break;
					default:
						break;
				}
			});
			
			html += "</tr>";
		});
	} else {
		html += "<tr><td class='text-center' colspan='8'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_learning_result").html(html);					// innerHtml jquery버전
	
	connectLearningWeight(yTrainMethod);
}

//캠페인 아이디로 학습결과 중요도 불러오기
function connectLearningWeight(yTrainMethod) {
	if((currentValue != 0) && (yTrainMethod != null) && (yTrainMethod != "")) {
		$.ajax({
			url:"/Learning/weight",
			data:{
				cam_id : currentValue,
				train_method : yTrainMethod
			},
			success:function(data) {
				createTableLearningWeight(data);
			}
		});
	} else {
		var html = "<table id='learning_weight_table' class='table table-bordered table-hover'>";
		
		html += "<thead><tr><th class='text-center'>캠페인ID</th>";
		html += "<th class='text-center'>학습방법</th>";
		html += "<th class='text-center'>항목명</th>";
		html += "<th class='text-center' colspan='2'>중요도(%)</th></tr></thead><tbody>";
		
		html += "<tr><td class='text-center' colspan='5'>조회된 데이터가 없습니다.</td></tr>";
		
		html += "</tbody></table>";
	  	
		$("#div_learning_weight").html(html);
	}
}

function createTableLearningWeight(arr){
	var html = "<table id='learning_weight_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>학습방법</th>";
	html += "<th class='text-center'>항목명</th>";
	html += "<th class='text-center' colspan='2'>중요도(%)</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				// 중요도 필드는 퍼센트 계산 후 소수정 두번째 자리 반올림
				if(val == "weight") {
					if(Number(arr[arrIdx][val]) != 0) {
						arr[arrIdx][val] = (Number(arr[arrIdx][val]) * 100).toFixed(2);
					}
					
					html += "<td width='50%'><div class='progress progress-xs progress-striped active'>"
		                   + "<div class='progress-bar progress-bar-primary' style='width: "+arr[arrIdx][val]+"%'></div>"
		                	  + "</div></td><td width='5%'><span class='badge bg-light-blue'>"+arr[arrIdx][val]+"%</span></td>";
				} 
				
				if((arr[arrIdx][val] == null) || (arr[arrIdx][val] == "null") || (arr[arrIdx][val] == "")) {
					html += "<td></td>";
				} else {
					html += "<td>" + arr[arrIdx][val] + "</td>";
				}
			});
			
			html += "</tr>";
		});
	} else {
		html += "<tr><td class='text-center' colspan='5'>조회된 데이터가 없습니다.</td></tr>";
	}
	
	html += "</tbody></table>";
	  	
	$("#div_learning_weight").html(html);					// innerHtml jquery버전
}

// 캠페인 테이블 정보가 없어서 캠페인 아이디가 존재하지 않을 경우 사용하는 함수
function noDataCamId() {
	var camHtml = "<table id='cpi_ai_table' class='table table-bordered table-hover'>";
	
	camHtml += "<thead><tr><th class='text-center'>체크</th>";
	camHtml += "<th class='text-center'>캠페인ID</th>";
	camHtml += "<th class='text-center'>캠페인이름</th>";
	camHtml += "<th class='text-center'>등록자</th>";
	camHtml += "<th class='text-center'>캠페인목적</th>";
	camHtml += "<th class='text-center'>캠페인상태</th>";
	/*camHtml += "<th class='text-center'>AI진행상태</th>";*/
	camHtml += "<th class='text-center'>캠페인 등록일자</th>";
	camHtml += "<th class='text-center'>설명</th>";
	camHtml += "</tr></thead><tbody>";
	camHtml += "<tr><td class='text-center' colspan='10'>조회된 데이터가 없습니다.</td></tr>";
	camHtml += "</tbody></table>";
  	
	$("#div_campaign").html(camHtml);							// 캠페인 html
	
	var modelHtml = "<table id='learning_result_table' class='table table-bordered table-hover'>";
	
	modelHtml += "<thead><tr><th class='text-center'>학습방법</th>";
	modelHtml += "<th class='text-center'>정확도(ORIGINAL)(%)</th>";
	modelHtml += "<th class='text-center'>정확도(SO엔진)(%)</th>";
	modelHtml += "<th class='text-center'>모델경로</th>";
	modelHtml += "<th class='text-center'>모델명</th></tr></thead><tbody>";
	
	modelHtml += "<tr><td class='text-center' colspan='5'>조회된 데이터가 없습니다.</td></tr>";
	
	modelHtml += "</tbody></table>";
	  	
	$("#div_learning_result").html(modelHtml);					// 학습모델 html
	
	var weightHtml = "<table id='learning_weight_table' class='table table-bordered table-hover'>";
	
	weightHtml += "<thead><tr><th class='text-center'>캠페인ID</th>";
	weightHtml += "<th class='text-center'>학습방법</th>";
	weightHtml += "<th class='text-center'>항목명</th>";
	weightHtml += "<th class='text-center' colspan='2'>중요도(%)</th></tr></thead><tbody>";
	
	weightHtml += "<tr><td class='text-center' colspan='5'>조회된 데이터가 없습니다.</td></tr>";
	
	weightHtml += "</tbody></table>";
  	
	$("#div_learning_weight").html(weightHtml);					// 중요도 html
	
}