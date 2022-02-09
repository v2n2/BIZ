<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
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
					사용자 관리 <small>관리 </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">관리자</li>
					<li class="active">사용자 관리</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box" style="width:49%;float:left;">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">사용자</h3>
									<input type="hidden" id="rgs_emp_id" name="rgs_emp_id"
											value=<%=session.getAttribute("sessionID")%>>
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
													<th style="width: 33%;text-align:center">사번</th>
													<th style="width: 33%;text-align:center">이름</th>
													<th style="width: 33%;text-align:center">조직명</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
											<tbody id="user_list">
											</tbody>
										</table>
										<nav aria-label="Page navigation example"
											style="text-align: center;">
											<ul class="pagination-sm" id="pagination"></ul>
										</nav>
									</form>
								</div>
							</div>
						</div>
						<div class="box" style="width:49%;float:right;">
							<div class="box box-default">
								<div class="box-header with-border">
									<div>
										<h3 class="box-title">상세정보</h3>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<!-- board table -->
									<table class="table">
									    <caption></caption>
									    <colgroup>
									        <col width="10%">
									        <col width="20%">
									        <col width="10%">
									        <col width="20%">
									        <col width="*">
									    </colgroup>
									    <!-- <tr>
									        <th scope="row">
									        	<label for="rpt_name">제목</label>
									        </th>
									        <td colspan="3">
										        <input id="rpt_name" name="rpt_name"
															type="text" class="form-control" placeholder="제목"
															required>
											</td>
									    </tr> -->
									    <tr>
									         <th scope="row">
									         	<label for="emp_no" class="">사원번호</label>
									         </th>
									          <td>
									        	<input id="emp_no" name="emp_no" type="text"
														class="form-control" >
									        </td>
									        <th scope="row">
									        	<label for="emp_password">비밀번호</label>
									        </th>
									        <td>
									        	<input id="emp_password" name="emp_password" type="text"
														class="form-control" >
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="emp_name">사원명</label>
									        </th>
									        <td>
									        	<input id="emp_name" name="emp_name" type="text"
														class="form-control" >
									        </td>
									         <th scope="row">
									         	<label for="dept_name" class="">조직명</label>
									         </th>
									          <td>
									        	<input id="dept_name" name="dept_name" type="text"
														class="form-control" >
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="tel_no">전화번호</label>
									        </th>
									        <td>
									        	<input id="tel_no" name="tel_no" type="text"
														class="form-control" >
									        </td>
									    </tr>
							         </table>
									<%-- <form id="noticeForm" name="noticeForm" method="post">
										<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> <input
											type="hidden" id="boardCode" name="boardCode">
										<div class="form-group">
										<div class="" style="width:calc((100%-400px)/2);float:left;">
											<label for="inputMenuName"
												class="col-sm-2 control-label" style="min-width:72px;">사원명</label>
											<div class="col-sm-10">
												<input id="inputMenuName" name="inputMenuName"
													type="text" class="form-control" placeholder="사원명"
													required>
											</div>
										</div>
										<div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
											<label for="inputMenuNo"
													class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">사원번호</label>
											<div class="col-sm-10">
												<input id="inputMenuNo" name="inputMenuNo"
													type="text" class="form-control" placeholder="사원번호"
													readonly>
											</div>
										</div>
										</div>
										<div class="form-group">
											<div class="" style="width:calc((100%-400px)/2);float:left;">
												<label for="url" class="col-sm-2 control-label" style="min-width:72px;">조직명</label>
												<div class="col-sm-10">
													<input id="url" name="url" type="text"
														class="form-control">
												</div>
											</div>
											 <div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
												<!-- <label for="parMenuNo" class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">상위메뉴</label>
												<div class="col-sm-10">
													<input id="parMenuNo" name="parMenuNo" type="text"
														class="form-control"> -->
												</div>
											</div>
										</form> --%>
									</div>
									<div>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
										
										<button id='delBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:10px;margin-top:10px;"
											onClick='fn_del()'>삭제</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:10px;margin-top:10px;"
											onClick='fn_save()'>저장</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:10px;margin-top:10px;"
											onClick='fn_new()'>추가</button>
									</div>
								</div>
							</div>
						</div>
					</div>
			</section>
	<jsp:include page="../include/commonJs.jsp" />
	<!-- ChartJS -->
	<script src="/resources/bower_components/Chart.js/Chart.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script type="text/javascript">
	var GDS_USER_LIST = "";	
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

			$.get({
				url : '/admin/UserPage',
				async : 'true',
				cache : false,
				success : function(data) {

					if (data[0] != "0") {
						totalPages = Math.ceil(data[0] / pageSize);
						grid_pagination(totalPages, visiblePages);

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

					search_user(page, page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}

		function search_user(now_page, page_st, page_end) {

			// alert("search_campaign call :: now[" + now_page + "] :: interval["
			// +visiblePages +"] :: st[" + page_st + "] :: end[" + page_end + "]" );

			var obj = new Object();
			obj.page_st = page_st;
			obj.page_end = page_end;

			$.get({
				type : 'GET', // method
				url : '/admin/SearchUser',
				cache : false,
				data : obj,
				success : function(data) {
					GDS_USER_LIST = data;
					grid_table_user(data);

				},
				error : function(request, status, error) {
					// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}

		function grid_table_user(obj) {
			var div = document.querySelector('#user_list');
			var html = '';
			$.each(obj, function(i, val) {
								html += '<tr onClick="view_user(' + i + ')">';
								html += '<td style="text-align: center;font-weight:100;">'+ val.emp_no	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.dept_name	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function view_user(i){
			$('#emp_no')[0].value = GDS_USER_LIST[i].emp_no;
			$('#emp_name')[0].value = GDS_USER_LIST[i].emp_name;
			$('#dept_name')[0].value = GDS_USER_LIST[i].dept_name;
			$('#tel_no')[0].value = GDS_USER_LIST[i].tel_no;
			$('#emp_password')[0].value = GDS_USER_LIST[i].emp_password;
			
		}
		
		function fn_new(){
			$('#emp_no')[0].value = '';
			$('#emp_name')[0].value = '';
			$('#dept_name')[0].value = '';
			$('#tel_no')[0].value = '';
			$('#emp_password')[0].value = '';
		}
		
		function fn_save(){
			var obj = {};
			var url = "/admin/InsertUser";
			obj.emp_no = $('#emp_no')[0].value; 
			obj.emp_name = $('#emp_name')[0].value;
			obj.dept_name = $('#dept_name')[0].value;
			obj.tel_no = $('#tel_no')[0].value ;
			obj.emp_password = $('#emp_password')[0].value ;
			obj.rgs_emp_id = $('#rgs_emp_id')[0].value ;
			transactionPost(url,obj,function(){
				alert("저장되었습니다.");
				getPagination();
			});
		}
		function fn_del(){
			var obj = {};
			var url = "/admin/DeleteUser";
			obj.emp_no = $('#emp_no')[0].value;
			
			transactionPost(url,obj,function(){
				alert("삭제되었습니다.");
				fn_new();
				getPagination();
			});
			
		
		}
	</script>
</body>
</html>