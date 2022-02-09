//notice
var nowPages = 1;
var totalPages = 1;
var visiblePages = 5;

var pageSize = 3;
var page_st = 1;
var page_end = 3;

// 글쓰기
function fn_write() {

	var form = document.getElementById("noticeForm");

	form.action = "<c:url value='/notice/writeForm.do'/>";
	form.submit();

}

// 글조회
function fn_view(code) {

	var form = document.getElementById("noticeForm");
	var url = "<c:url value='/notice/list'/>";
	url = url + "?code=" + code;

	form.action = url;
	form.submit();
}

// 게시글 조회
function view_notice(code) {
	// console.log('-- view_board -- ', code);

	$.ajax({
		type : "GET",
		url : "/notice/detail?code=" + code,
		contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만
		// 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
		cache : false,
		timeout : 600000,
		success : function(data) {
			console.log("SUCCESS : ", data);

			showModal('READ', data);
		},
		error : function(e) {
			alert("error :: " + e.responseText);
			console.log("ERROR : ", e);
		}
	});
}

function showModal(type, data) {
	// console.log('-- showModal -- ', type);
	if (type === 'EDIT') {
		$('#newModalLabel').text('게시글 신규 등록');

		$("#inputNoticeName").attr("readonly", false);

		$("#inputNoticeDesc").attr("readonly", false);

		$('.readNotice').hide();
		$('.editNotice').show();
	} else { // type === 'READ'
		var d = data[0];
		$('#newModalLabel').text('게시글 상세 조회');

		$("#inputNoticeName").attr("readonly", true);
		$("#inputNoticeName").val(d.title);

		$("#inputNoticeDesc").attr("readonly", true);
		$("#inputNoticeDesc").val(d.contents);

		$("#noticeCode").val(d.code);
		$("#noticeWriter").val(d.writer);
		$("#noticeDate").val(d.reg_datetime.substr(0, 19));

		$('.readNotice').show();
		$('.editNotice').hide();
	}

	$('#noticeNewModal').modal('show');
}

