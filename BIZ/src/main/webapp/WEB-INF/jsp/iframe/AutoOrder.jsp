<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>캠페인 AI 분석</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- DataTables -->
<link rel="stylesheet"
	href="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
</head>
<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					캠페인 AI 분석 <small>Campaign Analysis</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">캠페인 AI 분석</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">
							AI 분석 진행현황 <span id='id_span_msg' class="label label-success"></span>
						</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<!-- <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"> <i class="fa fa-times"></i></button>-->
						</div>
					</div>
					<div class="box-body">
						<div id="ai_status" class="row">
							<div id='id_loading1' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">1.1 학습데이터</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<h5 id='id_loading1_msg' class="box-title"></h5>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_loading1_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
							</div>
							<!-- /.col -->
							<div id='id_loading2' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-default box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">1.2 대상자데이터</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<h5 id='id_loading2_msg' class="box-title"></h5>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_loading2_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
							<div id='id_pre' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-success box-solid">
									<div class="box-header with-border">
										<h3 class="box-title text-center">2. AI전처리</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<h5 id='id_pre_msg' class="box-title"></h5>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_pre_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
							<div id='id_runf' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-warning box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">3. AI학습</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<h5 id='id_runf_msg' class="box-title"></h5>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_runf_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
							<div id='id_predict' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-danger box-solid">
									<div class="box-header">
										<h3 class="box-title">4. AI예측실행</h3>
									</div>
									<div class="box-body">
										<h5 id='id_predict_msg' class="box-title"></h5>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_predict_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
							<div id='id_real' class="col-md-2.5 col-sm-2 text-center">
								<div class="box box-success box-solid">
									<div class="box-header">
										<h3 class="box-title">5. AI결과</h3>
									</div>
									<div class="box-body">
										<button id='id_real_msg' type="button"
											class="btn btn-info pull-center" data-toggle="modal"
											data-target="#RealDataModal"></button>
									</div>
									<!-- /.box-body -->
									<!-- Loading (remove the following to stop the loading)-->
									<div id='id_real_overlay' class="overlay">
										<i class="fa fa-refresh fa-spin"></i>
									</div>
									<!-- end loading -->
								</div>
								<!-- /.box -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
						<div class="row">
							<table id="ai_campaign"
								class="table table-bordered table-hover text-center"></table>
							<nav aria-label="Page navigation example"
								style="text-align: center;">
								<ul class="pagination-sm" id="pagination"></ul>
							</nav>
						</div>
						<!-- =========================================================== -->
					</div>
					<div class="box-footer">
						<button id='newBtn' type="button" class="btn btn-info pull-right"
							data-toggle="modal" data-target="#newModal">캠페인 신규등록</button>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="newModal" tabindex="-1" role="dialog"
						aria-labelledby="newModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="newModalLabel">캠페인 신규 생성</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- form start -->
									<form class="form-horizontal" id="newUploadForm"
										action="fileUpload" method="post"
										enctype="multipart/form-data">
										<div class="box-body">
											<input type="hidden" id="user_id" name="user_id"
												value=<%=session.getAttribute("sessionID")%>>
											<div class="form-group">
												<label for="inputCamName" class="col-sm-2 control-label">캠페인명</label>
												<div class="col-sm-10">
													<input id="inputCamName" name="inputCamName" type="text"
														class="form-control" placeholder="캠페인명">
												</div>
											</div>
											<div class="form-group">
												<label for="inputCamDesc" class="col-sm-2 control-label">설명</label>
												<div class="col-sm-10">
													<input id="inputCamDesc" name="inputCamDesc" type="text"
														class="form-control" placeholder="설명">
												</div>
											</div>
											<div class="form-group">
												<label for="cam_type" class="col-sm-2 control-label"
													data-toggle="tooltip" title="캠페인 목적">목적</label>
												<div class="col-sm-10">
													<select id="cam_type" name="cam_type"
														class="form-control select2" style="width: 100%;">
														<option selected="selected">Acquisition</option>
														<option>Retention</option>
														<option>Cultivation</option>
														<option>KeepCare</option>
													</select>
												</div>
											</div>
											<input type="hidden" id="cam_autoyn" name="cam_autoyn"
												value="Y">
											<div class="form-group">
												<label for="InputFile_train" class="col-sm-2 control-label">파일
													등록(학습CSV)</label>
												<div class="col-sm-10">
													<input id="InputFile_train" type="file" name="file_train"
														accept=".csv">
												</div>
											</div>
											<div class="form-group">
												<label for="InputFile_test" class="col-sm-2 control-label">파일
													등록(대상CSV)</label>
												<div class="col-sm-10">
													<input id="InputFile_test" type="file" name="file_test"
														accept=".csv">
												</div>
											</div>
										</div>
										<!-- /.box-body -->
										<div class="box-footer">
											<button id="bthNew" type="submit" class="btn btn-primary">등록</button>
											<button id="bthClose" type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
										</div>
										<!-- /.box-footer -->
									</form>
								</div>
								<div class="modal-footer">캠페인등록화면</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!-- 1.1 학습데이터 Modal -->
					<div class="modal fade" id="trainDataModal" tabindex="-1"
						role="dialog" aria-labelledby="trainModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="trainModalLabel">1.1 학습데이터
										미리보기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 학습데이터 상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">학습데이터 상세보기 (최대 100건 만 출력 됩니다.)</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<!-- 
											<div class="col-sm-12">
												<button id="id_getAiStaningTrain" type="button" class="btn btn-info pull-right">전처리전</button> 
											</div>
											-->
													<div class="col-sm-12 text-center">
														<div class="callout callout-info">
															<h4>학습데이터 전처리전</h4>
														</div>
														<!-- campaign table -->
														<table id="ai_staging_train"
															class="table table-bordered table-hover"></table>
														<nav aria-label="Page navigation example"
															style="text-align: center;">
															<ul class="pagination-sm" id="id_Train_pagination"></ul>
														</nav>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.학습데이터 상세보기 -->
								</div>
								<div class="modal-footer">학습데이터 미리보기 화면</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!--1.2 대상자데이터 Modal -->
					<div class="modal fade" id="testDataModal" tabindex="-1"
						role="dialog" aria-labelledby="testModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="testModalLabel">1.2 대상자데이터
										미리보기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 대상자데이터 상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">대상자데이터 상세보기 (최대 100건 만 출력 됩니다.)</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<div class="col-sm-12 text-center">
														<div class="callout callout-info">
															<h4>대상자데이터 전처리전</h4>
														</div>
														<!-- campaign table -->
														<table id="ai_staging_test"
															class="table table-bordered table-hover"></table>
														<nav aria-label="Page navigation example"
															style="text-align: center;">
															<ul class="pagination-sm" id="id_Test_pagination"></ul>
														</nav>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.대상자데이터 상세보기 -->
								</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!--2.AI전처리 데이터 Modal -->
					<div class="modal fade" id="ResultDataModal" tabindex="-1"
						role="dialog" aria-labelledby="ResultDataLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="ResultDataLabel">2.AI전처리 미리보기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 전처리후 상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">전처리데이터 상세보기 (최대 100건 만 출력 됩니다.)</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<div class="col-sm-12">
														<span id='id_msg_result' class="label label-success"></span>
														<button id="id_getAiStTestResult" type="button"
															class="btn btn-info pull-right">대상자데이터전처리후</button>
														<button id="id_getAiStTest" type="button"
															class="btn btn-primary pull-right">대상자데이터전처리전</button>
														<button id="id_getAiStTrainResult" type="button"
															class="btn btn-info pull-right">학습데이터전처리후</button>
														<button id="id_getAiStTrain" type="button"
															class="btn btn-primary pull-right">학습데이터전처리전</button>
													</div>
													<div class="col-sm-12 text-center">
														<!-- campaign table -->
														<table id="ai_staging_result"
															class="table table-bordered table-hover"></table>
														<nav aria-label="Page navigation example"
															style="text-align: center;">
															<ul class="pagination-sm" id="id_result_pagination"></ul>
														</nav>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.전처리후 상세보기 -->
								</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!--3.AI학습(model) Modal -->
					<div class="modal fade" id="ModelDataModal" tabindex="-1"
						role="dialog" aria-labelledby="ModelDataLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="ModelDataLabel">3.AI학습(Model)
										세부정보</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 모델  상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">AI학습 세부정보</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<div class="col-sm-12 text-center">
														<!-- model table -->
														<div class="callout callout-success">
															<h4>AI학습결과 세부 정보</h4>
														</div>
														<table id="ai_model_View"
															class="table table-bordered table-hover"></table>
													</div>
													<div class="col-sm-12 text-center" id="top10Area"
														style="display: none;">
														<!--  <canvas id="modelchart" style="height: 250px;"></canvas>-->
														<div class="callout callout-warning">
															<h4>중요도 TOP10</h4>
														</div>
														<table id="modelchart"
															class="table table-bordered table-hover text-center"></table>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.모델  상세보기 -->
								</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!--4.AI예측실행 Modal -->
					<div class="modal fade" id="PredictDataModal" tabindex="-1"
						role="dialog" aria-labelledby="PredictDataLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="PredictDataLabel">4.AI예측실행세부정보</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 모델  상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">AI예측실행 세부정보 (최대 100건 만 출력 됩니다.)</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<div class="col-sm-12 text-center">
														<div class="callout callout-success">
															<h4>AI 예측 실행 정보</h4>
														</div>
														<div class="col-sm-12 text-center">
															<div class="row">
																<div class="box-body">
																	<div class="row">
																		<div class="col-lg-10 text-left">
																			<label for="pr_succVal" class="control-label"
																				style="margin-left: 12px;">성공확률</label>
																			<!-- select -->
																			<select id="pr_succVal" class="form-control"
																				style="width: 100px; display: inline-block; margin-left: 12px;">
																				<option value='0' selected="selected">0%</option>
																				<option value='10'>10%</option>
																				<option value='30'>30%</option>
																				<option value='50'>50%</option>
																				<option value='70'>70%</option>
																				<option value='100'>100%</option>
																			</select> <label for="pr_totalVal" class="control-label"
																				style="margin-left: 12px;">총 건수</label> <select
																				id="pr_totalVal" class="form-control"
																				style="width: 100px; display: inline-block; margin-left: 12px;">
																				<option value='1'>1만건</option>
																				<option value='3'>3만건</option>
																				<option value='5'>5만건</option>
																				<option value='10'>10만건</option>
																				<option value='0' selected="selected">모두</option>
																			</select>
																		</div>
																		<!-- /.col-lg-6 -->
																		<div class="col-lg-1 text-right">
																			<button id="id_PrDownload" type="button"
																				class="btn btn-info pull-right"
																				onclick="javascript:PrDownload();">
																				<i class="fa fa-download"></i>다운로드
																			</button>
																		</div>
																		<div class="col-lg-1 text-right">
																			<button id="id_PrSearch" type="button"
																				class="btn btn-info pull-right"
																				onclick="javascript:PrSearch();">조회</button>
																		</div>
																		<!-- /.col-lg-6 -->
																	</div>
																</div>
															</div>
															<!-- /.row -->
														</div>
														<div class="col-sm-12 text-center">
															<!-- model table -->
															<table id="ai_TestPredict"
																class="table table-bordered table-hover"></table>
															<nav aria-label="Page navigation example"
																style="text-align: center;">
																<ul class="pagination-sm" id="id_predict_pagination"></ul>
															</nav>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /.모델  상세보기 -->
								</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!--5.AI예측결과 Modal -->
					<div class="modal fade" id="RealDataModal" tabindex="-1"
						role="dialog" aria-labelledby="RealDataLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="RealDataLabel">5.AI예측실행 세부정보</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- 모델  상세보기 -->
									<div id="detailView" class="row">
										<div class="col-xs-12">
											<div class="box">
												<div class="box-header">
													<h3 class="box-title">AI예측실행 세부정보</h3>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<!-- form start -->
													<form class="form-horizontal" id="realUploadForm"
														action="realUploadForm" method="post"
														enctype="multipart/form-data">
														<div class="box-body">
															<input type="hidden" id="cam_id" name="cam_id" value="">
															<input type="hidden" id="user_id" name="user_id"
																value=<%=session.getAttribute("sessionID")%>>
															<div class="form-group">
																<label for="InputFile_train"
																	class="col-sm-2 control-label">실측데이터
																	등록(실측데이터CSV)</label>
																<div class="col-sm-10">
																	<input id="InputFileReal" type="file" name="file_real"
																		accept=".csv">
																</div>
															</div>
														</div>
														<!-- /.box-body -->
														<div class="box-footer text-right">
															<button id="bthReal" type="submit"
																class="btn btn-primary">등록</button>
															<button id="bthRealClose" type="button"
																class="btn btn-secondary" data-dismiss="modal">Close</button>
														</div>
														<!-- /.box-footer -->
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- /.모델  상세보기 -->
								</div>
							</div>
						</div>
					</div>
					<!--/. Modal -->
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</section>
			<!-- /.Main content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- DataTables -->
	<script
		src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- FLOT CHARTS -->
	<script src="/resources/bower_components/Flot/jquery.flot.js"></script>
	<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
	<script src="/resources/bower_components/Flot/jquery.flot.resize.js"></script>
	<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
	<script src="/resources/bower_components/Flot/jquery.flot.pie.js"></script>
	<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
	<script
		src="/resources/bower_components/Flot/jquery.flot.categories.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<!-- AI MAKE JS -->
	<script src="/resources/js/ai_campaign.js"></script>
	<script src="/resources/js/ai_stageing_train.js"></script>
	<script src="/resources/js/ai_stageing_test.js"></script>
	<script src="/resources/js/ai_stageing_result.js"></script>
	<script src="/resources/js/ai_model.js"></script>
	<script src="/resources/js/ai_test_predict.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			campaignPage();
			//AI전처리 초기화
			$('#ResultDataModal').on('hidden.bs.modal', function(e) {
				$('#ai_staging_result').html('');
			});
			//AI학습 초기화
			$('#ModelDataModal').on('hidden.bs.modal', function(e) {
				$('#ai_model_View').html('');
				$('#top10Area').css('display', 'none');
				$('#modelchart').html('');
			});
			//AI예측실행 초기화
			$('#PredictDataModal').on('hidden.bs.modal', function(e) {
				$('#ai_TestPredict').html('');
				$('#pr_succVal').val("0");
				$('#pr_totalVal').val("0");
			});
			//모달 처리(신규).
			$("#bthNew").click(function(event) {
				//stop submit the form, we will post it manually.
				event.preventDefault();
				//alert('클릭 신규~!!');
				submit_newCampagin();
			});
			//모달 처리(Real).
			$("#bthReal").click(function(event) {
				//stop submit the form, we will post it manually.
				event.preventDefault();
				//alert('클릭 Real~!!');
				submitUploadRealData();
			});
			$('#trainDataModal').on('show.bs.modal', function(event) {
				//페이징을 보여준다.
				//alert("페이징을 보여준다. !!");
				var div_t_pageing = $('#id_Train_pagination');
				grid_pagingSt1(div_t_pageing);
				//테이블 을 그린다.
				//alert("테이블을 그린다.. !!");
				search_st1();
			});
			$('#testDataModal').on('show.bs.modal', function(event) {
				//페이징을 보여준다.
				//alert("페이징을 보여준다. !!");
				var div_t_pageing = $('#id_Test_pagination');
				grid_pagingSt2(div_t_pageing);
				//테이블 을 그린다.
				//alert("테이블을 그린다.. !!");
				search_st2();
			});
			$('#ResultDataModal').on('show.bs.modal', function(event) {
				//페이징을 보여준다.
				//alert("2.AI전처리 보여준다. !!");
				var div_t_pageing = $('#id_result_pagination');
				grid_pagingSt3(div_t_pageing);
				//테이블 을 그린다.
				//alert("테이블을 그린다.. !!");
				search_st3();
			});
			$('#ModelDataModal').on('show.bs.modal', function(event) {
				//AI학습 정보를 보여준다.
				//alert("3.AI모델 보여준다. !!");
				get_aiTrainModel();
				//setAiTrainModelChart();
			});
			$('#PredictDataModal').on('show.bs.modal', function(event) {
				//AI예측 실행 정보를 보여준다
				//alert("4.AI예측 보여준다. !!");
				var div_t_pageing = $('#id_predict_pagination');
				grid_pagingSt4(div_t_pageing);
				//테이블 을 그린다.
				//alert("테이블을 그린다.. !! :: " + currentValue);
				search_st4();
			});
			$('#RealDataModal').on('show.bs.modal', function(event) {
				//alert("currentValue :: " + currentValue);
				$('#cam_id').val(currentValue);
				//alert("RealDataModal call!!");	 
			});
			$('#id_getAiStTrain').click(function(event) {
				//alert("id_getAiStTrain click");
				page_no = 1;
				search_st3();
			});
			$('#id_getAiStTest').click(function(event) {
				//alert("id_getAiStTest click");
				page_no = 2;
				search_st3();
			});
			$('#id_getAiStTrainResult').click(function(event) {
				//alert("id_getAiStTrainResult click");
				page_no = 3;
				search_st3();
			});
			$('#id_getAiStTestResult').click(function(event) {
				//alert("id_getAiStTestResult click");
				page_no = 4;
				search_st3();
			});
		});
	</script>
</body>
</html>