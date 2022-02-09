<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deal 원장</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- DataTables -->
<link rel="stylesheet"
	href="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Deal 원장<small>Deal</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Deal</li>
					<li class="active">Deal 원장</li>
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
									<div class="row" style="margin-bottom:10px">
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
									<div class="row" style="margin-bottom:10px">
										<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="name">Deal원장</label> <input type="text"
															class="form-control" id="name" placeholder="제목">
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="name">Deal번호</label> <input type="text"
															class="form-control" id="name" placeholder="번호">
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="type">영업구분</label> 
														<select id="type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">전체</option>
															<option value="HS">회사채</option>
															<option value="FN">증자</option>
															<option value="IP">IPO</option>
															<option value="AD">Advisory</option>
															<option value="DK">대체투자-국내</option>
															<option value="DF">대체투자-해외</option>
															<option value="GK">구조화금융-국내</option>
															<option value="GF">구조화금융-해외</option>
															<option value="BK">부동산금융-국내</option>
															<option value="BF">부동산금융-해외</option>
															<option value="LO">Loan</option>
															<option value="ET">기타</option>
														</select>
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
										</div>
										<!-- /.row -->
										<div class="row" style="margin-bottom:10px">
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="corpName">기업명</label> <input type="text"
															class="form-control" id="corpName" placeholder="기업명">
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label>작성자</label> <input type="text" class="form-control"
															id="emp_name">
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
											<!-- /.col -->
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="type">작성부서</label> <select id="type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">전체</option>
														</select>
													</div>
												</div>
												<!-- /.form-group -->
											</div>
										</div>
										<!-- /.row -->
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick=""
										class="btn btn-info pull-right">검색</button>
								</div>
							</div>
						</div>
						<!-- /.box -->
					</div>
				<!-- /.Search -->
				<!-- 캠페인목록 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									Deal 원장목록 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<!-- /.box-header -->
							<table
								class="table table-bordered table-striped table-hover text-center">
								<thead>
									<tr>
										<th style="width: 10%;text-align: center">Deal번호</th>
										<th style="width: 15%;text-align: center">기업명</th>
										<th style="width: 10%;text-align: center">영업구분</th>
										<th style="width: 15%;text-align: center">Deal원장</th>
										<th style="width: 10%;text-align: center">작성부서</th>
										<th style="width: 10%;text-align: center">작성자</th>
										<th style="width: 10%;text-align: center">작성일자</th>
										<!--<th>조회수</th>-->
									</tr>
								</thead>
								<tbody id="deal_list">
									 <tr onClick="view_deal()">
										<th style="width: 10%;text-align: center;font-weight:100;">0000001</th>
										<th style="width: 15%;text-align: center;font-weight:100;">ktds</th>
										<th style="width: 10%;text-align: center;font-weight:100;">회사채</th>
										<th style="width: 15%;text-align: center;font-weight:100;">ktds회사채원장</th>
										<th style="width: 10%;text-align: center;font-weight:100;">CRM사업팀</th>
										<th style="width: 10%;text-align: center;font-weight:100;">임현빈</th>
										<th style="width: 10%;text-align: center;font-weight:100;">2021-07-01</th>
									</tr>
								</tbody>
								</table>
							<div class="text-center">
								<ul class="pagination-sm" id="pagination_cam"></ul>
							</div>
							<!-- Button trigger modal -->
							<div class="box-footer">
								<button id='addBtn' type="button"
								class="btn btn-info pull-right"
									onclick="registLgr()">등록</button>
								&nbsp;
							</div> 
						</div>
					</div>
				</div>
				<!-- /.캠페인목록 -->
			</section>
			<!-- /.Main content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- DataTables -->
	<script
		src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- AI_CAMPAIGN JS -->
	<script src="/resources/js/ai_campaign.js"></script>
	<script src="/resources/js/ai_stageing_test.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
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
		//search_statistics(); // 처음에 불러오기
	});
		$(document).ready(function() {
			//자동 CallReport 검색
			/* $("#adm_name").val("${sessionID}");
			//campaignPage();
			newCampaignPage();
			//모달 처리(신규).
			$("#bthAdd").click(function(event) {
				//stop submit the form, we will post it manually.
				event.preventDefault();
				//alert('클릭 신규~!!');
				submit_addStagingTest();
			});
			$('#addModal').on('show.bs.modal', function(event) {
				//alert("currentValue :: " + currentValue);
				$('#inputCamId').val(currentValue);
				//alert("RealDataModal call!!");	 
			}); */
		});
		//등록화면 이동
		function registLgr(){
			//alert("call Content_NoticeBoard!!");
			//debugger;
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/deal/DealLedgerRegist";
		}
		function grid_table_notice(obj) {
			var div = document.querySelector('#deal_list');
			var html = '';
			$.each(obj, function(i, val) {
										html += '<tr onClick="view_deal(' + val.deal_lgr_no + ')">';
										html += '<td style="text-align: center;font-weight:100;">' + val.deal_no	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.epr_name	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.biz_type_nm	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.deal_lgr_name	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.dept_name	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.bse_emp_name	+ '</td>';
										html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function view_deal(){
			parent.document.getElementById("main_frame").src = "/deal/DealLedgerRegist";
		}
		function detail_deal(deal_lgr_no){
			parent.document.getElementById("main_frame").src = "/deal/DealLedgerRegist?deal_lgr_no="+deal_lgr_no;
		}
	</script>
</body>
</html>