// 페이징처리
function getPagination() {
	var notice = new Object();
	notice.page_st = page_st;
	notice.page_end = page_end;

	$.ajax({
		type : 'GET',
		url : '/notice/listPage',
		async : true, // true
		cache : true,
		data : notice,
		processData : true,
		success : function(data) {
			var div = document.querySelector('#ai_notice');
			var html = '';
			$.each(
				data,
				function(i, val) {
					html += '<tr onClick="view_notice('
							+ val.code + ')">';
					$.each(
							val,
							function(k, v) {
								if (k == 'contents') {
									return;
								}

								if (k == 'reg_datetime') {
									v = v.substr(0,
											10);
								}

								if (v == 'null'
										|| v == '') {

								} else if (k == 'title') {
									html += '<td style="text-align: left; padding-left: 10px;">'
											+ v
											+ '</td>';
								} else {
									html += '<td>'
											+ v
											+ '</td>';
								}
							});
					html += '</tr>';
				});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;

		},
		error : function(request, status, error) {
			// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});

	$.ajax({
		type : 'GET',
		url : '/notice/totalPage',
		async : true,
		processData : true,
		cache : false,
		success : function(data) {
			if (data[0] != "0") {
				totalPages = Math.ceil(data[0] / visiblePages);
				grid_pagination(totalPages, visiblePages);
			}
		},
		error : function(request, status, error) {
		}
	});

}

function grid_pagination(totalPages, visiblePages) {
	// alert("grid_pagination :: " + totalPages + " :: " + visiblePages);

	$('#pagination').twbsPagination('destroy');
	window.pagObj = $('#pagination').twbsPagination({
		totalPages : totalPages,
		visiblePages : visiblePages,
		onPageClick : function(event, page) {
			// alert("on1 " + page + ' (from event listening)');

			page_st = ((1 * pageSize) * page) - (pageSize - 1);
			page_end = (page_st + pageSize) - 1;

			search_notice(page, page_st, page_end);
		}
	}).on('page', function(event, page) {
		// alert("on2 " + page + ' (from event listening)');
	});
}

function search_notice(now_page, page_st, page_end) {

	// alert("search_campaign call :: now[" + now_page + "] :: interval["
	// +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );

	var notice = new Object();
	notice.page_st = page_st;
	notice.page_end = page_end;

	$
			.ajax({
				type : 'GET', // method
				url : '/notice/listPage',
				async : 'true', // true
				cache : false,
				data : notice,
				processData : true,
				success : function(data) {
					var div = document.querySelector('#ai_notice');

					var html = '';
					$
							.each(
									data,
									function(i, val) {
										html += '<tr onClick="view_notice('
												+ val.code + ')">';
										$
												.each(
														val,
														function(k, v) {
															if (k == 'contents') {
																return;
															}

															if (k == 'reg_datetime') {
																v = v.substr(0,
																		10);
															}

															if (v == 'null'
																	|| v == '') {

															} else if (k == 'title') {
																html += '<td style="text-align: left; padding-left: 10px;">'
																		+ v
																		+ '</td>';
															} else {
																html += '<td>'
																		+ v
																		+ '</td>';
															}
														});
										html += '</tr>';
									});
					html += '</tbody>';

					// console.log("Tbody == " + html);
					div.innerHTML = html;

				},
				error : function(request, status, error) {
					// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
}

function grid_table_notice(obj) {
	var div = document.querySelector('#ai_notice');

	var html = '';
	$.each(obj, function(i, val) {
		html += '<tr onClick="view_notice(' + val.code + ')">';
		$.each(val, function(k, v) {
			if (k == 'contents') {
				return;
			}

			if (k == 'reg_datetime') {
				v = v.substr(0, 10);
			}

			if (v == 'null' || v == '') {

			} else if (k == 'title') {
				html += '<td style="text-align: left; padding-left: 10px;">'
						+ v + '</td>';
			} else {
				html += '<td>' + v + '</td>';
			}
		});
		html += '</tr>';
	});
	html += '</tbody>';

	// console.log("Tbody == " + html);
	div.innerHTML = html;
}

// labels
types = [ "통신", "금융", "유통", "기타" ];
periods = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월",
		"12월" ];
campaigns = [ "학습전(%)", "AI예측(%)", "SO예측(%)", "결과(%)" ];
chartBGColor = [ 'rgba(81, 152, 255, 0.6)', 'rgba(243, 115, 79, 0.6)', 'rgba(243, 156, 18, 0.6)',
		'rgba(0, 180, 175, 0.6)' ];

// elements

leftOriginal = 0;
leftSo = 0;
leftReal = 0;
leftAi = 0;

rightOriginal = [ 0, 0, 0, 0 ];
rightSo = [ 0, 0, 0, 0 ];
rightReal = [ 0, 0, 0, 0 ];
rightAi = [ 0, 0, 0, 0 ];

var chartOptions = {
	legend : {
		display: true,
        labels: {
            fontColor: 'rgb(255, 99, 132)'
        }
	},
	scales : {
		xAxes : [ {
			gridLines : {
				display : false
			},
			maxBarThickness : 35
		} ],
		yAxes : [ {
			gridLines : {
				display : false
			},
			ticks : {
				beginAtZero : true
			},
			gridLines : {
				display : true,
				drawBorder : true,
				drawOnChartArea : true,
				drawTicks : false,
			}
		}, ]
	},
	tooltips : {
		mode : 'index'
	},
	legend : {
		position : 'bottom',
	},
	plugins : {
		datalabels : {
			display : function(context) {
				return context.dataset.data[context.dataIndex] > 0;
			},
			formatter : Math.round
		}
	}
};

function initLeftChart() {
	var ctxLeft = document.getElementById("chBarLeft").getContext('2d');

	var data = {
		"pers" : "y"
	};

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			var label;
			$.each(data, function() {
				switch (this.totalBase) {
				case "1":
					label = "통신분야";
					break;
				case "2":
					label = "금융분야";
					break;
				case "3":
					label = "유통분야";
					break;
				case "0":
					label = "기타분야";
					break;
				}
				leftAi = this.totalAi*100;
				leftOriginal = this.totalOriginal*100;
				leftSo = this.totalSo*100;
				leftReal = this.totalReal*100;
			});

			leftChart = new Chart(ctxLeft, {
				type : 'bar',
				data : {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ leftOriginal, leftAi, leftSo, leftReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				},
				options : chartOptions
			});
		},
		error : function(e) {
		}
	});

	var title = document.getElementById('LChartTitle');
	$(title).text("정확도 예측 결과");

}

function loadLeftTab() {
	var data = {
		"pers" : "y"
	};
	var periodData = {
		"pers" : "y",
		"period" : "y"
	};

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/period",
				cache : false,
				processData : true,
				data : periodData,
				async : true,
				success : function(data) {

					var string = new Array();
					string
							.push("<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>");
					$
							.each(
									data,
									function(index, value) {
										string
												.push("<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftPeriod");
										string.push(index);
										string
												.push("-tab' onclick='toggleLeft(2,");
										string.push(this.totalBase);
										string.push(")'>");
										string.push(this.totalBase);
										string.push("년</a></li>");
									});
					var html = string.join('');
					var div1 = document.querySelector('#leftPeriod');
					div1.innerHTML = html;
				},
				error : function(e) {
				}
			});

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/campaign",
				cache : false,
				processData : true,
				data : data,
				async : true,
				success : function(data) {
					var string = new Array();
					string
							.push("<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>");
					$
							.each(
									data,
									function(index, value) {
										string
												.push("<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='leftCampaign");
										string.push(index);
										string
												.push("-tab' onclick='toggleLeft(3,this)'>");
										string.push(this.totalBase);
										string.push("</a></li>");
									});
					var html = string.join('');
					var div1 = document.querySelector('#leftCam');
					div1.innerHTML = html;

				},
				error : function(e) {
				}
			});
}
function loadRightTab() {
	var data;
	var periodData = {
		"period" : "y"
	};

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/type",
				cache : false,
				processData : true,
				data : data,
				async : true,
				success : function(data) {

					var string = new Array(
							"<li role='presentation'><a class='dropdown-header' role='menuitem' data-toggle='tab' tabindex='-1' href='#' onclick='totalRight()'>전체보기</a></li><li role='presentation' class='divider'></li>");
					$
							.each(
									data,
									function(index, value) {
										string
												.push("<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightType");
										string.push(index);
										string
												.push("-tab' onclick='toggleRight(1,");
										string.push(this.totalBase);
										string.push(")'>");
										switch (this.totalBase) {
										case "1":
											string.push("통신분야</a></li>");
											break;
										case "2":
											string.push("금융분야</a></li>");
											break;
										case "3":
											string.push("유통분야</a></li>");
											break;
										case "0":
											string.push("기타분야</a></li>");
											break;
										}
									});
					var html = string.join('');
					var div1 = document.querySelector('#rightType');
					div1.innerHTML = html;
				},
				error : function(e) {
				}
			});

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/period",
				cache : false,
				processData : true,
				data : periodData,
				async : true,
				success : function(data) {

					var string = new Array();
					string
							.push("<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>");
					$
							.each(
									data,
									function(index, value) {
										string
												.push("<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' id='rightPeriod");
										string.push(index);
										string
												.push("-tab' onclick='toggleRight(2,");
										string.push(this.totalBase);
										string.push(")'>");
										string.push(this.totalBase);
										string.push("년</a></li>");
									});
					var html = string.join('');
					var div1 = document.querySelector('#rightPeriod');
					div1.innerHTML = html;

				},
				error : function(e) {
				}
			});

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/campaign",
				cache : false,
				processData : true,
				data : data,
				async : true,
				success : function(data) {
					var string = new Array();
					string
							.push("<li role='presentation'><a class='dropdown-header' role='menuitem' tabindex='-1'>선택하세요</a></li><li role='presentation' class='divider'></li>");
					$
							.each(
									data,
									function(index, value) {
										string
												.push("<li role='presentation'><a role='menuitem' data-toggle='tab' tabindex='-1' href='#' class='rightCampaign' onclick='toggleRight(3, this)'>");
										string.push(this.totalBase);
										string.push("</a></li>");
									});
					var html = string.join('');
					var div1 = document.querySelector('#rightCam');
					div1.innerHTML = html;
				},
				error : function(e) {
				}
			});
}

