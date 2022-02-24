<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html style="height:100%">
<head>
<meta charset="UTF-8">
<title>Deal Inventory</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<style>
#ds_campaign {
	border-collapse: collapse;
}

.btn-bg-mint {
	color: #fff;
	background-color: #78C2AD;
	border-color: #78C2AD;
}

.box-minty {
	border-top-color: #78C2AD;
}

#ds_campaign td, #ds_campaign th {
	padding: 20px;
}

#ds_campaign th {
	background-color: #ccc;
}

#ds_campaign tr.selected {
	background-color: navy;
	color: #fff;
	font-weight: bold;
}

.myAlert {
	position: relative;
	padding: 0.75rem 1.25rem;
	margin-bottom: 1rem;
	border: 1px solid transparent;
	border-radius: 0.4rem;
	padding-right: 4rem;
	color: #38656f;
	background-color: #e2f3f7;
	border-color: #d6eef3;
}

.text-pink {
	color: #F3734F;
}

.text-blue {
	color: #5198FF;
}

.text-green {
	color: #00B4AF;
}

.chart-container {
	position: relative;
	margin: auto;
	height: auto;
	width: 100%;
}
.img-arrow{
	max-width: 100%;
	min-width: 70%;
  	height: auto;
}

.img-arrow2{
	max-hight: 70%;
	min-hight: 50%;
  	wight: auto;
  	margin-bottom: 20px;
}
.col-arrow{
 width:1%; 
 padding-top:8px;
 float:left;
 display: none;
 
}

.col-sm-2-1{

  position: relative;

  min-height: 1px;

  padding-left: 1%;

  padding-right: 1%;

}
.col-arrow2{
		display: inline;
	}

@media (min-width: 768px){

	.col-sm-2-1{

	    width: 19%;

	    float:left;

	}
	.col-arrow{
		display: inline;
	}
	.img-arrow2{
		display: none;
	}

}

