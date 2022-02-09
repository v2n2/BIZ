<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업활동일지</title>
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
					영업활동일지<small>영업활동관리</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">영업활동관리</li>
					<li class="active">영업활동일지</li>
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
													<label for="">등록일</label>
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
										<div class="col-md-4">
											<div class="form-group">
												<div class="col-sm-10">
													<label for="">영업일</label>
													<div class="input-group date">
														<input type="text" class="form-control" id="biz_sta_date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control" id="biz_end_date">
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
														<label for="rpt_name">제목</label> <input type="text"
															class="form-control" id="rpt_name" placeholder="제목">
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="rpt_type">유형</label> 
														<select id="rpt_type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">전체</option>
															<option value="default">단순</option>
															<option value="deal">Deal 관련</option>
														</select>
													</div>
												</div>
												<!-- /.form-group -->
											</div>
											<!-- /.col -->
											<!-- /.col -->
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="dept_name">작성부서</label> 
														<select id="dept_name"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">전체</option>
														</select>
													</div>
												</div>
												<!-- /.form-group -->
											</div>
										</div>
										<!-- /.row -->
										<div class="row" style="margin-bottom:10px">
											<div class="col-md-4">
												<div class="form-group">
													<div class="col-sm-10">
														<label for="epr_name">기업명</label> <input type="text"
															class="form-control" id="epr_name" placeholder="기업명">
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
										</div>
										<!-- /.row -->
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick="searchRpt()"
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
									영업활동목록 <small id='id_span_msg'>0건</small>
								</h3>
							</div>
							<!-- /.box-header -->
							<table
								class="table table-bordered table-striped table-hover text-center">
								<thead>
									<tr>
										<th style="width: 10%;text-align: center">등록일자</th>
										<th style="width: 10%;text-align: center">영업일</th>
										<th style="width: 20%;text-align: center">기업명</th>
										<th style="width: 10%;text-align: center">유형</th>
										<th style="width: 20%;text-align: center">제목</th>
										<th style="width: 10%;text-align: center">작성부서</th>
										<th style="width: 10%;text-align: center">작성자</th>
										<!--<th>조회수</th>-->
									</tr>
								</thead>
								<tbody id="rpt_list">
									<!-- <tr>
										<th style="width: 10%;text-align: center;font-weight:100;">2021-06-07</th>
										<th style="width: 10%;text-align: center;font-weight:100;">2021-05-30</th>
										<th style="width: 20%;text-align: center;font-weight:100;">kt ds</th>
										<th style="width: 10%;text-align: center;font-weight:100;">단순</th>
										<th style="width: 20%;text-align: center;font-weight:100;">신규 시스템 구축관련 ktds 협의</th>
										<th style="width: 10%;text-align: center;font-weight:100;">CRM사업팀</th>
										<th style="width: 10%;text-align: center;font-weight:100;">임현빈</th>
										<th>조회수</th>
									</tr> -->
								</tbody>
							</table>
							<nav aria-label="Page navigation example"
								style="text-align: center;">
								<ul class="pagination-sm" id="pagination"></ul>
							</nav>
							<!-- Button trigger modal -->
							<div class="box-footer">
								<button id='addBtn' type="button"
								class="btn btn-info pull-right"
									onclick="registReport()">등록</button>
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
	<script src="/resources/js/common.js"></script>
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
		$("#biz_sta_date").css("cursor", "pointer");
		$("#biz_end_date").css("cursor", "pointer");
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
		$("#biz_sta_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#biz_end_date").datepicker({
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
	var GDS_CAL_RPT = ""; 
		$(document).ready(function() {
			nowPages = 1;
			totalPages = 1;
			visiblePages = 5;

			page_st = 1;
			page_end = 5;
			pageSize = 10;

			getPagination();
		});
		//transactionGet('/login/user','',searchMenu);
		function getPagination() {
			var obj = {};
			var url = "";
			
			obj.before_date = $("input[id='before_date']")[0].value.replaceAll("-","");
			obj.after_date = $("input[id='after_date']")[0].value.replaceAll("-","");
			obj.biz_sta_date = $("input[id='biz_sta_date']")[0].value.replaceAll("-","");
			obj.biz_end_date = $("input[id='biz_end_date']")[0].value.replaceAll("-","");
			obj.rpt_name = $("input[id='rpt_name']")[0].value;
			obj.rpt_type = $("select[id='rpt_type']")[0].value;
			obj.dept_Name = $("select[id='dept_name']")[0].value;
			obj.emp_name = $("input[id='emp_name']")[0].value;
			obj.epr_name = $("input[id='epr_name']")[0].value;
			$.get({
				url : '/CallReport/rptPage',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {

					if (data[0] != "0") {
						totalPages = Math.ceil(data[0] / pageSize);
						grid_pagination(totalPages, visiblePages);

					}else{
						var div = document.querySelector('#deal_list');
						div.innerHTML =""; 
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_pagination(totalPages, visiblePages) {

			$('#pagination').twbsPagination('destroy');
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : visiblePages,
				onPageClick : function(event, page) {
					// alert("on1 " + page + ' (from event listening)');

					page_st = ((1 * pageSize) * page) - (pageSize - 1);
					page_end = (page_st + pageSize) - 1;

					searchRpt(page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		//검색 서비스 호출
		function searchRpt(){
			
			
			var obj = {};
			var url = "";
			
			obj.before_date = $("input[id='before_date']")[0].value.replaceAll("-","");
			obj.after_date = $("input[id='after_date']")[0].value.replaceAll("-","");
			obj.biz_sta_date = $("input[id='biz_sta_date']")[0].value.replaceAll("-","");
			obj.biz_end_date = $("input[id='biz_end_date']")[0].value.replaceAll("-","");
			obj.rpt_name = $("input[id='rpt_name']")[0].value;
			obj.rpt_type = $("select[id='rpt_type']")[0].value;
			obj.dept_Name = $("select[id='dept_name']")[0].value;
			obj.emp_name = $("input[id='emp_name']")[0].value;
			obj.epr_name = $("input[id='epr_name']")[0].value;
			url = "/CallReport/searchRpt";
			
			transactionPost(url,obj,grid_table_rpt)
		}
		//등록화면 이동
		function registReport(){
			//alert("call Content_NoticeBoard!!");
			//debugger;
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/callreport/RegistPage";
		}
		
		//등록화면 이동
		function view_rpt(rpt_no){
			//alert("call Content_NoticeBoard!!");
			//debugger;
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/callreport/RegistPage?rpt_no="+rpt_no;
		}
		function grid_table_rpt(obj) {
			
			GDS_CAL_RPT = obj.calList;
			var div = document.querySelector('#rpt_list');
			var cnt = document.getElementById("id_span_msg");
			cnt.textContent= obj.cnt + "건";
			var html = '';
			$.each(obj.calList,
							function(i, val) {
								html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.biz_dt	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.rpt_type_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.rpt_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.dept_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_name+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';
			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
	</script>
</body>
</html>