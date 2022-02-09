<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html style="height:100%">
<head>
<meta charset="UTF-8">
<title>기업고객</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini" style="height:100%">

			<!-- Content Header (Page header) -->
			 <section class="content-header">
				<h1>
					기업고객 <small>기업 </small>
				</h1>
				<img src="/resources/img/eprimg1.png" style="width:90%;">
				<div style="float:right;width:100%;">
								<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
					<button id='delBtn' type="button"
						class="btn btn-info pull-right"
						onClick='fn_menuOpen()'>목록</button>
				</div>
			</section>
		<%--		<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">기업/인물</li>
					<li class="active">인물</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content" style="height:95%;overflow-y:auto;">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<div>
										<h3 class="box-title">기본정보</h3>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
								<input type="hidden" id="epr_no" value= <%= (String)request.getParameter("epr_no") %>>
								<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> 
								<input type="hidden" id="boardCode" name="boardCode">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<table class="table">
									    <caption></caption>
									    <colgroup>
									        <col width="10%">
									        <col width="20%">
									        <col width="10%">
									        <col width="20%">
									        <col width="*">
									    </colgroup>
									    <tr>
											 <th scope="row">
									        	<label for="epr_name">기업명</label>
									        </th>
									        <td>
									        	  <input id="epr_name" name="epr_name"
															type="text" class="form-control" placeholder="기업명"
															required>
									        </td>
									         <th scope="row">
									         	<label for="moc_name" class="">사원명</label>
									         </th>
									        <td>
									        	<input id="moc_name" name="moc_name"
															type="text" class="form-control" placeholder="사원명"
															required>
											</td>
									    </tr>
									    <tr>
									     	<th scope="row">
									         	<label for="tel_no" class="">전화번호</label>
									         </th>
									        <td>
									        	<input id="tel_no" name="tel_no"
															type="text" class="form-control" placeholder="전화번호"
															required>
											</td>
											<th scope="row">
									         	<label for="email" class="">이메일</label>
									         </th>
									        <td>
												<input id="email" name="email"
															type="text" class="form-control" placeholder="이메일"
															required>
											</td>
									    </tr>
									   </table>
									</div>
								</div>
							
							</div>

							<div class="box">
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
										<table class="table">
										    <caption></caption>
										    <colgroup>
										        <col width="10%">
										        <col width="20%">
										        <col width="10%">
										        <col width="20%">
										        <col width="*">
										    </colgroup>
										    <tr>
										        <th scope="row">
								 		       	<label for="bse_emp_nm">등록자</label>
								 		       </th>
								 		       <td>
											        <input id="bse_emp_nm" name="bse_emp_nm"
																type="text" class="form-control" value= <%= session.getAttribute("sessionNAME") %>>
												</td>
										        <th scope="row">
										        	<label for="birthday">생년월일</label>
										        </th>
										        <td>
											        <input id="birthday" name="birthday"
															type="text" class="form-control" placeholder="생년월일"
																required>
												</td>
										    </tr>
										    <tr>
										        <th scope="row">
										         	<label for="city" class="">출신지</label>
										         </th>
										        <td colspan="3">
										        	<input id="city" name="city"
																type="text" class="form-control" placeholder="출신지"
																required>
												</td>
												
										    </tr>
										    <tr>
										      <th scope="row">
										         	<label for="last_edu" class="">최종학력</label>
										         </th>
										        <td>
										        	<input id="last_edu" name="last_edu"
																type="text" class="form-control" placeholder="최종학력"
																required>
												</td>
										        <th scope="row">
										         	<label for="desc" class="">경력 및 특이사항</label>
										         </th>
										        <td>
										        	<input id="desc" name="desc"
																type="text" class="form-control" placeholder="경력 및 특이사항"
																required>
												</td>
												 
										    </tr>
										    <tr>
												  <th scope="row">
										         	<label for="moc_addr" class="">자택주소</label>
										         </th>
										        <td>
										        	<input id="moc_addr" name="moc_addr"
																type="text" class="form-control" placeholder="자택주소"
																required>
												</td>
												
										        <th scope="row">
										         	<label for="moc_tel_no" class="">자택전화</label>
										         </th>
										        <td>
										        	<input id="moc_tel_no" name="moc_tel_no"
																type="text" class="form-control" placeholder="자택전화"
																required>
												</td>
										    </tr>
										</table>
									</div>
								</div>
							</div>
							<div>
								<div class="box" style="width:49%;float:left;">
									<div class="box box-default">
										<div class="box-header with-border">
											<div style="height:24px">
												<h3 class="box-title">학력정보</h3>
												<button id='newBtn' type="button"
													class="btn btn-info pull-right" style="width:30px;padding:1px 10px;margin-top:1px;margin-bottom:1px;"
													onClick='fn_delEdu()'>-</button>
												<button id='delBtn' type="button"
													class="btn btn-info pull-right" style="margin-right:15px;width:30px;padding:1px 10px;margin-top:1px;margin-bottom:1px;"
													onClick='fn_addEdu()'>+</button>
													<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
											</div>
										</div>
										<table
											class="table table-bordered table-striped table-hover text-center" style="margin-bottom:0px"">
											<thead>
												<tr>
													<th style="width: 5%;text-align: center">번호</th>
													<th style="width: 5%;text-align: center">구분</th>
													<th style="width: 10%;text-align: center">출생년도</th>
													<th style="width: 10%;text-align: center">학교명</th>
													<th style="width: 20%;text-align: center">전공명</th>
													<th style="width: 20%;text-align: center">소재지</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
										</table>
										<div style="display:block;overflow-y:auto;height:110px">
											<table
												class="table table-bordered table-striped table-hover text-center">
												<tbody id="edu_list">
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
										</div>
									</div>
								</div>
								<div class="box" style="width:49%;float:right;">
									<div class="box box-default">
										<div class="box-header with-border">
											<div style="height:24px">
												<h3 class="box-title">경력정보</h3>
												<button id='newBtn' type="button"
													class="btn btn-info pull-right" style="width:30px;padding:1px 10px;margin-top:1px;margin-bottom:1px;"
													onClick='fn_delEmp()'>-</button>
												<button id='delBtn' type="button"
													class="btn btn-info pull-right" style="margin-right:15px;width:30px;padding:1px 10px;margin-top:1px;margin-bottom:1px;"
													onClick='fn_addEmp()'>+</button>
												<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
											</div>
										</div>
										<table
											class="table table-bordered table-striped table-hover text-center" style="margin-bottom:0px">
											<thead>
												<tr>
													<th style="width: 10%;text-align: center">번호</th>
													<th style="width: 15%;text-align: center">시작년월일</th>
													<th style="width: 15%;text-align: center">종료년월일</th>
													<th style="width: 20%;text-align: center">회사명</th>
													<th style="width: 10%;text-align: center">직책</th>
													<th style="width: 10%;text-align: center">부서</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
										</table>
										<div style="display:block;overflow-y:auto;height:110px">
										<table
											class="table table-bordered table-striped table-hover text-center">
											<tbody id="emp_list">
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
										</div>
									</div>
								</div>
							</div>
							<div style="float:right;width:100%;">
								<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
								
								<button id='delBtn' type="button"
									class="btn btn-info pull-right"
									onClick='fn_menuOpen()'>목록</button>
								<button id='newBtn' type="button"
									class="btn btn-info pull-right" style="margin-right:15px;"
									onClick='registEpr()'>저장</button>
								<!-- <button id='newBtn' type="button"
									class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
									onClick='fn_new("EDIT", null)'>추가</button> -->
							</div>
						</div>
					</div>
			</section> --%>
	<jsp:include page="../include/commonJs.jsp" />
	<!-- ChartJS -->
	<script src="/resources/bower_components/Chart.js/Chart.js"></script>
	<!-- twbsPagination :: https://github.com/josecebe/twbs-pagination -->
	<script src="/resources/js/jquery.twbsPagination.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script type="text/javascript">
	function fn_menuOpen(){
		parent.document.getElementById("main_frame").src = "/epr/EprSearch";
		
	}
		/* $(document).ready(function() {
			
		});
		var GDM_CHECK = "";
		var GDM_CHECK_IDX = "";
		var GDM_CHECK2 = "";
		var GDM_CHECK_IDX2 = "";
		
		var com_obj = {};
		
		com_obj.grp_cd = "EPR_BIZ_TYPE_CD"
		transactionGet("/admin/SearchDtlCode2",com_obj,function(o){
			var div = document.querySelector("select[id='epr_biz_type']")
			var html = '<option selected="selected" value="0">선택</option>';
			$.each(o,
							function(i, val) {
								html += '<option value="' + val.grp_dtl_cd
										+ '">'+val.grp_dtl_name;
								
								html += '</option>';
							});
			div.innerHTML = html;
			var epr_no = document.getElementById("epr_no").value;
			if(!isEmpty(epr_no)){
				searchEprDtl();
			}
		})
		function searchEprDtl(){
			
			var obj = {};
			obj.epr_no = $("input[id='epr_no']")[0].value;
			url = "/epr/SearchEprDtl";
			
			transactionGet(url,obj,function(o){
				$("input[id='epr_name']")[0].value= o.epr_name ;
				//debugger;
				
				$("input[id='epr_rep_name']")[0].value = o.epr_rep_name;
				$("input[id='epr_tel_no']")[0].value=o.epr_tel_no;
				$("input[id='epr_addr']")[0].value=o.epr_addr;
				$("input[id='bse_emp_nm']")[0].value=o.bse_emp_nm;
				$("input[id='bse_emp_nm']").attr("disabled",true);
				$("input[id='biz_num']")[0].value = o.biz_num;
				$("input[id='corp_regist_num']")[0].value= o.corp_regist_num;
				$("#epr_biz_type option:eq("+o.epr_biz_type_cd+")").attr("selected","selected");
			})
		}
		//검색 서비스 호출
		function registEpr(){
			
			
			var obj = {};
			var url = "";
			
			//레포트명
			obj.epr_name = $("input[id='epr_name']")[0].value;
		
			obj.epr_biz_type = $("#epr_biz_type  option:selected").val();
			
			var epr_no = document.getElementById("epr_no").value;
			url = "/epr/InsertEpr";
			if(!isEmpty(epr_no)){
				obj.rpt_no = rpt_no;
				url = "/epr/UpdateRpt";
			}
			obj.epr_rep_name = $("input[id='epr_rep_name']")[0].value;
			obj.epr_tel_no = $("input[id='epr_tel_no']")[0].value;
			obj.epr_addr = $("input[id='epr_addr']")[0].value;
			obj.biz_num = $("input[id='biz_num']")[0].value;
			obj.corp_regist_num = $("input[id='corp_regist_num']")[0].value;
			obj.bse_emp_no = $("input[id='user_id']")[0].value;
			
			
			transactionPost(url,obj,function(){
				alert("저장");
			})
		}
		//transactionGet('/login/user','',searchMenu);
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
		function fn_menuOpen(){
			parent.document.getElementById("main_frame").src = "/moc/MocSearch";
			
		}
		function fn_addEmp(){
			var table = document.getElementById("emp_list");
			var trs = table.querySelectorAll('tr');
			var trs_length = trs.length;
			
			var html = '';
			
			if(table.querySelector('td') == null){
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				
				html += '<tr id="'+trs_length+'" onClick="clickRow('+trs_length+')">';
				//html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
				html += '<td style="width:10%;text-align: center;font-weight:100;" value="C">'+(Number(trs_length)+1)+'</td>';
				html += '<td style="width:15%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:15%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML +=  html;
			}else{
				var html = '';
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr id="'+trs_length+'" onClick="clickRow('+trs_length+')">';
				html += '<td style="width:10%;text-align: center;font-weight:100;" value="C">'+(Number(trs_length)+1)+'</td>';
				html += '<td style="width:15%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:15%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML += html;
			}
		}
		function clickRow(idx){
			var list = $('#emp_list'); 
			$.each(list.children(),function(i,d){
				if(d.getAttribute("id") == idx){
					GDM_CHECK_IDX = i;
					GDM_CHECK = d;
				}
			})
	        //GDM_CHECK = $('#emp_list tr[id="'+i+'"]');
	        //GDM_CHECK_IDX = GDM_CHECK.id;
		}
		function fn_delEmp(){
			if(GDM_CHECK.children[0].getAttribute("value") == "C"){
				 var table = document.getElementById('emp_list');
				 table.deleteRow(GDM_CHECK_IDX);
			}else{
				var obj = {};
				obj.grp_cd = GDM_CHECK.children[1].innerText;
				var url = "/admin/DeleteCode";
	
				
				transactionPost(url,obj,function(){
					alert("삭제되었습니다.");
					getPagination();
				});
			}
		}
		function fn_addEdu(){
			var table = document.getElementById("edu_list");
			var trs = table.querySelectorAll('tr');
			var trs_length = trs.length;
			
			var html = '';
			
			if(table.querySelector('td') == null){
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr id="'+trs_length+'" onClick="clickRow2('+trs_length+')">';
				//html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
				html += '<td style="width:5%;text-align: center;font-weight:100;" value="C">'+(Number(trs_length)+1)+'</td>';
				html += '<td style="width:5%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML +=  html;
			}else{
				var html = '';
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr id="'+trs_length+'" onClick="clickRow2('+trs_length+')">';
				html += '<td style="width:5%;text-align: center;font-weight:100;" value="C">'+(Number(trs_length)+1)+'</td>';
				html += '<td style="width:5%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:10%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="width:20%;text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML += html;
			}
		}
		function clickRow2(idx){
			var list = $('#edu_list'); 
			$.each(list.children(),function(i,d){
				if(d.getAttribute("id") == idx){
					GDM_CHECK_IDX2 = i;
					GDM_CHECK2 = d;
				}
			})
	        //GDM_CHECK = $('#emp_list tr[id="'+i+'"]');
	        //GDM_CHECK_IDX = GDM_CHECK.id;
		}
		function fn_delEdu(){
			if(GDM_CHECK2.children[0].getAttribute("value") == "C"){
				 var table = document.getElementById('edu_list');
				 table.deleteRow(GDM_CHECK_IDX2);
			}else{
				var obj = {};
				obj.grp_cd = GDM_CHECK.children[1].innerText;
				var url = "/admin/DeleteCode";
	
				
				transactionPost(url,obj,function(){
					alert("삭제되었습니다.");
					getPagination();
				});
			}
		} */
	</script>
</body>
</html>