<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- Select2 -->
<link rel="stylesheet"
	href="/resources/bower_components/select2/dist/css/select2.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>
#ds_campaign {
	border-collapse: collapse;
}

.btn-bg-mint {
	color: #fff;
	background-color: #78C2AD;
	border-color: #78C2AD;
}

.box-minty {
	border-top-color: #78C2AD;
}

#ds_campaign td, #ds_campaign th {
	padding: 20px;
}

#ds_campaign th {
	background-color: #ccc;
}

#ds_campaign tr.selected {
	background-color: navy;
	color: #fff;
	font-weight: bold;
}

.myAlert {
	position: relative;
	padding: 0.75rem 1.25rem;
	margin-bottom: 1rem;
	border: 1px solid transparent;
	border-radius: 0.4rem;
	padding-right: 4rem;
	color: #38656f;
	background-color: #e2f3f7;
	border-color: #d6eef3;
}

.text-pink {
	color: #F3734F;
}

.text-blue {
	color: #5198FF;
}

.text-green {
	color: #00B4AF;
}

.chart-container {
	position: relative;
	margin: auto;
	height: auto;
	width: 100%;
}
.img-arrow{
	max-width: 100%;
	min-width: 70%;
  	height: auto;
}

.img-arrow2{
	max-hight: 70%;
	min-hight: 50%;
  	wight: auto;
  	margin-bottom: 20px;
}
.col-arrow{
 width:1%; 
 padding-top:8px;
 float:left;
 display: none;
 
}

.col-sm-2-1{

  position: relative;

  min-height: 1px;

  padding-left: 1%;

  padding-right: 1%;

}
.col-arrow2{
		display: inline;
	}

@media (min-width: 768px){

	.col-sm-2-1{

	    width: 15.824%;

	    float:left;

	}
	.col-arrow{
		display: inline;
	}
	.img-arrow2{
		display: none;
	}

}