function initBothChart() {
	var ctxLeft = document.getElementById("chBarLeft").getContext('2d');

	var data = {
		"pers" : "y"
	};

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			var label;
			$.each(data, function() {
				switch (this.totalBase) {
				case "1":
					label = "통신분야";
					break;
				case "2":
					label = "금융분야";
					break;
				case "3":
					label = "유통분야";
					break;
				case "0":
					label = "기타분야";
					break;
				}
				leftAi = this.totalAi*100;
				leftOriginal = this.totalOriginal*100;
				leftSo = this.totalSo*100;
				leftReal = this.totalReal*100;
			});

			leftChart = new Chart(ctxLeft, {
				type : 'bar',
				data : {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ leftOriginal, leftAi, leftSo, leftReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				},
				options : chartOptions
			});
		},
		error : function(e) {
		}
	});

	var title = document.getElementById('LChartTitle');
	var text = "정확도 예측 결과";
	$(title).text(text);

	var ctxRight = document.getElementById("chBarRight").getContext('2d');

	var etc = 3;

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			$.each(data, function() {
				if (this.totalBase != 0) {
					rightAi[this.totalBase-1] = this.totalAi*100;
					rightOriginal[this.totalBase - 1] = this.totalOriginal*100;
					rightSo[this.totalBase - 1] = this.totalSo*100;
					rightReal[this.totalBase - 1] = this.totalReal*100;
				} else if (this.totalBase == 0) {
					rightAi[etc] = this.totalAi*100;
					rightOriginal[etc] = this.totalOriginal*100;
					rightSo[etc] = this.totalSo*100;
					rightReal[etc] = this.totalReal*100;
				}
			});

			rightChart = new Chart(ctxRight, {
				type : 'bar',
				data : {
					labels : types,
					datasets : [ {
						label : '학습전(%)',
						data : rightOriginal,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					}, {
						label : 'AI예측(%)',
						data : rightAi,
						backgroundColor : 'rgba(243, 115, 79, 0.6)',
						borderWidth : 0,
					}, 
					{
						label : 'SO예측(%)',
						data : rightSo,
						backgroundColor : 'rgba(243, 156, 18, 0.6)',
						borderWidth : 0,
					},
					{
						label : '결과(%)',
						data : rightReal,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				},
				options : chartOptions
			});
		},
		error : function(e) {
		}
	});

	var title2 = document.getElementById('RChartTitle');
	$(title).text(text);

}
function initRightChart() {
	var ctxRight = document.getElementById("chBarRight").getContext('2d');

	var etc = 3;

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		async : true,
		success : function(data) {
			$.each(data, function() {
				if (this.totalBase != 0) {
					rightAi[this.totalBase - 1] = this.totalAi*100;
					rightOriginal[this.totalBase - 1] = this.totalOriginal*100;
					rightSo[this.totalBase - 1] = this.totalSo*100;
					rightReal[this.totalBase - 1] = this.totalReal*100;
				} else if (this.totalBase == 0) {
					rightOriginal[etc] = this.totalOriginal*100;
					rightAi[etc] = this.totalAi*100;
					rightSo[etc] = this.totalSo*100;
					rightReal[etc] = this.totalReal*100;
				}
			});

			rightChart = new Chart(ctxRight, {
				type : 'bar',
				data : {
					labels : types,
					datasets : [ {
						label : '학습전(%)',
						data : rightOriginal,
						backgroundColor : 'rgba(81, 152, 255, 0.6)',
						borderWidth : 0,
					},{
						label : 'AI예측(%)',
						data : rightAi,
						backgroundColor : 'rgba(243, 115, 79, 0.6)',
						borderWidth : 0,
					}, 
					{
						label : 'SO예측(%)',
						data : rightSo,
						backgroundColor : 'rgba(243, 156, 18, 0.6)',
						borderWidth : 0,
					}, {
						label : '결과(%)',
						data : rightReal,
						backgroundColor : 'rgba(0, 180, 175, 0.6)',
						borderWidth : 0
					} ]
				},
				options : chartOptions
			});
		},
		error : function(e) {
		}
	});
	var title = document.getElementById('RChartTitle');
	$(title).text("산업군별 정확도 예측 결과");

}

