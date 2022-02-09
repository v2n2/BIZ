/**
 * 학습결과 - 전처리 결과 자바스크립트 코드
 */
var currentValue = 0;

function handleClick(myRadio) {
    currentValue = myRadio.value;
    
    choiceData(1);									// 캠페인 초기화 시나 페이징 번호 클릭 시 처음은 학습데이터 처리전 데이터부터 불러오는 것으로 초기화
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
	
	choiceData(1);									// 캠페인 초기화 시나 페이징 번호 클릭 시 처음은 학습데이터 처리전 데이터부터 불러오는 것으로 초기화
}

/*
 * 학습, 대상자 데이터 전이나 후의 클릭한 버튼에 따라 데이터를 가져오는 함수
 * thisNo는 클릭한 버튼의 상태 번호를 뜻함
 */
function choiceData(thisNo) {
	switch (thisNo) {
		case 1:
			$("#id_span_msg").text("(학습데이터 처리전)");
			
			break;
		case 2:
			$("#id_span_msg").text("(대상자데이터 처리전)");
			
			break;
		case 3:
			$("#id_span_msg").text("(학습데이터 처리후)");
			
			break;
		case 4:
			$("#id_span_msg").text("(대상자데이터 처리후)");
			
			break;
		default:
			break;
	}
	
	if(currentValue != 0) {
		var stagingData = {
			statusFlag : thisNo,
			cam_id : currentValue
		};
			
		$.ajax({
			url:"/staging/count",
			data:stagingData,
			success:function(pagingData) {
				createPagenationPreprocess(pagingData["realEndPage"], pagingData["displayPageNum"], thisNo);
			}
		});
	}
}

function createPagenationPreprocess(totalPage, displayPage, thisNo) {
	$("#pagination_preprocess").twbsPagination("destroy");
	
	// 데이터 존재 시(페이지 수 0 아님)
	if(totalPage != 0) {
		$("#pagination_preprocess").twbsPagination({
	        totalPages: totalPage,
	        visiblePages: displayPage,
	        onPageClick: function (event, page) {
	        	searchPreprocess(page, thisNo);
	        }
	    });
	} else {		// 데이터 미 존재 시
		noDataPreprocess();
	}
}

function searchPreprocess(clickPage, thisNo) {
	var stagingData = { 
		statusFlag : thisNo,
		cam_id : currentValue,
		page : clickPage
	};
		
	$.ajax({
		url:"/staging/list",
		data:stagingData,
		success:function(data) {
			createTablePreprocess(data);
		}
	});	
}

function createTablePreprocess(arr){
	var html = "<table id='preprcs_ai_table' class='table table-bordered table-hover'>";
	
	html += "<thead><tr><th class='text-center'>SEQ</th>";
	html += "<th class='text-center'>캠페인ID</th>";
	html += "<th class='text-center'>컬럼1</th>";
	html += "<th class='text-center'>컬럼2</th>";
	html += "<th class='text-center'>컬럼3</th>";
	html += "<th class='text-center'>컬럼4</th>";
	html += "<th class='text-center'>컬럼5</th>";
	html += "<th class='text-center'>컬럼6</th>";
	html += "<th class='text-center'>컬럼7</th>";
	html += "<th class='text-center'>컬럼8</th>";
	html += "<th class='text-center'>컬럼9</th>";
	html += "<th class='text-center'>컬럼10</th>";
	html += "<th class='text-center'>컬럼200</th></tr></thead><tbody>";
	
	// 데이터 존재 미존재 여부에 따른 표 표시
	if(arr.length != 0) {
		arr.forEach(function(arrVal, arrIdx) {
			html += "<tr>";
			
			Object.getOwnPropertyNames(arr[arrIdx]).forEach(function(val, idx, array) {
				if(val == "st_seq" || val == "cam_id" || val == "st_c1" || val == "st_c2" || val == "st_c3" ||
					val == "st_c4" || val == "st_c5" || val == "st_c6" || val == "st_c7" || val == "st_c8" || 
					val == "st_c9" || val == "st_c10" || val == "st_c200") {
					
					html += "<td class='text-center'>" + arr[arrIdx][val] + "</td>";
				}
			});
			
			html += "</tr>";
		});
	}
	
	html += "</tbody></table>";
	  	
	$("#div_preprocess").html(html);					// innerHtml jquery버전
}

//캠페인 테이블 정보가 없어서 캠페인 아이디가 존재하지 않을 경우 사용하는 함수
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
	camHtml += "<th class='text-center'>메시지</th></tr></thead><tbody>";
	
	camHtml += "<tr><td class='text-center' colspan='10'>조회된 데이터가 없습니다.</td></tr>";
	
	camHtml += "</tbody></table>";
  	
	$("#div_campaign").html(camHtml);					// 캠페인 html
	
	$("#id_span_msg").text("(학습데이터 처리전)");
	
	noDataPreprocess();
}

function noDataPreprocess() {
	$("#pagination_preprocess").twbsPagination("destroy");
	
	var prcsHtml = "<table id='preprcs_ai_table' class='table table-bordered table-hover'>";
	
	prcsHtml += "<thead><tr><th class='text-center'>SEQ</th>";
	prcsHtml += "<th class='text-center'>캠페인ID</th>";
	prcsHtml += "<th class='text-center'>컬럼1</th>";
	prcsHtml += "<th class='text-center'>컬럼2</th>";
	prcsHtml += "<th class='text-center'>컬럼3</th>";
	prcsHtml += "<th class='text-center'>컬럼4</th>";
	prcsHtml += "<th class='text-center'>컬럼5</th>";
	prcsHtml += "<th class='text-center'>컬럼6</th>";
	prcsHtml += "<th class='text-center'>컬럼7</th>";
	prcsHtml += "<th class='text-center'>컬럼8</th>";
	prcsHtml += "<th class='text-center'>컬럼9</th>";
	prcsHtml += "<th class='text-center'>컬럼10</th>";
	prcsHtml += "<th class='text-center'>컬럼200</th></tr></thead><tbody>";
	
	prcsHtml += "<tr><td class='text-center' colspan='13'>조회된 데이터가 없습니다.</td></tr>";
	
	prcsHtml += "</tbody></table>";
  	
	$("#div_preprocess").html(prcsHtml);					// innerHtml jquery버전
}