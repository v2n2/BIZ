<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html style="height:100%">
<head>
<meta charset="UTF-8">
<title>영업활동일지</title>
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
					영업활동일지 <small>영업활동관리 </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">영업활동관리</li>
					<li class="active">영업활동일지</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content" style="height:95%;overflow-y:scroll;">
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
								<input type="hidden" id="rpt_no" value= <%= (String)request.getParameter("rpt_no") %>>
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
									        	<label for="bse_emp_name">작성자</label>
									        </th>
									        <td>
										        <input id="bse_emp_name" name="bse_emp_name"
															type="text" class="form-control" value=<%=session.getAttribute("sessionNAME")%> readonly>
											</td>
											 <th scope="row">
									        	<label for="before_date">영업일</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="biz_dt">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									    </tr>
									    <tr>
									         <th scope="row">
									         	<label for="rpt_type" class="">유형</label>
									         </th>
									        <td>
									        	<div class="col-sm-10">
													<input name="rpt_type" type="radio" value="1"> 일반
													<input name="rpt_type" type="radio" value="2"> Deal 관련
												</div>
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
									        	<label for="rpt_name">제목</label>
									        </th>
									        <td colspan="3">
										        <input id="rpt_name" name="rpt_name"
															type="text" class="form-control" placeholder="제목"
															required>
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="epr_name">기업명</label>
									        </th>
									        <td>
									        	<div class="input-group"> 
												        <input id="epr_name" name="epr_name"
																	type="text" class="form-control" placeholder="기업명"
																	required>
															<div class="input-group-addon" style="padding:0; ">
																<input id="search_epr" name="search_epr" onClick="fn_searchEpr()" type="button" value="조회" class="btn btn-info">
															</div>
													</div>
													<input type="hidden" id="epr_no" name="epr_no">
									        </td>
									         <th scope="row">
									         	<label for="biz_type" class="">영업구분</label>
									         </th>
									        <td>
												<select id="biz_type"
													class="form-control select2">
													<option selected="selected" value="0">전체</option>
													<option value="1">단순</option>
													<option value="2">Deal 관련</option>
												</select>
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="moc_name">면담고객</label>
									        </th>
									        <td>
									        	<div class="input-group"> 
												        <input id="moc_name" name="moc_name"
																	type="text" class="form-control" placeholder="면담고객"
																	required>
															<div class="input-group-addon" style="padding:0; ">
																<input id="search_epr" name="search_epr" onClick="fn_searchMoc()" type="button" value="조회" class="btn btn-info">
															</div>
													</div>
													<input type="hidden" id="moc_no" name="moc_no">
									        </td>
									         <th scope="row">
									         	<label for="emp_name">참석자</label>
									         </th>
									        <td>
									        	<div class="input-group"> 
												        <input id="emp_name" name="emp_name"
																	type="text" class="form-control" placeholder="참석자"
																	required>
															<div class="input-group-addon" style="padding:0; ">
																<input id="search_emp" name="search_emp" onClick="fn_searchEmp()" type="button" value="조회" class="btn btn-info">
															</div>
													</div>
													<input type="hidden" id="emp_no" name="emp_no">
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="inv_obj">방문목적</label>
									        </th>
									        <td colspan="3">
									        	<input id="inv_obj" name="inv_obj" type="text"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="cus_desc">고객요청/답변</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="cus_desc" name="cus_desc"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="sug_desc">당사제안/대응</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="sug_desc" name="sug_desc"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									     <tr>
									        <th scope="row">
									        	<label for="biz_etc_desc">영업외기타</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="biz_etc_desc" name="biz_etc_desc"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="tobe_desc">향후조치계획</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="tobe_desc" name="tobe_desc"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									    <tr>
									         <th scope="row">
									         	<label for="conn_per_type" class="">관련 Deal 연결가능성</label>
									         </th>
									        <td colspan="3">
									        	<div class="col-sm-10">
													<input id="conn_per_type" name="conn_per_type" type="radio" value="1"> 낮음
													<input id="conn_per_type" name="conn_per_type" type="radio" value="2"> 보통
													<input id="conn_per_type" name="conn_per_type" type="radio" value="3"> 높음
													<input id="conn_per_type" name="conn_per_type" type="radio" value="4"> 매우높음
												</div>
											</td>
									    </tr>
									</table>
								</div>
							</div>
							<div class="modal fade" id="eprList" tabindex="-1"
									role="dialog" aria-labelledby="newModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document" style="width:1000px;">
										<div class="modal-content" style="height:760px;width:1000px;">
											<div class="modal-header">
												<div class="row">
													<div class="col-xs-10">
														<h5 class="modal-title" id="newModalLabel">기업검색</h5>
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
													<div class="box-body">
														<table class="table">
														    <caption></caption>
														    <colgroup>
														        <col width="10%">
														        <col width="90%">
														        <col width="*">
														    </colgroup>
														    <tr>
														        <th scope="row">
														        	<label for="epr_name_pop">기업명</label>
														        </th>
														        <td>
															        <input id="epr_name_pop" name="epr_name_pop"
																				type="text" class="form-control" placeholder="기업명"
																				required>
																</td>
														    </tr>
														  </table>
														  <div class="box-footer">
															<button type="button" onclick="getPagination()"
																class="btn btn-info pull-right">검색</button>
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
													<div class="row">
														<div class="col-xs-12">
															<div class="box">
																<div class="box-header">
																	<h3 class="box-title">
																		기업목록 <span id='id_span_msg' class="label label-success"></span>
																	</h3>
																</div>
																<!-- /.box-header -->
																<table
																	class="table table-bordered table-striped table-hover text-center">
																	<thead>
																		<tr>
																			<th style="width: 10%;text-align: center">선택</th>
																			<th style="width: 10%;text-align: center">기업명</th>
																			<th style="width: 10%;text-align: center">대표자명</th>
																			<th style="width: 15%;text-align: center">법인등록번호</th>
																			<th style="width: 15%;text-align: center">사업자등록번호</th>
																			<th style="width: 10%;text-align: center">등록일자</th>
																			<!--<th>조회수</th>-->
																		</tr>
																	</thead>
																	<tbody id="epr_list">
																	</tbody>
																	</table>
																<nav aria-label="Page navigation example"
																	style="text-align: center;">
																	<ul class="pagination-sm" id="pagination"></ul>
																</nav>
															</div>
														</div>
													</div>
													<!-- /.box-body -->
													<div class="box-footer">
														<div class='row pull-right' style='margin-right: 3px'>
															<button id="btnEprSet" type="button" onClick="fn_setEprInfo()"
																class="btn btn-primary"  data-dismiss="modal">등록</button>
															<!-- <button id="bthDel" type="submit"
																class="btn btn-danger modBoard"
																style="margin-left: 5px">삭제</button>
															<button id="bthMod" type="submit"
																class="btn btn-warning modBoard"
																style="margin-left: 5px">수정</button> -->
															<button id="bthClose" type="button"
																class="btn btn-secondary" data-dismiss="modal"
																style="margin-left: 5px">돌아가기</button>
														</div>
													</div>
													<!-- /.box-footer -->
											</div>
										</div>
									</div>
								</div>
								<!--/. Modal -->
								<div class="modal fade" id="mocList" tabindex="-1"
									role="dialog" aria-labelledby="newModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document" style="width:1000px;">
										<div class="modal-content" style="height:760px;width:1000px;">
											<div class="modal-header">
												<div class="row">
													<div class="col-xs-10">
														<h5 class="modal-title" id="newModalLabel">면담고객</h5>
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
													<div class="box-body">
														<table class="table">
														    <caption></caption>
														    <colgroup>
														        <col width="10%">
														        <col width="90%">
														        <col width="*">
														    </colgroup>
														    <tr>
														        <th scope="row">
														        	<label for="moc_name_pop">고객명</label>
														        </th>
														        <td>
															        <input id="moc_name_pop" name="moc_name_pop"
																				type="text" class="form-control" placeholder="인물명"
																				required>
																</td>
														    </tr>
														  </table>
														  <div class="box-footer">
															<button type="button" onclick="getPaginationMoc()"
																class="btn btn-info pull-right">검색</button>
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
													<div class="row">
														<div class="col-xs-12">
															<div class="box">
																<div class="box-header">
																	<h3 class="box-title">
																		고객목록 <span id='id_span_msg' class="label label-success"></span>
																	</h3>
																</div>
																<!-- /.box-header -->
																<table
																	class="table table-bordered table-striped table-hover text-center">
																	<thead>
																		<tr>
																			<th style="width: 10%;text-align: center">선택</th>
																			<th style="width: 10%;text-align: center">회사명</th>
																			<th style="width: 10%;text-align: center">직책명</th>
																			<th style="width: 15%;text-align: center">이름</th>
																			<!--<th>조회수</th>-->
																		</tr>
																	</thead>
																	<tbody id="moc_list">
																	</tbody>
																	</table>
																<nav aria-label="Page navigation example"
																	style="text-align: center;">
																	<ul class="pagination-sm" id="pagination_moc"></ul>
																</nav>
															</div>
														</div>
													</div>
													<!-- /.box-body -->
													<div class="box-footer">
														<div class='row pull-right' style='margin-right: 3px'>
															<button id="btnDealSet" type="button" onClick="fn_setMocInfo()"
																class="btn btn-primary"  data-dismiss="modal">등록</button>
															<!-- <button id="bthDel" type="submit"
																class="btn btn-danger modBoard"
																style="margin-left: 5px">삭제</button>
															<button id="bthMod" type="submit"
																class="btn btn-warning modBoard"
																style="margin-left: 5px">수정</button> -->
															<button id="bthClose" type="button"
																class="btn btn-secondary" data-dismiss="modal"
																style="margin-left: 5px">돌아가기</button>
														</div>
													</div>
													<!-- /.box-footer -->
											</div>
										</div>
									</div>
								</div>
								<!--/. Modal -->
								<div class="modal fade" id="empList" tabindex="-1"
									role="dialog" aria-labelledby="newModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document" style="width:1000px;">
										<div class="modal-content" style="height:760px;width:1000px;">
											<div class="modal-header">
												<div class="row">
													<div class="col-xs-10">
														<h5 class="modal-title" id="newModalLabel">직원검색</h5>
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
													<div class="box-body">
														<table class="table">
														    <caption></caption>
														    <colgroup>
														        <col width="10%">
														        <col width="40%">
														        <col width="10%">
														        <col width="40%">
														        <col width="*">
														    </colgroup>
														    <tr>
														        <th scope="row">
														        	<label for="emp_no_pop">사원번호</label>
														        </th>
														        <td>
															        <input id="emp_no_pop" name="emp_no_pop"
																				type="text" class="form-control" placeholder="사원번호"
																				required>
																</td>
																 <th scope="row">
														        	<label for="emp_name_pop">사번명</label>
														        </th>
														        <td>
															        <input id="emp_name_pop" name="emp_name_pop"
																				type="text" class="form-control" placeholder="사원명"
																				required>
																</td>
														    </tr>
														  </table>
														  <div class="box-footer">
															<button type="button" onclick="getPaginationEmp()"
																class="btn btn-info pull-right">검색</button>
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
													<div class="row">
														<div class="col-xs-12">
															<div class="box">
																<div class="box-header">
																	<h3 class="box-title">
																		사원목록 <span id='id_span_msg' class="label label-success"></span>
																	</h3>
																</div>
																<!-- /.box-header -->
																<table
																	class="table table-bordered table-striped table-hover text-center">
																	<thead>
																		<tr>
																			<th style="width: 10%;text-align: center">선택</th>
																			<th style="width: 10%;text-align: center">팀명</th>
																			<th style="width: 10%;text-align: center">사원번호</th>
																			<th style="width: 15%;text-align: center">사원명</th>
																			<!--<th>조회수</th>-->
																		</tr>
																	</thead>
																	<tbody id="emp_list">
																	</tbody>
																	</table>
																<nav aria-label="Page navigation example"
																	style="text-align: center;">
																	<ul class="pagination-sm" id="pagination_emp"></ul>
																</nav>
															</div>
														</div>
													</div>
													<!-- /.box-body -->
													<div class="box-footer">
														<div class='row pull-right' style='margin-right: 3px'>
															<button id="btnEmpSet" type="button" onClick="fn_setEmpInfo()"
																class="btn btn-primary"  data-dismiss="modal">등록</button>
															<!-- <button id="bthDel" type="submit"
																class="btn btn-danger modBoard"
																style="margin-left: 5px">삭제</button>
															<button id="bthMod" type="submit"
																class="btn btn-warning modBoard"
																style="margin-left: 5px">수정</button> -->
															<button id="bthClose" type="button"
																class="btn btn-secondary" data-dismiss="modal"
																style="margin-left: 5px">돌아가기</button>
														</div>
													</div>
													<!-- /.box-footer -->
											</div>
										</div>
									</div>
								</div>
								<!--/. Modal -->
								<div>
									<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
									
									<button id='delBtn' type="button"
										class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
										onClick='fn_menuOpen()'>목록</button>
									<button id='newBtn' type="button"
										class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
										onClick='registRpt()'>저장</button>
									<!-- <button id='newBtn' type="button"
										class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
										onClick='fn_new("EDIT", null)'>추가</button> -->
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
		$("#biz_dt").css("cursor", "pointer");
		$("#biz_dt").datepicker({
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
			GDS_EPR_INFO = "";
			GDS_EMP_INFO = "";
			GDS_MOC_INFO = "";
			GDM_CHECK_IDX = -1;
			GDM_CHECK_EMP_IDX = -1;
			GDM_CHECK_MOC_IDX = -1;
			nowPages = 1;
			totalPages = 1;
			visiblePages = 5;

			page_st = 1;
			page_end = 5;
			pageSize = 5;
			// 모달 처리
			$('.modal').on('hidden.bs.modal', function(e) {
				// console.log('modal close');
				$(this).find('form')[0].reset();
			});
			$('.modal').on('shown.bs.modal', function() {
				// console.log('modal open');
			});
		});
		
		var rpt_no = document.getElementById("rpt_no").value;
		if(!isEmpty(rpt_no)){
			var obj = {};
			obj.rpt_no = $("input[id='rpt_no']")[0].value;
			url = "/CallReport/searchRptDetail";
			
			transactionGet(url,obj,function(o){
				$("input[id='rpt_name']")[0].value= o.rpt_name ;
				//debugger;
				//타입
				const bizNodeList = document.getElementsByName('rpt_type');
				bizNodeList.forEach((node) => {
					if(node.value == o.rpt_type){
						node.checked = true;	
					}
					
				})
				//conn_per_type
				const connNodeList = document.getElementsByName('conn_per_type');
				connNodeList.forEach((node) => {
					if(node.value == o.conn_per_type){
						node.checked = true;	
					}
				})
				$("input[id='biz_dt']")[0].value = o.biz_dt;
				$("input[id='inv_obj']")[0].value=o.inv_obj ; 
				$("textarea[id='tobe_desc']")[0].value=o.tobe_desc;
				$("textarea[id='sug_desc']")[0].value = o.sug_desc;
				$("textarea[id='cus_desc']")[0].value= o.cus_desc;
				$("textarea[id='biz_etc_desc']")[0].value=o.biz_etc_desc;
				$("input[id='bse_emp_name']")[0].value=o.bse_emp_name;
				$("input[id='emp_name']")[0].value=o.emp_name;
				$("input[id='emp_no']")[0].value=o.emp_no;
				$("input[id='epr_no']")[0].value=o.epr_no;
				$("input[id='epr_name']")[0].value=o.epr_name;
				$("input[id='moc_no']")[0].value=o.moc_no;
				$("input[id='moc_name']")[0].value=o.moc_name;
				$("#biz_type option:eq("+o.biz_type+")").attr("selected","selected");
			})
		}
		//검색 서비스 호출
		function registRpt(){
			
			
			var obj = {};
			var url = "";
			
			//레포트명
			obj.rpt_name = $("input[id='rpt_name']")[0].value;
			//타입
			const bizNodeList = document.getElementsByName('rpt_type');
			bizNodeList.forEach((node) => {
				if(node.checked){
					obj.rpt_type= node.value;
				}
			})
			//conn_per_type
			const connNodeList = document.getElementsByName('conn_per_type');
			connNodeList.forEach((node) => {
				if(node.checked){
					obj.conn_per_type= node.value;
				}
			})
			var rpt_no = document.getElementById("rpt_no").value;
			url = "/CallReport/registRpt";
			if(!isEmpty(rpt_no)){
				obj.rpt_no = rpt_no;
				url = "/CallReport/updateRpt";
			}
			obj.biz_type= $("#biz_type  option:selected").val();
			obj.biz_dt = $("input[id='biz_dt']")[0].value.replaceAll("-","");
			obj.inv_obj = $("input[id='inv_obj']")[0].value;
			obj.tobe_desc = $("textarea[id='tobe_desc']")[0].value;
			obj.sug_desc = $("textarea[id='sug_desc']")[0].value;
			obj.cus_desc = $("textarea[id='cus_desc']")[0].value;
			obj.biz_etc_desc = $("textarea[id='biz_etc_desc']")[0].value;
			obj.bse_emp_no = $("input[id='user_id']")[0].value;
			obj.emp_no = $("input[id='emp_no']")[0].value;
			obj.epr_no = $("input[id='epr_no']")[0].value;
			obj.moc_no = $("input[id='moc_no']")[0].value;
			
			transactionPost(url,obj,function(){
				alert("저장");
				fn_menuOpen();
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
			parent.document.getElementById("main_frame").src = "/callreport/CallReport";
			
		}
		function fn_searchEpr(){
			$('.editBoard').hide();
		
			$('#eprList').modal('show');
		}
		function getPagination() {
			var obj = {};
			
			obj.epr_name = $("input[id='epr_name_pop']")[0].value;
			
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
		function searchEpr(page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			obj.epr_name = $("input[id='epr_name_pop']")[0].value;
			
			url = "/epr/SearchEpr";
			
			transactionPost(url,obj,grid_table_epr);
		}
		function grid_table_epr(obj) {
			GDS_EPR_INFO = obj.eprList;
			var div = document.querySelector('#epr_list');
			var html = '';
			$.each(obj.eprList, function(i, val) {
								html += '<tr onClick="clickRow('+i+')">';
								html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>';
								html += '<td style="text-align: center;font-weight:100;">'+ val.epr_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_rep_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.biz_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.corp_regist_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function clickRow(i){
	           var allData = $('#epr_list tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#epr_list tr')[i].children[0].children[0];
	           //GDM_CHECK = $('#deal_list tr')[i];
	           GDM_CHECK_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		function fn_setEprInfo(){
			$('#epr_no')[0].value = GDS_EPR_INFO[GDM_CHECK_IDX].epr_no;
			$('#epr_name')[0].value = GDS_EPR_INFO[GDM_CHECK_IDX].epr_name;
		}
		function fn_searchMoc(){
			$('.editBoard').hide();
		
			$('#mocList').modal('show');
		}
		function getPaginationMoc() {
			var obj = {};
			
			obj.moc_name = $("input[id='moc_name_pop']")[0].value;
			
			$.get({
				url : '/moc/mocPage',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {

					if (data[0] != "0") {
						totalPages = Math.ceil(data[0] / pageSize);
						grid_pagination_moc(totalPages, visiblePages);

					}else{
						var div = document.querySelector('#moc_list');
						div.innerHTML =""; 
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_pagination_moc(totalPages, visiblePages) {

			$('#pagination_moc').twbsPagination('destroy');
			window.pagObj = $('#pagination_moc').twbsPagination({
				totalPages : totalPages,
				visiblePages : visiblePages,
				onPageClick : function(event, page) {
					// alert("on1 " + page + ' (from event listening)');

					page_st = ((1 * pageSize) * page) - (pageSize - 1);
					page_end = (page_st + pageSize) - 1;

					searchMoc(page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		function searchMoc(page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			obj.moc_name = $("input[id='moc_name_pop']")[0].value;
			
			url = "/moc/SearchMoc";
			
			transactionPost(url,obj,grid_table_moc);
		}
		function grid_table_moc(obj) {
			GDS_MOC_INFO = obj.mocList;
			var div = document.querySelector('#moc_list');
			var html = '';
			$.each(obj.eprList, function(i, val) {
								html += '<tr onClick="clickMocRow('+i+')">';
								html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>';
								html += '<td style="text-align: center;font-weight:100;">'+ val.epr_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_rep_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.biz_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.corp_regist_num	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function clickMocRow(i){
	           var allData = $('#moc_list tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#moc_list tr')[i].children[0].children[0];
	           //GDM_CHECK = $('#deal_list tr')[i];
	           GDM_CHECK_MOC_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		function fn_setMocInfo(){
			$('#moc_no')[0].value = GDS_MOC_INFO[GDM_CHECK_MOC_IDX].moc_no;
			$('#moc_name')[0].value = GDS_MOC_INFO[GDM_CHECK_MOC_IDX].moc_name;
		}
		function fn_searchEmp(){
			$('.editBoard').hide();
		
			$('#empList').modal('show');
		}
		function getPaginationEmp() {
			var obj = {};
			
			obj.emp_name = $("input[id='emp_name_pop']")[0].value;
			obj.emp_no = $("input[id='emp_no_pop']")[0].value;
			
			$.get({
				url : '/admin/UserPage',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {

					if (data[0] != "0") {
						totalPages = Math.ceil(data[0] / pageSize);
						grid_pagination_emp(totalPages, visiblePages);

					}else{
						var div = document.querySelector('#emp_list');
						div.innerHTML =""; 
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_pagination_emp(totalPages, visiblePages) {

			$('#pagination_emp').twbsPagination('destroy');
			window.pagObj = $('#pagination_emp').twbsPagination({
				totalPages : totalPages,
				visiblePages : visiblePages,
				onPageClick : function(event, page) {
					// alert("on1 " + page + ' (from event listening)');

					page_st = ((1 * pageSize) * page) - (pageSize - 1);
					page_end = (page_st + pageSize) - 1;

					searchEmp(page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		function searchEmp(page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			obj.emp_name = $("input[id='emp_name_pop']")[0].value;
			obj.emp_no	= $("input[id='emp_no_pop']")[0].value;
			
			url = "/admin/SearchUser";
			
			transactionPost(url,obj,grid_table_emp);
		}
		function grid_table_emp(obj) {
			GDS_EMP_INFO = obj;
			var div = document.querySelector('#emp_list');
			var html = '';
			$.each(obj, function(i, val) {
								html += '<tr onClick="clickEmpRow('+i+')">';
								html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>';
								html += '<td style="text-align: center;font-weight:100;">'+ val.dept_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_no	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_name	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function clickEmpRow(i){
	           var allData = $('#emp_list tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#emp_list tr')[i].children[0].children[0];
	           //GDM_CHECK = $('#deal_list tr')[i];
	           GDM_CHECK_EMP_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		function fn_setEmpInfo(){
			$('#emp_no')[0].value = GDS_EMP_INFO[GDM_CHECK_EMP_IDX].emp_no;
			$('#emp_name')[0].value = GDS_EMP_INFO[GDM_CHECK_EMP_IDX].emp_name;
		}
	</script>
</body>
</html>