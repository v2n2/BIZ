<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업고객조회</title>
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
					기업고객조회<small>기업</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">기업/인물</li>
					<li class="active">기업고객조회</li>
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
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick="searchEpr()"
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
									기업목록 <small id='id_span_msg'>0건</small>
								</h3>
							</div>
							<!-- /.box-header -->
							<table
								class="table table-bordered table-striped table-hover text-center">
								<thead>
									<tr>
										<th style="width: 10%;text-align: center">기업명</th>
										<th style="width: 5%;text-align: center">대표자명</th>
										<th style="width: 20%;text-align: center">주소</th>
										<th style="width: 8%;text-align: center">법인등록번호</th>
										<th style="width: 8%;text-align: center">사업자등록번호</th>
										<th style="width: 10%;text-align: center">업종</th>
										<th style="width: 5%;text-align: center">담당자</th>
										<th style="width: 10%;text-align: center">등록일자</th>
										<th style="width: 10%;text-align: center">기관우선순위</th>
										<!--<th>조회수</th>-->
									</tr>
								</thead>
								<tbody id="epr_list">
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
							<div class="text-center">
								<ul class="pagination-sm" id="pagination"></ul>
							</div>
							<!-- Button trigger modal -->
							<div class="box-footer">
								<button id='addBtn' type="button"
								class="btn btn-info pull-right"
									onclick="registEpr()">등록</button>
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
	
	var GDS_EPR_LIST = ""; 
		$(document).ready(function() {
			nowPages = 1;
			totalPages = 1;
			visiblePages = 5;

			page_st = 1;
			page_end = 5;
			pageSize = 10;

			getPagination();
		});
		function getPagination() {
			var obj = {};
			
			obj.epr_name = $("input[id='epr_name']")[0].value;
			
			$.get({
				url : '/epr/eprPage',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {
					if (data[0] != "0") {
						totalPages = Math.ceil(data[0] / pageSize);
						grid_pagination(totalPages, visiblePages);

					}else{
						var div = document.querySelector('#epr_list');
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

					searchEpr(page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		//검색 서비스 호출
		function searchEpr(){
			
			
			var obj = {};
			var url = "";
			
			obj.epr_name = $("input[id='epr_name']")[0].value;
			obj.page_st = page_st;
			obj.page_end = page_end;
			url = "/epr/SearchEpr";
			
			transactionPost(url,obj,grid_table_epr)
		}
		//등록화면 이동
		function registEpr(){
			//alert("call Content_NoticeBoard!!");
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/epr/EprRegist";
		}
		
		//상세화면 이동
		function view_epr(epr_no){
			//alert("call Content_NoticeBoard!!");
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/epr/EprView?epr_no="+epr_no;
		}
		//수정로직 추가
		function detail_epr(epr_no){
			//alert("call Content_NoticeBoard!!");
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/epr/EprRegist?epr_no="+epr_no;
		}
		function grid_table_epr(obj) {
			
			GDS_EPR_LIST = obj.eprList;
			var div = document.querySelector('#epr_list');
			var cnt = document.getElementById("id_span_msg");
			cnt.textContent= obj.cnt + "건";
			var html = '';
			$.each(obj.eprList,
							function(i, val) {
								var epr_order_by = isEmpty(val.epr_order_by) ? ' ':val.epr_order_by;
								html += '<tr onClick="view_epr(' + val.epr_no + ')">';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_rep_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_addr	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.biz_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.corp_regist_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_biz_type_cd_nm	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_emp_nm+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + epr_order_by + '</td>';
								html += '</tr>';
							});
			html += '</tbody>';
			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
	</script>
</body>
</html>