function totalLeft() {
	var data = {
		"pers" : "y"
	};

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			var label;
			$.each(data, function() {
				switch (this.totalBase) {
				case "1":
					label = "통신분야";
					break;
				case "2":
					label = "금융분야";
					break;
				case "3":
					label = "유통분야";
					break;
				case "0":
					label = "기타분야";
					break;
				}
				$('#myBtn').val("나의 산업군별 - " + label + " 예측 결과");
				leftAi = this.totalAi*100;
				leftOriginal = this.totalOriginal*100;
				leftSo = this.totalSo*100;
				leftReal = this.totalReal*100;

				var some_new_data = {
					labels : campaigns,
					datasets : [ {
						label : label,
						data : [ leftOriginal, leftAi, leftSo, leftReal ],
						backgroundColor : chartBGColor,
						borderWidth : 0
					} ]
				};

				leftChart.config.data = some_new_data;
				leftChart.update();
			});
		}
	});

	var title = document.getElementById('LChartTitle');
	$(title).text("정확도 예측 결과");
}

function totalRight() {
	var data;
	$('#totalBtn').val("전체 산업군별 - 예측 결과");

	$.ajax({
		type : "GET",
		url : "/dashboardChart/total",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			getRightType(data);
		},
		error : function(e) {
		}
	});

	var title = document.getElementById('RChartTitle');
	$(title).text("산업군별 정확도 예측 결과");
}