</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Dashboard <small id="session">Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
			<!-- 공지사항 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">공지사항</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<form id="noticeForm" name="noticeForm" method="post">
										<table
											class="table table-bordered table-striped table-hover text-center">
											<thead>
												<tr>
													<th style="width: 70px">번호</th>
													<th style="width: 65%">제목</th>
													<th style="width: 100px">작성자</th>
													<th style="width: 100px">날짜</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
											<tbody id="ai_notice">
										</table>
										<nav aria-label="Page navigation example"
											style="text-align: center;">
											<ul class="pagination-sm" id="pagination"></ul>
										</nav>
									</form>
									<!-- Modal -->
									<div class="modal fade" id="noticeNewModal" tabindex="-1"
										role="dialog" aria-labelledby="newModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<div class="row">
														<div class="col-xs-10">
															<h5 class="modal-title" id="newModalLabel">게시글 신규 등록</h5>
														</div>
														<div class="col-xs-2">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
													</div>
												</div>
												<div class="modal-body">
													<!-- form start -->
													<form class="form-horizontal" id="newUploadForm"
														action="/notice/insert" method="post">
														<div class="box-body">
															<input type="hidden" id="user_id" name="user_id"
																value=<%=session.getAttribute("sessionID")%>> <input
																type="hidden" id="noticeCode" name="noticeCode">
															<div class="form-group">
																<label for="inputNoticeName"
																	class="col-sm-2 control-label">제목</label>
																<div class="col-sm-10">
																	<input id="inputNoticeName" name="inputNoticeName"
																		type="text" class="form-control" placeholder="제목"
																		required>
																</div>
															</div>
															<div class="form-group readNotice">
																<label for="noticeDate" class="col-sm-2 control-label">등록일</label>
																<div class="col-sm-10">
																	<input id="noticeDate" name="noticeDate" type="text"
																		class="form-control" readonly>
																</div>
															</div>
															<div class="form-group readNotice">
																<label for="noticeWriter" class="col-sm-2 control-label">작성자</label>
																<div class="col-sm-10">
																	<input id="noticeWriter" name="noticeWriter"
																		type="text" class="form-control" readonly>
																</div>
															</div>
															<div class="form-group">
																<label for="inputNoticeDesc"
																	class="col-sm-2 control-label">내용</label>
																<div class="col-sm-10">
																	<textarea id="inputNoticeDesc" name="inputNoticeDesc"
																		class="form-control" rows="10" placeholder="내용"
																		style="resize: none;"></textarea>
																</div>
															</div>
															<!-- TODO: 첨부파일 등록 -->
															<!--
												<div class="form-group">
													<label for="InputFile_csv" class="col-sm-2 control-label">파일 등록(CSV)</label>
													<div class="col-sm-10">
														<input id="InputFile_csv" type="file" name="file_board" accept=".csv">
													</div>
												</div>
												-->
														</div>
														<!-- /.box-body -->
														<div class="box-footer">
															<div class='row pull-right' style='margin-right: 3px'>
																<button id="bthClose" type="button"
																	class="btn btn-secondary" data-dismiss="modal"
																	style="margin-left: 5px">돌아가기</button>
															</div>
														</div>
														<!-- /.box-footer -->
													</form>
												</div>
											</div>
										</div>
									</div>
									<!--/. Modal -->
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="row">
						<!-- Default box -->
						<div class="box">
							<div class="box-header">
								<h4 class="box-title">
									캠페인 AI 분석 프로세스<small> 흐름도</small>
								</h4>
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse" data-toggle="tooltip" title="Collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove" data-toggle="tooltip" title="Remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">
								<div id="ai_status" class="row">
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">1.1 학습데이터 등록</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button id='id_loading1_msg' type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">1.2 예측 데이터 등록</h3>
											</div>
											<!-- /.box-header -->

											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">2. AI 전처리 수행</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button id='id_pre_msg' type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">3. AI학습 수행</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">4. AI 예측실행</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
											
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid">
											<div class="box-header with-border">
												<h3 class="box-title">5. AI 결과</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
									</div>
									<!-- /.col -->
									<div class="row">
										 <div class="box-footer"> 
											<button id='newBtn' type="button" class="btn btn-info pull-right"
												onclick="location.href='/iframe/AutoOrder'">신규 캠페인
												등록하기</button>
												<!-- <button id='newBtn' type="button" class="btn btn-info"
												data-toggle="modal" data-target="#newModal">캠페인 신규등록</button> -->
										 </div> 
									</div>
								</div>
								<!-- /.row -->
							</div>
						</div>
					</div>
				<!-- 통계 -->
				<div class="row">
					<!-- Default box -->
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">현황</h4>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse" data-toggle="tooltip" title="Collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove" data-toggle="tooltip" title="Remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<!-- left -->
							<div class="col-md-6">
								<!-- 나의 현황 -->
								<div class="row" style="margin-bottom: 30px; margin-top: 10px;">
									<div class="col-md-12">
										<form>
											<input type="button"
												class="btn btn-block btn-bg-mint btn-lg disabled" id="myBtn"
												value="나의 현황">
										</form>
									</div>
								</div>
								<c:if test="${sessionCAMCNT > 0}">
									<ul id="leftTab" class="nav nav-tabs" role="tablist">
										<li class="nav-item active"><a class="nav-link active"
											data-toggle="tab" role="tab" id="myTabDrop0"
											onclick="totalLeft()">나의전체 </a></li>
										<li role="presentation" class="dropdown"><a
											data-target="" id="myTabDrop1" class="dropdown-toggle"
											data-toggle="dropdown" aria-controls="myTabDrop1-contents">기간별
												<span class="caret"></span>
										</a>
											<ul class="dropdown-menu" role="menu"
												aria-labelledby="myTabDrop1" id="leftPeriod">
											</ul></li>
										<li role="presentation" class="dropdown"><a
											data-target="" id="myTabDrop2" class="dropdown-toggle"
											data-toggle="dropdown" aria-controls="myTabDrop2-contents">캠페인별
												<span class="caret"></span>
										</a>
											<ul class="dropdown-menu" role="menu"
												aria-labelledby="myTabDrop2" id="leftCam">
											</ul></li>
									</ul>
									<div id="myTabContent" class="tab-content">
										<div role="tabpanel" class="tab-pane fade active in"
											id="dropdown0">
											<!-- 		<p>0번입니다</p> -->
											<!-- Info boxes -->
											<!-- BAR CHART -->
											<div class="box box-minty">
												<div class="box-header with-border text-center">
													<h3 class="box-title" id="LChartTitle">나의 캠페인 전체</h3>
												</div>
												<div class="box-body">
													<div class="chart-container">
														<canvas id="chBarLeft"></canvas>
													</div>
												</div>
											</div>
										</div>
										<!-- /.chart -->
									</div>
									<!-- Tabs -->
									<div class="row" id="leftStat">
										<div class="col-md-3 col-sm-6 col-xs-12">
											<div class="info-box">
												<span class="info-box-text text-center text-light-blue">학습전</span>
												<span class="info-box-number text-center text-light-blue">0%</span>
												<span class="info-box-text text-center text-light-blue">(0건)</span>
											</div>
											<!-- /.info-box -->
										</div>
										<!-- /.col -->
										<div class="col-md-3 col-sm-6 col-xs-12">
											<div class="info-box">
												<span class="info-box-text text-center text-pink">AI예측</span>
												<span class="info-box-number text-center text-pink">0%</span>
												<span class="info-box-text text-center text-pink">(0건)</span>
											</div>
											<!-- /.info-box -->
										</div>
										<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="info-box">
											<span class="info-box-text text-center text-yellow">SO예측</span> <span
												class="info-box-number text-center text-yellow">0%</span> <span
												class="info-box-text text-center text-yellow">(0건)</span>
										</div>
										<!-- /.info-box -->
									</div>
										<!-- /.col -->
										<!-- fix for small devices only -->
										<div class="clearfix visible-sm-block"></div>
										<div class="col-md-3 col-sm-6 col-xs-12">
											<div class="info-box">
												<span class="info-box-text text-center text-green">결과</span>
												<span class="info-box-number text-center text-green">0%</span>
												<span class="info-box-text text-center text-green">(0건)</span>
											</div>
											<!-- /.info-box -->
										</div>
									</div>
									<!-- /.box -->
								</c:if>
								<div>
									<c:if test="${sessionCAMCNT <= 0}">
										<button type="button" class="btn btn-default btn-block"
											onclick="location.href='/iframe/AutoOrder'">
											<strong>${sessionNAME }님 </strong> 현재 등록된 캠페인이 없습니다 <small>(클릭하여
												등록하기)</small>
										</button>
									</c:if>
								</div>
							</div>
							<!-- right -->
							<div class="col-md-6">
								<!-- 전체 현황 -->
								<div class="row" style="margin-bottom: 30px; margin-top: 10px;">
									<div class="col-md-12">
										<form>
											<input type="button" id="totalBtn"
												class="btn btn-block btn-primary btn-lg disabled"
												value="전체 현황">
										</form>
									</div>
								</div>
								<ul id="RightTab" class="nav nav-tabs" role="tablist">
									<li role="presentation" class="dropdown"><a
										data-target="" id="myTabDrop3" class="dropdown-toggle"
										data-toggle="dropdown" aria-controls="myTabDrop3-contents">산업군별<span
											class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="myTabDrop3" id="rightType">
										</ul></li>
									<li role="presentation" class="dropdown"><a
										data-target="" id="myTabDrop4" class="dropdown-toggle"
										data-toggle="dropdown" aria-controls="myTabDrop4-contents">기간별
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="myTabDrop4" id="rightPeriod">
										</ul></li>
									<li role="presentation" class="dropdown"><a
										data-target="" id="myTabDrop5" class="dropdown-toggle"
										data-toggle="dropdown" aria-controls="myTabDrop5-contents">캠페인별
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="myTabDrop5" id="rightCam">
										</ul></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div role="tabpanel" class="tab-pane fade active in"
										id="dropdown1" aria-labelledby="dropdown1-tab">
										<!-- 		<p>5번입니다</p> -->
										<!-- Info boxes -->
										<!-- BAR CHART -->
										<div class="box box-primary">
											<div class="box-header with-border text-center">
												<h3 class="box-title" id="RChartTitle">캠페인 전체</h3>
											</div>
											<div class="box-body">
												<div class="chart-container">
													<canvas id="chBarRight"></canvas>
												</div>
											</div>
										</div>
									</div>
									<!-- /.chart -->
								</div>
								<!-- Tabs -->
								<div class="row" id="rightStat">
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="info-box">
											<span class="info-box-text text-center text-blue">학습전</span> <span
												class="info-box-number text-center text-blue">0%</span> <span
												class="info-box-text text-center text-blue">(0건)</span>
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="info-box">
											<span class="info-box-text text-center text-pink">AI예측</span> <span
												class="info-box-number text-center text-pink">0%</span> <span
												class="info-box-text text-center text-pink">(0건)</span>
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="info-box">
											<span class="info-box-text text-center text-yellow">SO예측</span> <span
												class="info-box-number text-center text-yellow">0%</span> <span
												class="info-box-text text-center text-yellow">(0건)</span>
										</div>
										<!-- /.info-box -->
									</div>
									<!-- /.col -->
									<!-- fix for small devices only -->
									<div class="clearfix visible-sm-block"></div>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="info-box">
											<span class="info-box-text text-center text-green">결과</span>
											<span class="info-box-number text-center text-green">0%</span>
											<span class="info-box-text text-center text-green">(0건)</span>
										</div>
										<!-- /.info-box -->
									</div>
								</div>
							</div>
							<!-- ~right -->
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.row -->
					
			</section>
			<!-- /.Main content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- ChartJS -->
	<script src="/resources/bower_components/chart.js/Chart.js"></script>
	<!-- MDB charts ADD -->
	<script src="/resources/js/chart.js"></script>
	<!-- MDB charts ADD -->
	<script
		src="/resources/adminLTE/chart.js/plugin/chartjs-plugin-datalabels.js"></script>
	<script
		src="/resources/adminLTE/chart.js/plugin/chartjs-plugin-datalabels.min.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<!-- AI MAKE JS -->
	<script src="/resources/js/dashboardChart.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// 게시판 조회
			getPagination();
			var leftTab = document.getElementById("leftTab");
			if (leftTab != null) {
				initLeftChart();
				loadLeftStat();
			}
			initRightChart();
			loadRightStat();

			if (leftTab != null) {
				loadLeftTab();
			}
			loadRightTab();
			
			$('.dropdown-toggle').dropdown()

			
			// 모달 처리
			$('.modal').on('hidden.bs.modal', function(e) {
				// console.log('modal close');
				$(this).find('form')[0].reset();
			});

			$('.modal').on('shown.bs.modal', function() {
				// console.log('modal open');
			});

		});
	</script>
</body>
</html>