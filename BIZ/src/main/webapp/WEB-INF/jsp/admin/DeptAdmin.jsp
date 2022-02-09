<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>조직관리</title>
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
					조직관리 <small>관리자</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">관리자</li>
					<li class="active">조직관리</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
					<div class="col-xs-12">
						<div class="box">

							<div class="box box-default" style="width:20%;min-width:350px;position:absolute">
								<div class="box-header with-border">
									<h3 class="box-title">조직도</h3>
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
									<h3 class="box-title">조직 정보</h3>
								</div>
								<div class="box-body">
									<form id="boardForm" name="boardForm" method="post">
										<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> <input
											type="hidden" id="boardCode" name="boardCode">
										<div class="form-group">
										<div class="" style="width:calc((100%-400px)/2);float:left;">
											<label for="inputDeptName"
												class="col-sm-2 control-label" style="min-width:72px;">조직명</label>
											<div class="col-sm-10">
												<input id="inputDeptName" name="inputDeptName"
													type="text" class="form-control" placeholder="조직명"
													required>
											</div>
										</div>
										<div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
											<label for="inputDeptNo"
													class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">조직번호</label>
											<div class="col-sm-10">
												<input id="inputDeptNo" name="inputDeptNo"
													type="text" class="form-control" placeholder="조직번호"
													readonly>
											</div>
										</div>
										</div>
										<div class="form-group">
											<div class="" style="width:calc((100%-400px)/2);float:left;">
												<label for="parDeptNo" class="col-sm-2 control-label" style="min-width:72px;">상위조직<br>번호</label>
												<div class="col-sm-10">
													<input id="parDeptNo" name="parDeptNo" type="text"
														class="form-control">
												</div>
											</div>
											<div class="" style="width:calc((100%-400px)/2);left:calc((100%-400px)/2);float:right;">
												<label for="deptHeadNo" class="col-sm-2 control-label" style="min-width:72px;padding-right:0px;">상위메뉴</label>
												<div class="col-sm-10">
													<input id="deptHeadNo" name="deptHeadNo" type="text"
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
									</form>
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
		var GDS_MENU_IDX = "";
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
		//transactionGet('/login/menu','',searchMenu);
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
			
			$("input[id='inputDeptName']")[0].value= GDS_MENU_DATA[idx].dept_name;
			$("input[id='inputDeptNo']")[0].value= GDS_MENU_DATA[idx].dept_no;
			$("input[id='parDeptNo']")[0].value= GDS_MENU_DATA[idx].par_dept_no;
			$("input[id='deptHeadNo']")[0].value= GDS_MENU_DATA[idx].dept_head_no;
			//선택한 데이터의 번호를 전역에 저장
			GDS_MENU_IDX = idx;
			console.log(GDS_MENU_DATA[idx].par_menu_no);
			console.log(GDS_MENU_DATA[idx].lvl);
			
		}
		//추가
		function fn_new() {
			$("#inputDeptName").attr("readonly", false);
			$("#inputDeptNo").attr("readonly", false);
			$("#parDeptNo").attr("readonly", false);
			$("#deptHeadNo").attr("readonly", false);
			//신규 생성은 IDX는 0으로 처리
			GDS_MENU_IDX = 0;
			
		}
		//저장
		function fn_save(){
			var obj = {};
			var url = "";
			//수정
			if(GDS_MENU_IDX !=0){
				GDS_MENU_DATA[GDS_MENU_IDX].dept_name = $("input[id='inputDeptName']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].dept_no = $("input[id='inputDeptNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].par_dept_no = $("input[id='parDeptNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].dept_head_no = $("input[id='deptHeadNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].emp_no = $("input[id='user_id']")[0].value
				obj = GDS_MENU_DATA[GDS_MENU_IDX];
				url = "/admin/UpdateMenu";
			}else{//신규
				obj.dept_name = $("input[id='inputDeptName']")[0].value
				obj.dept_no = $("input[id='inputDeptNo']")[0].value
				obj.par_dept_no = $("input[id='parDeptNo']")[0].value
				obj.dept_head_no = $("input[id='deptHeadNo']")[0].value
				obj.emp_no = $("input[id='user_id']")[0].value
				url = "/admin/InsertMenu";
			}
			
			transactionPost(url,obj,function(){
				$("input[id='inputDeptName']")[0].value= "";
				$("input[id='inputDeptNo']")[0].value= "";
				$("input[id='parDeptNo']")[0].value= "";
				$("input[id='deptHeadNo']")[0].value= "";
				transactionGet('/admin/dept','',searchMenu);
			})
		}
		//삭제
		function fn_del(){
			var obj = {};
			var url = "";
			//수정
			if(GDS_MENU_IDX !=0){
				GDS_MENU_DATA[GDS_MENU_IDX].dept_name = $("input[id='inputDeptName']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].dept_no = $("input[id='inputDeptNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].par_dept_no = $("input[id='parDeptNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].dept_head_no = $("input[id='deptHeadNo']")[0].value
				GDS_MENU_DATA[GDS_MENU_IDX].emp_no = $("input[id='user_id']")[0].value
				obj = GDS_MENU_DATA[GDS_MENU_IDX];
				url = "/admin/DeleteMenu";
				
				transactionPost(url,obj,function(){
					$("input[id='inputDeptName']")[0].value= "";
					$("input[id='inputDeptNo']")[0].value= "";
					$("input[id='parDeptNo']")[0].value= "";
					$("input[id='deptHeadNo']")[0].value= "";
					transactionGet('/admin/dept','',searchMenu);
				})
			}
			
		}
	</script>
</body>
</html>