function getLeftType(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftAi = 0;
			leftOriginal = 0;
			leftSo = 0;
			leftReal = 0;
			var label;
			$.each(data, function() {
				switch (this.totalBase) {
				case "1":
					label = "통신분야";
					break;
				case "2":
					label = "금융분야";
					break;
				case "3":
					label = "유통분야";
					break;
				case "0":
					label = "기타분야";
					break;
				}
				leftAi = this.totalAi*100;
				leftOriginal = this.totalOriginal*100;
				leftSo = this.totalSo*100;
				leftReal = this.totalReal*100;
			});
			var some_new_data = {
				labels : campaigns,
				datasets : [ {
					label : label,
					data : [ leftOriginal, leftAi, leftSo, leftReal ],
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
		}
	});
}
function getRightType(data) {
	var etc = 3;

	$.ajax({
		type : "GET",
		url : "/dashboardChart/type",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0 ];
			rightReal = [ 0, 0, 0, 0 ];
			rightAi = [ 0, 0, 0, 0 ];

			$.each(data, function() {

				if (this.totalBase != 0) {
					rightOriginal[this.totalBase - 1] = this.totalOriginal*100;
					rightSo[this.totalBase - 1] = this.totalSo*100;
					rightReal[this.totalBase - 1] = this.totalReal*100;
					rightAi[this.totalBase - 1] = this.totalAi*100;
				} else if (this.totalBase == 0) {
					rightOriginal[etc] = this.totalOriginal*100;
					rightSo[etc] = this.totalSo*100;
					rightReal[etc] = this.totalReal*100;
					rightAi[etc] = this.totalAi*100;
				}
			});
			var some_new_data = {
				labels : types,
				datasets : [ {
					label : '학습전(%)',
					data : rightOriginal,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : 'AI예측(%)',
					data : rightAi,
					backgroundColor : 'rgba(243, 115, 79, 0.6)',
					borderWidth : 0,
				}, {
					label : 'SO예측(%)',
					data : rightSo,
					backgroundColor : 'rgba(243, 156, 18, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : rightReal,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};

			rightChart.config.data = some_new_data;
			rightChart.update();

		},
		error : function(e) {
		}
	});
}

function getLeftPeriod(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			leftAi = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {
				if (this.totalBase != 0) {
					leftOriginal[this.totalBase - 1] = this.totalOriginal*100;
					leftSo[this.totalBase - 1] = this.totalSo*100;
					leftReal[this.totalBase - 1] = this.totalReal*100;
					leftAi[this.totalBase - 1] = this.totalAi*100;
				} else {
					leftOriginal[this.totalBase] = this.totalOriginal*100;
					leftSo[this.totalBase] = this.totalSo*100;
					leftReal[this.totalBase] = this.totalReal*100;
					leftAi[this.totalBase] = this.totalAi*100;
				}
			});
			var some_new_data = {
				labels : periods,
				datasets : [ {
					label : '학습전(%)',
					data : leftOriginal,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				}, {
					label : 'AI예측(%)',
					data : rightAi,
					backgroundColor : 'rgba(243, 115, 79, 0.6)',
					borderWidth : 0,
				}, {
					label : 'SO예측(%)',
					data : leftSo,
					backgroundColor : 'rgba(243, 156, 18, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : leftReal,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};

			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
		}
	});
}
function getRightPeriod(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/period",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightSo = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightReal = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
			rightAi = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];

			$.each(data, function() {
				if (this.totalBase != 0) {
					rightOriginal[this.totalBase - 1] = this.totalOriginal*100;
					rightSo[this.totalBase - 1] = this.totalSo*100;
					rightReal[this.totalBase - 1] = this.totalReal*100;
					rightAi[this.totalBase - 1] = this.totalAi*100;
				} else {
					rightOriginal[this.totalBase] = this.totalOriginal*100;
					rightSo[this.totalBase] = this.totalSo*100;
					rightReal[this.totalBase] = this.totalReal*100;
					rightAi[this.totalBase] = this.totalAi*100;
				}
			});
			var some_new_data = {
				labels : periods,
				datasets : [ {
					label : '학습전(%)',
					data : rightOriginal,
					backgroundColor : 'rgba(81, 152, 255, 0.6)',
					borderWidth : 0,
				},{
					label : 'AI예측(%)',
					data : rightAi,
					backgroundColor : 'rgba(243, 115, 79, 0.6)',
					borderWidth : 0,
				},  {
					label : 'SO예측(%)',
					data : rightSo,
					backgroundColor : 'rgba(243, 156, 18, 0.6)',
					borderWidth : 0,
				}, {
					label : '결과(%)',
					data : rightReal,
					backgroundColor : 'rgba(0, 180, 175, 0.6)',
					borderWidth : 0
				} ]
			};

			rightChart.config.data = some_new_data;
			rightChart.update();

		},
		error : function(e) {
		}
	});
}

