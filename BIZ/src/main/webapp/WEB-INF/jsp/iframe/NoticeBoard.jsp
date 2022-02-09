<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<meta charset="UTF-8">
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
					게시판(Q&A) <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">게시판(Q&A)</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">게시글 목록</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<form id="boardForm" name="boardForm" method="post">
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
											<tbody id="ai_board">
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
									<div class="modal fade" id="boardNewModal" tabindex="-1"
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
														action="/board/insert" method="post">
														<div class="box-body">
															<input type="hidden" id="user_id" name="user_id"
																value=<%=session.getAttribute("sessionID")%>> <input
																type="hidden" id="boardCode" name="boardCode">
															<div class="form-group">
																<label for="inputBoardName"
																	class="col-sm-2 control-label">제목</label>
																<div class="col-sm-10">
																	<input id="inputBoardName" name="inputBoardName"
																		type="text" class="form-control" placeholder="제목"
																		required>
																</div>
															</div>
															<div class="form-group readBoard">
																<label for="boardDate" class="col-sm-2 control-label">등록일</label>
																<div class="col-sm-10">
																	<input id="boardDate" name="boardDate" type="text"
																		class="form-control" readonly>
																</div>
															</div>
															<div class="form-group readBoard">
																<label for="boardWriter" class="col-sm-2 control-label">작성자</label>
																<div class="col-sm-10">
																	<input id="boardWriter" name="boardWriter" type="text"
																		class="form-control" readonly>
																</div>
															</div>
															<div class="form-group">
																<label for="inputBoardDesc"
																	class="col-sm-2 control-label">내용</label>
																<div class="col-sm-10">
																	<textarea id="inputBoardDesc" name="inputBoardDesc"
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
																	class="btn btn-primary editBoard">등록</button>
																<button id="bthDel" type="submit"
																	class="btn btn-danger modBoard"
																	style="margin-left: 5px">삭제</button>
																<button id="bthMod" type="submit"
																	class="btn btn-warning modBoard"
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
	<script src="/resources/js/ai_board.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
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
				submit_newBoard();
			});
			// 게시글 수정
			$("#bthMod").click(function(e) {
				e.preventDefault();
				var title = $('#inputBoardName');
				if (!(title.attr('readonly'))) {
					submit_modBoard();
				}
				title.attr("readonly", false);
				$("#inputBoardDesc").attr("readonly", false);
			});
			// 게시글 삭제
			$("#bthDel").click(function(e) {
				//stop submit the form, we will post it manually.
				e.preventDefault();
				var r = confirm("정말 삭제 하시겠습니까?");
				if (r == true) {
					delete_board();
				} else {
					return;
				}
			});
			// 게시판 조회
			getPagination();
		});
		//글쓰기
		function fn_write() {
			var form = document.getElementById("boardForm");
			form.action = "<c:url value='/board/writeForm.do'/>";
			form.submit();
		}
		//글조회
		function fn_view(code) {
			var form = document.getElementById("boardForm");
			var url = "<c:url value='/board/list'/>";
			url = url + "?code=" + code;
			form.action = url;
			form.submit();
		}
		//게시글 조회
		function view_board(code) {
			//console.log('-- view_board -- ', code);
			$.get({
				url : "/board/detail?code=" + code,
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
		function submit_newBoard() {
			// console.log('-- submit_newBoard -- ');
			var title = $('#inputBoardName').val().trim();
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
				url : "/board/insert",
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
						getPagination();
						$('#boardNewModal').modal('hide');
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
		function submit_modBoard() {
			// console.log('-- submit_newBoard -- ');
			var title = $('#inputBoardName').val().trim();
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
				url : "/board/update",
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
						getPagination();
						$('#boardNewModal').modal('hide');
					}
				},
				error : function(e) {
					alert("error :: " + e.responseText);
					console.log("ERROR : ", e);
					$("#bthNew").prop("disabled", false);
				}
			});
		}
		//게시글 삭제
		function delete_board() {
			// Get form
			var form = $('#newUploadForm')[0];
			var data = new FormData(form);
			$("#bthDel").prop("disabled", true);
			$.post({
				url : "/board/delete",
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
						getPagination();
						$('#boardNewModal').modal('hide');
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
				$("#inputBoardName").attr("readonly", false);
				$("#inputBoardDesc").attr("readonly", false);
				$('.readBoard').hide();
				$('.modBoard').hide();
				$('.editBoard').show();
			} else { // type === 'READ'
				var d = data[0];
				$('#newModalLabel').text('게시글 상세 조회');
				$("#inputBoardName").attr("readonly", true);
				$("#inputBoardName").val(d.title);
				$("#inputBoardDesc").attr("readonly", true);
				$("#inputBoardDesc").val(d.contents);
				$("#boardCode").val(d.code);
				$("#boardWriter").val(d.writer);
				$("#boardDate").val(d.reg_datetime.substr(0, 19));
				$('.readBoard').show();
				if ($("#user_id").val() == d.writer) {
					$(".modBoard").show();
				} else {
					$(".modBoard").hide();
				}
				$('.editBoard').hide();
			}
			$('#boardNewModal').modal('show');
		}
	</script>
</body>
</html>