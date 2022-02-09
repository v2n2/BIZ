<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../../include/commonCss.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					공지사항 <small>Notice</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">공지사항</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">공지사항 목록</h3>
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
									<div>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
										<button id='newBtn' type="button"
											class="btn btn-info pull-right"
											onClick='showModal("EDIT", null)'>글쓰기</button>
									</div>
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
																<button id="bthNew" type="submit"
																	class="btn btn-primary editNotice">등록</button>
																<button id="bthDel" type="submit"
																	class="btn btn-danger modNotice"
																	style="margin-left: 5px">삭제</button>
																<button id="bthMod" type="submit"
																	class="btn btn-warning modNotice"
																	style="margin-left: 5px">수정</button>
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
			</section>
	<jsp:include page="../../include/commonJs.jsp" />
	<!-- ChartJS -->
	<script src="/resources/bower_components/Chart.js/Chart.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			nowPages = 1;
			totalPages = 1;
			visiblePages = 5;

			page_st = 1;
			page_end = 5;
			pageSize = 10;

			getPagination();

			// 모달 처리
			$('.modal').on('hidden.bs.modal', function(e) {
				// console.log('modal close');
				$(this).find('form')[0].reset();
			});

			$('.modal').on('shown.bs.modal', function() {
				// console.log('modal open');
			});

			// 게시글 신규 등록
			$("#bthNew").click(function(e) {
				//stop submit the form, we will post it manually.
				e.preventDefault();
				submit_newNotice();
			});

			// 게시글 수정
			$("#bthMod").click(function(e) {
				//stop submit the form, we will post it manually.
				e.preventDefault();
				var title = $('#inputNoticeName');
				if (!(title.attr('readonly'))) {
					submit_modNotice();
				}
				title.attr("readonly", false);
				$("#inputNoticeDesc").attr("readonly", false);
			});

			// 게시글 삭제
			$("#bthDel").click(function(e) {
				//stop submit the form, we will post it manually.
				e.preventDefault();
				var r = confirm("정말 삭제 하시겠습니까?");
				if (r == true) {
					delete_notice();
				} else {
					return;
				}
			});

			// 게시판 조회

		});

		function getPagination() {

			$.get({
				url : '/notice/totalPage',
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

			$.get({
				type : 'GET', // method
				url : '/notice/listPage',
				cache : false,
				data : notice,
				success : function(data) {

					grid_table_notice(data);

				},
				error : function(request, status, error) {
					// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}

		function grid_table_notice(obj) {
			var div = document.querySelector('#ai_notice');
			var html = '';
			$
					.each(
							obj,
							function(i, val) {
								html += '<tr onClick="view_notice(' + val.code
										+ ')">';
								$
										.each(
												val,
												function(k, v) {
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
														html += '<td>' + v
																+ '</td>';
													}
												});
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}

		//글쓰기
		function fn_write() {

			var form = document.getElementById("noticeForm");

			form.action = "<c:url value='/notice/writeForm.do'/>";
			form.submit();

		}

		//글조회
		function fn_view(code) {

			var form = document.getElementById("noticeForm");
			var url = "<c:url value='/notice/list'/>";
			url = url + "?code=" + code;

			form.action = url;
			form.submit();
		}

		//게시글 조회
		function view_notice(code) {
			//console.log('-- view_board -- ', code);

			$.get({
				url : "/notice/detail?code=" + code,
				contentType : 'application/json', // List 컨트롤러는 application/json 형식으로만 처리하기 때문에 컨텐트 타입을 지정해야 합니다.
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

		//게시글 등록
		function submit_newNotice() {
			// console.log('-- submit_newBoard -- ');
			var title = $('#inputNoticeName').val().trim();
			if (!title || title === undefined) {
				alert('게시글 제목을 입력하세요.');
				return;
			}

			// Get form
			var form = $('#newUploadForm')[0];
			var data = new FormData(form);
			$("#bthNew").prop("disabled", true);
			// $("#bthClose").prop("disabled", true);

			$.post({
				type : "POST",
				url : "/notice/insert",
				data : data,
				processData : false, //prevent jQuery from automatically transforming the data into a query string
				contentType : false,
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log("SUCCESS : ", data);
					$("#bthNew").prop("disabled", false);

					var res = data.split('::');
					if (res[0] == "OK") {
						// 게시판 목록 새로고침
						$('#noticeNewModal').modal('hide');
						getPagination();
					}
				},
				error : function(e) {
					alert("error :: " + e.responseText);
					console.log("ERROR : ", e);
					$("#bthNew").prop("disabled", false);
				}
			});
		}
		//게시글 수정
		function submit_modNotice() {
			// console.log('-- submit_newBoard -- ');
			var title = $('#inputNoticeName').val().trim();
			if (!title || title === undefined) {
				alert('게시글 제목을 입력하세요.');
				return;
			}

			// Get form
			var form = $('#newUploadForm')[0];
			var data = new FormData(form);
			$("#bthMod").prop("disabled", true);
			// $("#bthClose").prop("disabled", true);

			$.post({
				url : "/notice/update",
				data : data,
				processData : false, //prevent jQuery from automatically transforming the data into a query string
				contentType : false,
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log("SUCCESS : ", data);
					$("#bthMod").prop("disabled", false);

					var res = data.split('::');
					if (res[0] == "OK") {
						// 게시판 목록 새로고침
						$('#noticeNewModal').modal('hide');
						getPagination();
					}
				},
				error : function(e) {
					alert("error :: " + e.responseText);
					console.log("ERROR : ", e);
					$("#bthMod").prop("disabled", false);
				}
			});
		}

		//게시글 삭제
		function delete_notice() {
			// Get form
			var form = $('#newUploadForm')[0];
			var data = new FormData(form);
			$("#bthDel").prop("disabled", true);

			$.post({
				url : "/notice/delete",
				data : data,
				processData : false, //prevent jQuery from automatically transforming the data into a query string
				contentType : false,
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log("SUCCESS : ", data);
					$("#bthDel").prop("disabled", false);

					var res = data.split('::');
					if (res[0] == "OK") {
						// 게시판 목록 새로고침
						$('#noticeNewModal').modal('hide');
						getPagination();

					}
				},
				error : function(e) {
					alert("error :: " + e.responseText);
					console.log("ERROR : ", e);
					$("#bthDel").prop("disabled", false);
				}
			});
		}

		function showModal(type, data) {
			//console.log('-- showModal -- ', type);
			if (type === 'EDIT') {
				$('#newModalLabel').text('게시글 신규 등록');

				$("#inputNoticeName").attr("readonly", false);

				$("#inputNoticeDesc").attr("readonly", false);

				$('.readNotice').hide();
				$('.modNotice').hide();
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

				if ($("#user_id").val() == d.writer) {
					$(".modNotice").show();
				} else {
					$(".modNotice").hide();
				}
				$('.editNotice').hide();
			}

			$('#noticeNewModal').modal('show');
		}
	</script>
</body>
</html>