function getLeftCampaign(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaign",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			leftOriginal = 0;
			leftSo = 0;
			leftReal = 0;
			leftAi = 0;
			var label;
			$.each(data, function() {
				label = this.totalBase;
				leftOriginal = this.totalOriginal*100;
				leftAi = this.totalAi*100;
				leftSo = this.totalSo*100;
				leftReal = this.totalReal*100;
			});
			var some_new_data = {
				labels : campaigns,
				datasets : [ {
					label : label,
					data : [ leftOriginal, leftAi, leftSo, leftReal ],
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			leftChart.config.data = some_new_data;
			leftChart.update();

		},
		error : function(e) {
		}
	});
}
function getRightCampaign(data) {
	$.ajax({
		type : "GET",
		url : "/dashboardChart/campaign",
		cache : false,
		processData : true,
		data : data,
		async : true,
		success : function(data) {
			rightOriginal = 0;
			rightSo = 0;
			rightReal = 0;
			rightAi = 0;
			var label;
			$.each(data, function() {
				label = this.totalBase;
				rightOriginal = this.totalOriginal*100;
				rightSo = this.totalSo*100;
				rightReal = this.totalReal*100;
				rigthAi = this.totalAi*100;
			});
			var some_new_data = {
				labels : campaigns,
				datasets : [ {
					label : label,
					data : [ rightOriginal, rightAi, rightSo, rightReal ],
					backgroundColor : chartBGColor,
					borderWidth : 0
				} ]
			};

			rightChart.config.data = some_new_data;
			rightChart.update();

		},
		error : function(e) {
		}
	});
}

