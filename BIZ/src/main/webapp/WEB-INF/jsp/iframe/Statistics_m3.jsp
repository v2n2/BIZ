<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI캠페인 실질반응</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					AI캠페인 실질반응 <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">AI캠페인 실질반응</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">검색창</h3>
									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>캠페인명</label> <input type="text" class="form-control"
														id="cam_name" placeholder="캠페인명">
												</div>
											</div>
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>캠페인목적</label> <select id="cam_type"
														class="form-control select2" style="width: 100%;">
														<option selected="selected">ALL</option>
														<option>Acquisition</option>
														<option>Retention</option>
														<option>Cultivation</option>
														<option>KeepCare</option>
													</select>
												</div>
											</div>
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>캠페인상태</label> <select id="cam_status"
														class="form-control select2" style="width: 100%;">
														<option selected="selected">ALL</option>
														<option>시작</option>
														<option>종료</option>
													</select>
												</div>
											</div>
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>생성자</label> <input type="text" class="form-control"
														id="const" disabled>
												</div>
											</div>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<div class="col-sm-10">
													<label for="">기간</label>
													<div class="input-group date">
														<input type="text" class="form-control" id="before_date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control" id="after_date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
													<!-- /.input group -->
												</div>
											</div>
											<!-- /.form group -->
										</div>
									</div>
									<!-- /.row -->
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick="search_statistics();"
										class="btn btn-info pull-right">조회</button>
								</div>
								<!-- /.box-footer -->
								<div id="div_table" class="box-body"></div>
								<!-- /.box-body, 통계 table -->
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-6">
						<!-- BAR CHART -->
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">캠페인별 정확도 예측 결과</h3>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
								</div>
							</div>
							<div class="box-body">
								<div id="bar_parent" class="chart">
									<canvas id="bar_chart" style="height: 270px"></canvas>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
					<!-- RADAR CHART -->
					<div class="col-md-6">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">학습모델별 정확도 예측 결과</h3>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
								</div>
							</div>
							<div class="box-body">
								<div id="radar_parent" class="chart">
									<canvas id="radar_chart" style="height: 270px"></canvas>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- ChartJS에서 퍼센트만 바꾼 clone ChartJS -->
	<script src="/resources/bower_components/chart.js/percent-chart.js"></script>
	<script type="text/javascript">
		!function(a) {
			a.fn.datepicker.dates.kr = {
				days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				titleFormat : "yyyy년 MM" /* Leverages same syntax as 'format' */
			}
		}(jQuery);
		$(function() {
			$("#before_date").css("cursor", "pointer");
			$("#after_date").css("cursor", "pointer");
			$("#before_date").datepicker({
				format : "yyyy-mm-dd",
				language : "kr",
				autoclose : true,
				todayHighlight : true
			}).on('hide', function(e) {
				e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
			});
			$("#after_date").datepicker({
				format : "yyyy-mm-dd",
				language : "kr",
				autoclose : true,
				todayHighlight : true
			}).on('hide', function(e) {
				e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
			});
			$("#const").val("${sessionID}");
			search_statistics(); // 처음에 불러오기
		});
		function Content_Learning() {
			//alert("call Content_Learning!!");
			document.getElementById("main_frame").src = "/Learning/data";
		}
		function search_statistics() {
			$.ajax({
				url : "/statistics/list",
				data : {
					camName : $("#cam_name").val(),
					camType : $("#cam_type").val(),
					camStatus : $("#cam_status").val(),
					beforeDate : $("#before_date").val(),
					afterDate : $("#after_date").val(),
					realAccFlag : true
				},
				success : function(data) {
					createTable(data);
					createChart(data);
				}
			});
		}
		function createTable(arr) {
			// 예측 - 정확도 값(초기화)초
			var tempDiffSoAcc = 0;
			// 결과 - 예측 값(초기화)
			var tempDiffRealAcc = 0;
			var html = "<table id='cam_table' class='table table-bordered table-hover'>";
			html += "<thead><tr><th class='text-center'>캠페인ID</th>";
			html += "<th class='text-center'>캠페인명</th>";
			html += "<th class='text-center'>캠페인 목적</th>";
			html += "<th class='text-center'>캠페인 상태</th>";
			html += "<th class='text-center'>생성자</th>";
			html += "<th class='text-center'>생성일자</th>";
			html += "<th class='text-center'>학습모델</th>";
			html += "<th class='text-center'>예측</th>";
			/* html += "<th class='text-center' colspan='2'>예측</th>"; */
			html += "<th class='text-center' colspan='2'>결과</th></tr></thead><tbody>";
			// 데이터 존재 미존재 여부에 따른 표 표시
			if (arr.length != 0) {
				arr
						.forEach(function(arrVal, arrIdx) {
							html += "<tr>";
							Object
									.getOwnPropertyNames(arr[arrIdx])
									.forEach(
											function(val, idx, array) {
												if ((val == "src_id")
														|| (val == "status_cd")
														|| (val == "created")) {
													html += "<td class='text-center'>"
															+ arr[arrIdx][val]
															+ "</td>";
												} else if ((val == "src_name")
														|| (val == "src_type")
														|| (val == "adm_id")
														|| (val == "trainMethod")) {
													html += "<td>"
															+ arr[arrIdx][val]
															+ "</td>";
												} else if (val == "originalAcc") {
													tempDiffSoAcc = arr[arrIdx][val];
													html += "<td class='text-right'>"
															+ arr[arrIdx][val]
															+ "</td>";
												}/*  else if (val == "soAcc") {
													tempDiffRealAcc = arr[arrIdx][val];
													// 예측 - 정확도 값 비교
													tempDiffSoAcc = arr[arrIdx][val]
															- tempDiffSoAcc;
													if (tempDiffSoAcc >= 5) {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-up text-green'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													} else if (tempDiffSoAcc <= -5) {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-down text-red'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													} else {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-right text-yellow'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													}
												} */ else if (val == "realAcc") {
													// 결과 - 예측 값 비교
													tempDiffRealAcc = arr[arrIdx][val]
															- tempDiffRealAcc;
													if (tempDiffRealAcc >= 5) {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-up text-green'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													} else if (tempDiffRealAcc <= -5) {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-down text-red'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													} else {
														html += "<td class='text-left' style='border-right:hidden;'><i class='fa fa-fw fa-arrow-right text-yellow'></i></td>";
														html += "<td class='text-right'>"
																+ arr[arrIdx][val]
																+ "</td>";
													}
												}
											});
							html += "</tr>";
							// 행마다 다시 초기화
							tempDiffSoAcc = 0;
							tempDiffRealAcc = 0;
						});
			} else {
				html += "<tr><td class='text-center' colspan='13'>조회된 데이터가 없습니다.</td></tr>";
			}
			html += "</tbody></table>";

			$("#div_table").html(html); // innerHtml jquery버전
		}
		function createChart(arr) {
			$
					.ajax({
						url : "/statistics/average",
						data : {
							camName : $("#cam_name").val(),
							camType : $("#cam_type").val(),
							camStatus : $("#cam_status").val(),
							beforeDate : $("#before_date").val(),
							afterDate : $("#after_date").val(),
							realAccFlag : true
						},
						success : function(avgMap) {
							var camNameArr = new Array(); // 캠페인명 배열
							var originalAccArr = new Array(); // 정확도 배열
							var soAccArr = new Array(); // 예측 배열
							var realAccArr = new Array(); // 결과 배열
							var trainMethodArr = new Array(); // 학습모델 배열
							var orgAccAvgArr = new Array(); // 방사형 그래프용 정확도 평균 배열
							var soAccAvgArr = new Array(); // 방사형 그래프용 예측 평균 배열
							var realAccAvgArr = new Array(); // 방사형 그래프용 결과 평균 배열
							for (var i = 0; i < arr.length; i++) {
								camNameArr[i] = arr[i]["src_name"];
								originalAccArr[i] = arr[i]["originalAcc"];
								soAccArr[i] = arr[i]["soAcc"];
								realAccArr[i] = arr[i]["realAcc"];
							}
							// 학습모델 대입
							trainMethodArr.push("DecisionTree");
							trainMethodArr.push("RandomForest");
							/* trainMethodArr.push("svm"); */
							trainMethodArr.push("Deep Neural Network");
							trainMethodArr.push("LogisticRegression");
							// 정확도 배열 대입
							orgAccAvgArr
									.push(avgMap["dTreeVO"]["originalAccAvg"]);
							orgAccAvgArr.push(avgMap["rfVO"]["originalAccAvg"]);
							orgAccAvgArr
									.push(avgMap["dnnVO"]["originalAccAvg"]);
							orgAccAvgArr.push(avgMap["lRVO"]["originalAccAvg"]);
							// 예측 배열 대입
							soAccAvgArr.push(avgMap["dTreeVO"]["soAccAvg"]);
							soAccAvgArr.push(avgMap["rfVO"]["soAccAvg"]);
							soAccAvgArr.push(avgMap["dnnVO"]["soAccAvg"]);
							soAccAvgArr.push(avgMap["lRVO"]["soAccAvg"]);
							// 결과 배열 대입
							/* realAccAvgArr.push(avgMap["dTreeVO"]["realAccAvg"]);
							realAccAvgArr.push(avgMap["rfVO"]["realAccAvg"]);
							realAccAvgArr.push(avgMap["dnnVO"]["realAccAvg"]);
							realAccAvgArr.push(avgMap["lRVO"]["realAccAvg"]); */
							var barChartData = {
								labels : camNameArr,
								datasets : [
										{
											label : '정확도(%)',
											fillColor : 'rgba(205, 102, 0, 1)',
											strokeColor : 'rgba(205, 102, 0, 1)',
											pointColor : 'rgba(205, 102, 0, 1)',
											pointStrokeColor : '#cd6600',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(205, 102, 0, 1)',
											data : originalAccArr
										},
										/* {
											label : '예측(%)',
											fillColor : 'rgba(60,141,188,0.9)',
											strokeColor : 'rgba(60,141,188,0.8)',
											pointColor : '#3b8bba',
											pointStrokeColor : 'rgba(60,141,188,1)',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(60,141,188,1)',
											data : soAccArr
										}, */
										{
											label : '결과(%)',
											fillColor : 'rgba(255,215,0,0.9)',
											strokeColor : 'rgba(255,215,0,0.8)',
											pointColor : '#ffd700',
											pointStrokeColor : 'rgba(255,215,0,1)',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(255,215,0,1)',
											data : realAccArr
										} ]
							};
							var radarChartData = {
								labels : trainMethodArr,
								datasets : [
										{
											label : '정확도(%)',
											fillColor : 'rgba(255, 87, 0, 0.9)',
											strokeColor : 'rgba(255, 87, 0, 0.8)',
											pointColor : 'rgba(255, 87, 0, 1)',
											pointStrokeColor : '#ff5700',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(255, 87, 0, 1)',
											data : orgAccAvgArr
										},
										/* {
											label : '예측(%)',
											fillColor : 'rgba(211, 255, 206, 0.9)',
											strokeColor : 'rgba(211, 255, 206, 0.8)',
											pointColor : '#d3ffce',
											pointStrokeColor : 'rgba(211, 255, 206, 1)',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(211, 255, 206, 1)',
											data : soAccAvgArr
										}, */
										{
											label : '결과(%)',
											fillColor : 'rgba(238, 162, 173, 0.9)',
											strokeColor : 'rgba(238, 162, 173, 0.8)',
											pointColor : '#eea2ad',
											pointStrokeColor : 'rgba(238, 162, 173, 1)',
											pointHighlightFill : '#fff',
											pointHighlightStroke : 'rgba(238, 162, 173, 1)',
											data : realAccAvgArr
										} ]
							};
							//-------------
							//- BAR CHART -
							//-------------
							$("#bar_chart").remove();
							$("#bar_parent")
									.append(
											"<canvas id='bar_chart' style='height:270px'></canvas>");
							var barChartCanvas = $('#bar_chart').get(0)
									.getContext('2d');
							var barChart = new Chart(barChartCanvas);
							barChartData.datasets[1].fillColor = '#00a65a';
							barChartData.datasets[1].strokeColor = '#00a65a';
							barChartData.datasets[1].pointColor = '#00a65a';
							var barChartOptions = {
								//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
								scaleBeginAtZero : true,
								//Boolean - Whether grid lines are shown across the chart
								scaleShowGridLines : true,
								//String - Colour of the grid lines
								scaleGridLineColor : 'rgba(0,0,0,.05)',
								//Number - Width of the grid lines
								scaleGridLineWidth : 1,
								//Boolean - Whether to show horizontal lines (except X axis)
								scaleShowHorizontalLines : true,
								//Boolean - Whether to show vertical lines (except Y axis)
								scaleShowVerticalLines : true,
								//Boolean - If there is a stroke on each bar
								barShowStroke : true,
								//Number - Pixel width of the bar stroke
								barStrokeWidth : 2,
								//Number - Spacing between data sets within X values
								barDatasetSpacing : 1,
								//String - A legend template
								//Boolean - whether to make the chart responsive
								responsive : true,
								maintainAspectRatio : true
							};
							// 그래프 굵기 조정(데이터 갯수에 따라서...)
							if (originalAccArr.length == 1) {
								barChartOptions["barValueSpacing"] = 220;
							} else if ((originalAccArr.length > 1)
									&& (originalAccArr.length <= 3)) {
								barChartOptions["barValueSpacing"] = 100;
							} else if ((originalAccArr.length > 3)
									&& (originalAccArr.length <= 5)) {
								barChartOptions["barValueSpacing"] = 30;
							} else if ((originalAccArr.length > 5)
									&& (originalAccArr.length <= 6)) {
								barChartOptions["barValueSpacing"] = 25;
							} else {
								barChartOptions["barValueSpacing"] = 5;
							}
							barChartOptions.datasetFill = false;
							barChart.Bar(barChartData, barChartOptions);
							//-------------
							//- RADAR CHART -
							//-------------
							$("#radar_chart").remove();
							$("#radar_parent")
									.append(
											"<canvas id='radar_chart' style='height:270px'></canvas>");
							var radarChartCanvas = $('#radar_chart').get(0)
									.getContext('2d');
							var radarChart = new Chart(radarChartCanvas);
							radarChart.Radar(radarChartData, barChartOptions);
						}
					});
		}
	</script>
</body>
</html>