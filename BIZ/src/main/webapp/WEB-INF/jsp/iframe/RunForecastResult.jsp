<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AI선정결과</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- Select2 -->
<link rel="stylesheet"
	href="/resources/bower_components/select2/dist/css/select2.min.css">
 </head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					AI선정결과 <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">AI선정결과</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Search -->
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
											<!-- /.form-group -->
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>캠페인목적</label> <select id="cam_type"
														class="form-control select2" style="width: 100%;"
														data-placeholder="Acquisition">
														<option selected="selected">ALL</option>
														<option>Acquisition</option>
														<option>Retention</option>
														<option>Cultivation</option>
														<option>KeepCare</option>
													</select>
												</div>
											</div>
											<!-- /.form-group -->
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>캠페인상태</label> <select id="cam_status"
														class="form-control select2" style="width: 100%;"
														data-placeholder="캠페인상태">
														<option selected="selected">ALL</option>
														<option>시작</option>
														<option>종료</option>
													</select>
												</div>
											</div>
											<!-- /.form-group -->
										</div>
										<!-- /.col -->
										<div class="col-md-3">
											<div class="form-group">
												<div class="col-sm-10">
													<label>생성자</label> <input type="text" class="form-control"
														id="adm_name" disabled>
												</div>
											</div>
											<!-- /.form-group -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick="newCampaignPage();"
										class="btn btn-info pull-right">검색</button>
								</div>
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- /.Search -->
				<!-- 캠페인목록 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									캠페인 목록 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<!-- /.box-header -->
							<div id="div_campaign" class="box-body"></div>
							<div class="text-center">
								<ul class="pagination-sm" id="pagination_cam"></ul>
							</div>
						</div>
					</div>
				</div>
				<!-- /.캠페인목록 -->
				<!-- 모델목록 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									학습 결과 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<div id="div_model" class="box-body"></div>
						</div>
					</div>
				</div>
				<!-- /.모델목록 -->
				<!-- 예측 결과 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									예측 결과 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<div class="box-body">
								<div class="row">
									<!-- <div class="col-lg-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-btn">
													<button type="button" class="btn btn-info">성공률</button>
												</div>
												/btn-group
												<select id="succ_rate" class="form-control select2"
													style="width: 60%;">
													<option value="0" selected="selected">0%</option>
													<option value="0.1">10%</option>
													<option value="0.3">30%</option>
													<option value="0.5">50%</option>
													<option value="0.7">70%</option>
													<option value="1">100%</option>
												</select>
											</div>
											/input-group
										</div>
										/form-group
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-btn">
													<button type="button" class="btn btn-info">추출건수</button>
												</div>
												/btn-group
												<select id="extract" class="form-control select2"
													style="width: 60%;">
													<option value="10000">1만건</option>
													<option value="30000">3만건</option>
													<option value="50000">5만건</option>
													<option value="100000">10만건</option>
													<option value="0" selected="selected">모두</option>
												</select>
											</div>
											/input-group
										</div>
									</div> -->
									<div class="col-lg-6">
										<div class="input-group pull-right">
											<button id="ml" type="button" class="btn btn-info"
												data-toggle="modal" data-target="#modal_down"
												style="margin-right: 10px;" onclick="setPath(this.id)">ML 다운로드</button>
											<button id="dl" type="button" class="btn btn-info"
												data-toggle="modal" data-target="#modal_down"
												style="margin-right: 10px;" onclick="setPath(this.id)">DL 다운로드</button>
											<button type="button" class="btn btn-info"
												data-toggle="modal" data-target="#modal_up"
												style="margin-right: 10px;">캠페인 결과 등록</button>
											<input type="hidden" id="path" name="path" />
										</div>
									</div>
								</div>
							</div>
							<div id="div_predict" class="box-body"></div>
							<div class="text-center">
								<ul class="pagination-sm" id="pagination_predict"></ul>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="modal_up">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<!-- form start -->
								<form class="form-horizontal" id="real_upload_form"
									action="real_upload_form" method="post"
									enctype="multipart/form-data">
									<div class="box-body">
										<input type="hidden" id="cam_id" name="cam_id" value="">
										<input type="hidden" id="user_id" name="user_id"
											value="${sessionID}">
										<p>실측데이터 등록(실측데이터CSV)</p>
										<div class="form-group">
											<div class="col-sm-10">
												<input id="input_file" type="file" name="file_real"
													accept=".csv">
											</div>
										</div>
									</div>
									<!-- /.box-body -->
									<div class="box-footer text-right">
										<button id="bth_register" type="submit"
											class="btn btn-primary" onclick="submitUploadCSV();">등록</button>
										<button id="bth_close" type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
									<!-- /.box-footer -->
								</form>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<div class="modal fade" id="modal_down">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<p>정말 다운로드 하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button id="down" type="button" class="btn btn-primary"
									onclick="csvDown();">다운로드</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<div class="modal fade" id="modal_no_data">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<p>조회된 데이터가 없습니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">확인</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<div class="modal fade" id="modal_no_down">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<p>다운로드할 데이터가 없습니다.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">확인</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</section>
			<!-- /.Main content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- Select2 -->
	<script
		src="/resources/bower_components/select2/dist/js/select2.full.min.js"></script>
	<!-- DataTables -->
	<script
		src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<script src="/resources/js/jquery.fileDownload.js"></script>
	<!-- AI MAKE JS -->
	<script src="/resources/js/ai_predict_result.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#adm_name").val("${sessionID}");
			newCampaignPage();
		});
	</script>
</body>
</html>