<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>메뉴관리</title>
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
					메뉴관리 <small>관리자</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">관리자</li>
					<li class="active">메뉴관리</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
					<div class="col-xs-12">
						<div class="box">

							<div class="box box-default" style="width:20%;min-width:350px;position:absolute">
								<div class="box-header with-border">
									<h3 class="box-title">전체 메뉴</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body" >
									<!-- 메뉴 표시 영역  -->
									<ul id="trv_menu">
									</ul>
									<!-- board table -->
									<!-- /.게시판 목록 -->
								</div>
							</div>
							<div class="box box-default" style="left:360px;width:80%;max-width:calc(100% - 360px);position:absolute">
								<div class="box-header with-border">
									<h3 class="box-title">메뉴 정보</h3>
									<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> 
								</div>
								<div class="box-body">
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
									         	<label for="inputMenuName" class="">메뉴명</label>
									         </th>
									          <td>
									        	<input id="inputMenuName" name="inputMenuName" type="text"
														class="form-control" >
									        </td>
									        <th scope="row">
									        	<label for="inputMenuNo">메뉴번호</label>
									        </th>
									        <td>
									        	<input id="inputMenuNo" name="inputMenuNo" type="text"
														class="form-control" >
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="url">URL</label>
									        </th>
									        <td>
									        	<input id="url" name="url" type="text"
														class="form-control" >
									        </td>
									         <th scope="row">
									         	<label for="parMenuNo" class="">상위메뉴</label>
									         </th>
									          <td>
									        	<input id="parMenuNo" name="parMenuNo" type="text"
														class="form-control" >
									        </td>
									    </tr>
							         </table>
									<%-- <form id="boardForm" name="boardForm" method="post">
										<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> <input
											type="hidden" id="boardCode" name="boardCode">
										<div class="form-group">
										<div class="" style="width:calc((100%-400px)/2);float:left;">
											<label for="inputMenuName"
												class="col-sm-2 control-label" style="min-width:72px;">메뉴명</label>
											<div class="col-sm-10">
												<input id="inputMenuName" name="inputMenuName"
													type="text" class="form-control" placeholder="메뉴명"
													required>
											</div>
										</div>
										<div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
											<label for="inputMenuNo"
													class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">메뉴번호</label>
											<div class="col-sm-10">
												<input id="inputMenuNo" name="inputMenuNo"
													type="text" class="form-control" placeholder="메뉴번호"
													readonly>
											</div>
										</div>
										</div>
										<div class="form-group">
											<div class="" style="width:calc((100%-400px)/2);float:left;">
												<label for="url" class="col-sm-2 control-label" style="min-width:72px;">URL</label>
												<div class="col-sm-10">
													<input id="url" name="url" type="text"
														class="form-control">
												</div>
											</div>
											<div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
												<label for="parMenuNo" class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">상위메뉴</label>
												<div class="col-sm-10">
													<input id="parMenuNo" name="parMenuNo" type="text"
														class="form-control">
												</div>
											</div>
										</div>
															<!-- <div class="form-group">
																<div style="width:calc((100%-400px)/2)">
																	<label for="inputBoardDesc"
																		class="col-sm-2 control-label">내용</label>
																</div>
																<div class="col-sm-10" style="width:calc(100%/12*11);float:left;">	
																	<textarea id="inputBoardDesc" name="inputBoardDesc"
																		class="form-control" rows="10" placeholder="내용"
																		style="resize: none;"></textarea>
																</div>
															</div> -->
									</form> --%>
									<div>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
										
										<button id='delBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_del("EDIT", null)'>삭제</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_save("EDIT", null)'>저장</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_new("EDIT", null)'>추가</button>
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
	<script src="/resources/js/common.js"></script>
	<script type="text/javascript">
		var GDS_MENU_DATA = "";
		var GDS_MENU_IDX = -1;
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
			//getPagination();
		});
		transactionGet('/login/menu','',searchMenu);
		/* $.get({
			url : '/login/menu',
			data : '',
			cache : false,
			success : function(data, status, xhr) {
				GDS_MENU_DATA = data;
				console.log(GDS_MENU_DATA);
				//data
				searchMenu(data);
			}
			
		}); */
		function setMenuData(idx){
			console.log(GDS_MENU_DATA[idx]);
			//메뉴번호는 수정 불가
			$("#inputMenuNo").attr("readonly", true);
			
			$("input[id='inputMenuName']")[0].value= GDS_MENU_DATA[idx].menu_name;
			$("input[id='inputMenuNo']")[0].value= GDS_MENU_DATA[idx].menu_no;
			$("input[id='parMenuNo']")[0].value= GDS_MENU_DATA[idx].par_menu_no;
			$("input[id='url']")[0].value= GDS_MENU_DATA[idx].menu_url;
			//선택한 데이터의 번호를 전역에 저장
			GDS_MENU_IDX = idx;
			console.log(GDS_MENU_DATA[idx].par_menu_no);
			console.log(GDS_MENU_DATA[idx].lvl);
			
		}
		//추가
		function fn_new() {
			$("#inputMenuName").attr("readonly", false);
			$("#inputMenuNo").attr("readonly", false);
			$("#parMenuNo").attr("readonly", false);
			$("#url").attr("readonly", false);
			//신규 생성은 IDX는 -1으로 처리
			GDS_MENU_IDX = -1;
			
		}
		//저장
		function fn_save(){
			var obj = {};
			var url = "";
			console.log(GDS_MENU_IDX)
			//수정
			if(GDS_MENU_IDX !=-1){
				GDS_MENU_DATA[GDS_MENU_IDX].menu_name = $("input[id='inputMenuName']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].menu_no = $("input[id='inputMenuNo']")[0].value
				if($("input[id='parMenuNo']")[0].value != 0){
					GDS_MENU_DATA[GDS_MENU_IDX].par_menu_no = $("input[id='parMenuNo']")[0].value;
				}
				GDS_MENU_DATA[GDS_MENU_IDX].menu_url = $("input[id='url']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].emp_no = $("input[id='user_id']")[0].value
				obj = GDS_MENU_DATA[GDS_MENU_IDX];
				url = "/admin/UpdateMenu";
			}else{//신규
				obj.menu_name = $("input[id='inputMenuName']")[0].value
				obj.menu_no = $("input[id='inputMenuNo']")[0].value
				if($("input[id='parMenuNo']")[0].value != 0){
					obj.par_menu_no = $("input[id='parMenuNo']")[0].value 
				}
				obj.menu_url = $("input[id='url']")[0].value
				obj.emp_no = $("input[id='user_id']")[0].value
				url = "/admin/InsertMenu";
			}
			
			transactionPost(url,obj,function(){
				$("input[id='inputMenuName']")[0].value= "";
				$("input[id='inputMenuNo']")[0].value= "";
				$("input[id='parMenuNo']")[0].value= "";
				$("input[id='url']")[0].value= "";
				transactionGet('/login/menu','',searchMenu);
			})
		}
		//삭제
		function fn_del(){
			var obj = {};
			var url = "";
			//수정
			if(GDS_MENU_IDX !=-1){
				GDS_MENU_DATA[GDS_MENU_IDX].menu_name = $("input[id='inputMenuName']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].menu_no = $("input[id='inputMenuNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].par_menu_no = $("input[id='parMenuNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].menu_url = $("input[id='url']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].emp_no = $("input[id='user_id']")[0].value
				obj = GDS_MENU_DATA[GDS_MENU_IDX];
				url = "/admin/DeleteMenu";
				
				transactionPost(url,obj,function(){
					$("input[id='inputMenuName']")[0].value= "";
					$("input[id='inputMenuNo']")[0].value= "";
					$("input[id='parMenuNo']")[0].value= "";
					$("input[id='url']")[0].value= "";
					transactionGet('/login/menu','',searchMenu);
				})
			}
			
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