</style>
</head>
<body class="hold-transition skin-blue sidebar-mini" style="height:100%">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Deal Inventory <small> Deal </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Deal</li>
					<li class="active">Deal Inventory</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content" style="height:95%;overflow-y:scroll;">
				<div class="row" id="deal_status_row" style="display:none;">
						<!-- Default box -->
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
										<h3 class="box-title">Deal 프로세스</h3>
									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse" data-toggle="tooltip" title="Collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn btn-box-tool"
											data-widget="remove" data-toggle="tooltip" title="Remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="box-body">
								<div id="deal_status" class="row">
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid" id="MK">
											<div class="box-header with-border">
												<h3 class="box-title">마케팅</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button id='id_loading1_msg' type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid" id="SU">
											<div class="box-header with-border">
												<h3 class="box-title">제안</h3>
											</div>
											<!-- /.box-header -->

											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid" id="CO">
											<div class="box-header with-border">
												<h3 class="box-title">계약체결</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button id='id_pre_msg' type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid" id="PR">
											<div class="box-header with-border">
												<h3 class="box-title">계약 후 실무</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
										</div>
										<img class="img-arrow2" src="/resources/dist/img/arrow2.png">
									</div>
									<div class="col-arrow">
										<img class="img-arrow" src="/resources/dist/img/arrow1.png">
									</div>
									<!-- /.col -->
									<div class="col-sm-2-1 text-center">
										<div class="box box-default box-solid" id="DO">
											<div class="box-header with-border">
												<h3 class="box-title">완료</h3>
											</div>
											<!-- /.box-header -->
											<!-- <div class="box-body">
												<button type="button" class="btn btn-default"
													disabled="disabled">데이터 없음</button>
											</div> -->
											<!-- /.box-body -->
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<div>
										<h3 class="box-title">Deal정보</h3>
										<input type="hidden" id="rgs_emp_id" name="rgs_emp_id"
											value=<%=session.getAttribute("sessionID")%>>
										<input type="hidden" id="deal_no" name="deal_no" value=<%= (String)request.getParameter("deal_no") %>>
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
									        	<label for="deal_name">Deal명</label>
									        </th>
									        <td colspan="3">
										        <input id="deal_name" name="deal_name"
															type="text" class="form-control" placeholder="Deal명"
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
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="proc_type">진행현황</label>
									        </th>
									        <td>
													<input id="proc_type" name="proc_type" type="radio" value="MK"> 마케팅
													<input id="proc_type" name="proc_type" type="radio" value="SU"> 제안
													<input id="proc_type" name="proc_type" type="radio" value="CO"> 계약체결
													<input id="proc_type" name="proc_type" type="radio" value="PR"> 계약 후 실무
													<input id="proc_type" name="proc_type" type="radio" value="DO"> 완료
													<input id="drop" name="drop" type="checkbox"> DROP
												
									        </td>
									         <th scope="row">
									         	<label for="deal_type" class="">유형</label>
									         </th>
									        <td>
												<input id="deal_type" name="deal_type" type="radio" value="IB"> IB
												<input id="deal_type" name="deal_type" type="radio" value="CB"> 금융상품판매 
												<input id="deal_type" name="deal_type" type="radio" value="RB"> 대체상품판매
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="contract_date">계약체결일</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="con_dt">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									         <th scope="row">
									        	<label for="obj">종료예정일</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="end_dt">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="deal_proc_per">Deal수행가능성(%)</label>
									        </th>
									        <td>
									        	<input id="deal_proc_per" name="deal_proc_per" type="text"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="exp_pri">예상규모금액</label>
									        </th>
									        <td>
									        	<input id="exp_pri" name="exp_pri" type="text"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="exp_rev">예상수익</label>
									        </th>
									        <td>
									        	<input id="exp_rev" name="exp_rev"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="deal_souc">Deal Sourcing</label>
									        </th>
									        <td>
									        	<input id="deal_souc" name="deal_souc"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="emp_name">실무담당자</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="emp_name" name="emp_name"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									</table>
									</div>
								</div>
								<div class="modal fade" id="boardNewModal" tabindex="-1"
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
									</div>
								<div>
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
										
										<button id='delBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_menuOpen()'>목록</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_del()'>삭제</button>
										<button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_save()'>저장</button>
										<!-- <button id='newBtn' type="button"
											class="btn btn-info pull-right" style="margin-right:15px;margin-top:10px;"
											onClick='fn_new("EDIT", null)'>추가</button> -->
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
		$("#con_dt").css("cursor", "pointer");
		$("#end_dt").css("cursor", "pointer");
	
		$("#con_dt").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#end_dt").datepicker({
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
			GDM_CHECK_IDX = -1;
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
			var deal_no = document.getElementById("deal_no").value;
			
			if(!isEmpty(deal_no)){
			    $('#deal_status_row').removeAttr("style");
				var obj = {};
				obj.deal_no = $("input[id='deal_no']")[0].value;
				var url = "/deal/SearchDealDtl";
				
				transactionGet(url,obj,function(obj){
					$("input[id='deal_name']")[0].value= obj.deal_name ;
					//debugger;
					//타입
					const dealNodeList = document.getElementsByName('deal_type');
					dealNodeList.forEach((node) => {
						if(node.value == obj.deal_type){
							node.checked = true;	
						}
						
					})
					//proc_type
					const procNodeList = document.getElementsByName('proc_type');
					procNodeList.forEach((node) => {
						if(node.value == obj.proc_type){
							node.checked = true;	
						}
					})
					$('#'+obj.proc_type).removeClass("box-default");
					$('#'+obj.proc_type).addClass("btn-bg-mint");
					
					$("input[id='con_dt']")[0].value				= obj.con_dt;
					$("input[id='end_dt']")[0].value 				= obj.end_dt;
					$("input[id='deal_proc_per']")[0].value         = obj.deal_proc_per;
					$("input[id='exp_pri']")[0].value             = obj.exp_pri ;
					$("input[id='exp_rev']")[0].value             = obj.exp_rev ;
					$("input[id='deal_souc']")[0].value             = obj.deal_souc ;
					$("input[id='epr_name']")[0].value             = obj.epr_name ;
					$("input[id='epr_no']")[0].value             	= obj.epr_no ;
					var select_type = $('#biz_type').children();
					$.each(select_type,function(ii,dd){
						if(dd.value == obj.biz_type){
							dd.setAttribute("selected","selected");
						}
					});
					//$("#biz_type option:eq("+obj.biz_type+")").attr("selected","selected");
				})
		}
		});
		function fn_save(){
			var obj = {};
			var url = "/deal/UpdateDeal";

			const dealNodeList = document.getElementsByName('deal_type');
			dealNodeList.forEach((node) => {
				if(node.checked){
					obj.deal_type= node.value;
				}
			})
			
			const procNodeList = document.getElementsByName('proc_type');
			procNodeList.forEach((node) => {
				if(node.checked){
					obj.proc_type= node.value;
				}
			})
			obj.deal_name = $("input[id='deal_name']")[0].value;
			obj.biz_type = $("#biz_type  option:selected").val();
			//debugger;
			obj.drop_yn = "N";
			if($("#drop").is(":checked")){
				obj.drop_yn = "Y";
			}
			 
			obj.con_dt = $("input[id='con_dt']")[0].value.replaceAll("-","");
			obj.end_dt = $("input[id='end_dt']")[0].value.replaceAll("-","");
			obj.deal_proc_per = $("input[id='deal_proc_per']")[0].value;
			obj.exp_pri = $("input[id='exp_pri']")[0].value;
			obj.exp_rev = $("input[id='exp_rev']")[0].value;
			obj.deal_souc = $("input[id='deal_souc']")[0].value;
			obj.emp_name = $("textarea[id='emp_name']")[0].value;
			obj.rgs_emp_no = $("input[id='rgs_emp_id']")[0].value;
			obj.epr_no = $("input[id='epr_no']")[0].value;
			
			if(isEmpty($("input[id='deal_no']")[0].value)){
				url = "/deal/InsertDeal";
			}else{
				obj.deal_no = $("input[id='deal_no']")[0].value;
			}
			
			transactionPost(url,obj,function(){
				alert("저장되었습니다.");
				parent.document.getElementById("main_frame").src = "/deal/DealInv";
			})
		}
		function fn_del(){
			var obj = {};
			obj.deal_no =  document.getElementById("deal_no").value;
			var url = "/deal/DeleteDeal"
			transactionPost(url,obj,function(){
				alert("삭제되었습니다.");
				parent.document.getElementById("main_frame").src = "/deal/DealInv";
			})
		}
		function fn_menuOpen(){
			parent.document.getElementById("main_frame").src = "/deal/DealInv";
			
		}
		function fn_searchEpr(){
			$('.editBoard').hide();
		
			$('#boardNewModal').modal('show');
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
	</script>
</body>
</html>