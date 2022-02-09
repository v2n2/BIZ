var s4_totalpage = 10;
var s4_visiblePages = 10;

var s4_page_st = 1;
var s4_page_end = 10;

var page_no = 1;

function grid_pagingSt4(div) {
	// alert("call grid_pagingSt3 ");

	div.twbsPagination('destroy');
	window.pagObj = div.twbsPagination(
			{
				totalPages : s3_totalpage,
				visiblePages : s3_visiblePages,
				onPageClick : function(event, page) {
					// alert("on1 " + page + ' (from event listening)');

					s4_page_st = ((1 * s4_visiblePages) * page)
							- (s4_visiblePages - 1);
					s4_page_end = (s4_page_st + s4_visiblePages) - 1;

					// alert("grid_pagingSt s1_page_st [" + s1_page_st + "] ,
					// s1_page_end[" + s1_page_end + "], page[" +page +"]" );

					search_st4();
				}
			}).on('page', function(event, page) {
		// alert("on2 " + page + ' (from event listening)');
	});
}

function search_st4() {
	// alert("search_st :: cam_id[" + currentValue + "],s1_totalpage[" +
	// s1_totalpage + "], s1_page_st[" + s1_page_st + "], s1_page_end[" +
	// s1_page_end + "]");

	var cam_id = currentValue;

	var succVal = $('#pr_succVal').val();
	var totalVal = $('#pr_totalVal').val();

	var page = new Object();
	page.cam_id = cam_id;
	page.page_st = s4_page_st;
	page.page_end = s4_page_end;
	page.page = page_no;

	page.succVal = succVal;
	page.totalVal = totalVal;

	$.ajax({
		type : 'GET', // method
		url : '/staging/predict',
		// url : '/admin/login_proc?ADM_ID=XXXX&ADM_PW=XXXX', // GET 요청은 데이터가
		// URL 파라미터로 포함되어 전송됩니다.
		async : 'true', // true
		data : page, // GET 요청은 지원되지 않습니다.
		processData : true, // GET 요청은 데이터가 바디에 포함되는 것이 아니기 때문에 URL에 파라미터 형식으로
							// 추가해서 전송해줍니다.
		cache : false,
		contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만
											// 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
		// dataType : [응답 데이터 형식], // 명시하지 않을 경우 자동으로 추측
		success : function(data) {
			var obj = JSON.stringify(data, true, 2);
			//alert("search_st result :: " + obj);

			grid_tableStaging4(obj);

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});

}

function grid_tableStaging4(obj) {
	// alert("grid_table_campaign :: " + obj);
	var div = document.querySelector('#ai_TestPredict');

	html = '<table width="100%" class="table table-bordered table-hover">';
	html += '<thead><tr>';
	html += '<th class="text-center">번호</th>';
	html += '<th class="text-center">캠페인ID</th>';
	html += '<th class="text-center">식별번호</th>';
	html += '<th class="text-center">학습방법</th>';
	html += '<th class="text-center">예측결과</th>';
	html += '<th class="text-center">성공확률</th>';
	html += '<th class="text-center">실패확률</th>';

	html += '</tr></thead>';
	html += '<tbody>';

	var json = $.parseJSON(obj);
	$(json).each(function(i, val) {
		html += '<tr>';
		// html += '<td><input type="checkbox" name="camCheck"/></td>';
		$.each(val, function(k, v) {

			if (k == 'st_seq' || k == 'cam_id') {
				html += '<td>' + v + '</td>';
			}

			if (k == 'st_c1' || k == 'train_method') {
				html += '<td>' + v + '</td>';
			}
			if (k == 'predict') {
				if(v == '0'){
					html += '<td>실패</td>';
				}else if(v == '1'){
					html += '<td>성공</td>';
				}else{
					html += '<td>' + v + '</td>';
				}
			}

			if (k == 'succ_prob' || k == 'fail_prob') {
				html += '<td>' + v + ' %</td>';
			}

		});
		html += '</tr>';
	});

	html += '</tbody>';
	html += '</table>';

	div.innerHTML = html;
}

function PrSearch() {
	// alert("call PrSearch ~!!");
	search_st4();
}

function PrDownload() {
	// alert("call PrDownload ~!!");
	/*var succVal = $('#pr_succVal').val();
	var totalVal = $('#pr_totalVal').val();
	if (totalVal != "0") totalVal = totalVal+"0000";
	
	var cam_id = currentValue + "_" + succVal + "_1_" + totalVal;*/
	
	// alert("PrDownload :: pr_succVal[" + pr_succVal + "], pr_totalVal[" +
	// pr_totalVal + "]");

	// window.open('/file/downPredict/${'+cam_id+'}');
	window.open('/file/downPredict/' + cam_id + '');

}