function toggleLeft(kind, obj) {
	var title = document.getElementById('LChartTitle');
	var myBtn = $('#myBtn');

	var cngTitle = $(obj).text();

	switch (kind) {
	case 1:
		totalLeft();

		break;
	case 2:
		var data = {
			"pers" : "y",
			"periodBase" : obj
		};

		$(title).text(obj + "년 1월 ~ " + obj + "년 12월 통계");
		myBtn.val("나의 기간별 - " + obj + "년 예측 결과");

		getLeftPeriod(data);
		break;
	case 3:
		var data = {
			"pers" : "y",
			"campaign" : cngTitle
		};
		$(title).text("캠페인별 정확도 - " + cngTitle);
		myBtn.val("나의 캠페인별 - " + cngTitle + " 예측 결과");

		getLeftCampaign(data);
		break;
	}
}

function toggleRight(kind, obj) {
	var title = document.getElementById('RChartTitle');
	var totalBtn = $('#totalBtn');
	var cngTitle = $(obj).text();

	switch (kind) {
	case 1:
		var data = {
			"type" : obj
		};

		switch (obj) {
		case 1:
			$(title).text("통신분야 정확도 예측 결과");
			totalBtn.val("전체 산업군별 - 통신분야 예측 결과");
			break;
		case 2:
			$(title).text("금융분야 정확도 예측 결과");
			totalBtn.val("전체 산업군별 - 금융분야 예측 결과");
			break;
		case 3:
			$(title).text("유통분야 정확도 예측 결과");
			totalBtn.val("전체 산업군별 - 유통분야 예측 결과");
			break;
		case 0:
			$(title).text("기타분야 정확도 예측 결과");
			totalBtn.val("전체 산업군별 - 기타분야 예측 결과");
			break;
		}

		getRightType(data);

		break;
	case 2:
		var data = {
			"periodBase" : obj
		};

		$(title).text(obj + "년 1월 ~ " + obj + "년 12월 통계");
		totalBtn.val("전체 기간별 - " + obj + "년 예측 결과");

		getRightPeriod(data);
		break;
	case 3:
		var data = {
			"campaign" : cngTitle
		};
		$(title).text("캠페인별 정확도 - " + cngTitle);
		totalBtn.val("전체 캠페인별 - " + cngTitle + " 예측 결과");
		getRightCampaign(data);
		break;
	}
}

function loadLeftStat() {
	var data = {
		"pers" : "y"
	};

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/total",
				cache : false,
				processData : true,
				data : data,
				async : true,
				success : function(data) {
					var stat = $('#leftStat');

					var totalData = [ data.totalOriginal, data.totalAi, data.totalSo,
							data.totalReal ];

					for (var i = 0; i < 3; i++) {

						if (i % 3 == 1) {
							for (var j = 0; j < 4; j++) {
								stat.find("div span").eq(i + j * 3).text(
										totalData[j]*100 + "%");
							}
						}

						if (i % 3 == 2) {
							for (var j = 0; j < 4; j++) {
								stat.find("div span").eq(i + j * 3).text(
										"(" + data.totalCount + "건)");
							}
						}
					}
				},
				error : function(e) {
				}
			});

}

function loadRightStat() {
	var data;

	$
			.ajax({
				type : "GET",
				url : "/dashboardChart/total",
				cache : false,
				processData : true,
				data : data,
				async : false,
				success : function(data) {
					var stat = $('#rightStat');

					var totalData = [ data.totalOriginal, data.totalAi, data.totalSo,
							data.totalReal ];

					for (var i = 0; i < 3; i++) {

						if (i % 3 == 1) {
							for (var j = 0; j < 4; j++) {
								stat.find("div span").eq(i + j * 3).text(
										totalData[j]*100 + "%");
							}
						}

						if (i % 3 == 2) {
							for (var j = 0; j < 4; j++) {
								stat.find("div span").eq(i + j * 3).text(
										"(" + data.totalCount + "건)");
							}
						}

					}
				},
				error : function(e) {
				}
			});

}