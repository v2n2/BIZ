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
</head>
<body class="hold-transition skin-blue sidebar-mini" style="height:100%">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Deal 원장 <small> Deal </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Deal</li>
					<li class="active">Deal 원장</li>
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
										<input type="hidden" id="rgs_emp_id" name="rgs_emp_id"
											value=<%=session.getAttribute("sessionID")%>>
										<input type="hidden" id="deal_no" name="deal_no" value="">
										<input type="hidden" id="deal_lgr_no" name="deal_lgr_no" value=<%= (String)request.getParameter("deal_lgr_no") %>>
										<input type="hidden" id="rm_no" name="rm_no" value="">
										<!--<a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>-->
									</div>
								</div>
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
										        	<label for="deal_name">관련Deal</label>
										        </th>
										        <td>
											        <div class="input-group"> 
												        <input id="deal_name" name="deal_name"
																	type="text" class="form-control" placeholder="관련Deal"
																	required>
																	<div class="input-group-addon" style="padding:0; ">
																		<input id="search_deal" name="search_deal" onClick="fn_searchDeal()" type="button" value="조회" class="btn btn-info">
																	</div>
																	<input type="hidden" id="deal_no" name="epr_no">
													</div>
												</td>
												<th scope="row">
										        	<label for="rm_emp_name">RM</label>
										        </th>
										        <td>
										        	<div class="input-group date"> 
											       	 <input id="rm_emp_name" name="rm_emp_name"
																type="text" class="form-control" placeholder="RM"
																required>
																<div class="input-group-addon" style="padding:0; ">
																		<input id="search_rm" name="search_rm" onClick="fn_searchRM()" type="button" value="조회" class="btn btn-info">
																	</div>
																</div>
																<input type="hidden" id="rm_emp_no" name="epr_no">
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
										<h3 class="box-title">Deal정보</h3>
										<input type="hidden" id="rgs_emp_id" name="rgs_emp_id"
											value=<%=session.getAttribute("sessionID")%>>
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
									        	<label for="deal_lgr_name">Deal원장명</label>
									        </th>
									        <td colspan="3">
										        <input id="deal_lgr_name" name="deal_lgr_name"
															type="text" class="form-control" placeholder="Deal원장명"
															required>
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="epr_name">발행회사</label>
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
									         	<label for="dbt_type" class="">회사채구분</label>
									         </th>
									        <td>
									        	<select id="dbt_type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">선택</option>
															<option value="PS">선보증</option>
															<option value="FS">무보증</option>
														</select>
											</td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="sub_type">공모사모구분</label>
									        </th>
									        <td>
												<select id="sub_type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">선택</option>
															<option value="US">공모</option>
															<option value="RS">사모</option>
														</select>
												
									        </td>
									         <th scope="row">
									         	<label for="grt_yn" class="">보증유무</label>
									         </th>
									        <td>
												<select id="grt_yn"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">전체</option>
															<option value="HS">유</option>
															<option value="FN">무</option>
														</select>
											</td>
									    </tr>
									    <tr>
									    	<th scope="row">
									        	<label for="tot_isu_amn">총발행금액</label>
									        </th>
									        <td>
									        	<input id="tot_isu_amn" name="tot_isu_amn" type="number"
														class="form-control">
									        </td>
									         <th scope="row">
									         	<label for="cur_cd" class="">통화코드</label>
									         </th>
									        <td>
									        	<select id="cur_cd"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">선택</option>
															<option value="US">USD</option>
															<option value="EU">EUR</option>
															<option value="KR">KRW</option>
														</select>
											</td>
									    </tr>
									     <tr>
									    	<th scope="row">
									        	<label for="isu_num">발행회차</label>
									        </th>
									        <td>
									        	<input id="isu_num" name="isu_num" type="text"
														class="form-control">
									        </td>
									          <th scope="row">
									        	<label for="isu_date">발행일자</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="isu_date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									         	<label for="lead_mgr" class="">주간사</label>
									         </th>
									        <td>
									        	<select id="lead_mgr"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">선택</option>
															<option value="HS">미래에셋</option>
															<option value="FN">NH투자증권</option>
															<option value="FN">DB금융투자</option>
														</select>
											</td>
											 <th scope="row">
									         	<label for="pcp_type" class="">참여구분</label>
									         </th>
									        <td>
									        	<select id="pcp_type"
															class="form-control select2" style="width: 100%;">
															<option selected="selected" value="all">선택</option>
															<option value="HS">참여</option>
															<option value="FN">미참여</option>
														</select>
											</td>
									    </tr>
									    <tr>
									    	 <th scope="row">
									        	<label for="contract_date">계약체결일자</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="contract_date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									         <th scope="row">
									        	<label for="due_date">만기일자</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="due_date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="due_year">만기년수</label>
									        </th>
									        <td>
									        	<input id="due_year" name="due_year" type="text"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="isu_yld">발행수익률</label>
									        </th>
									        <td>
									        	<input id="isu_yld" name="isu_yld" type="text"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for=surf_intr_rate>표면금리</label>
									        </th>
									        <td>
									        	<input id="surf_intr_rate" name="surf_intr_rate"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="int_pay_mod">이자지급방법</label>
									        </th>
									        <td>
									        	<input id="int_pay_mod" name="int_pay_mod"
														class="form-control">
									        </td>
									    </tr>
									     <tr>
									        <th scope="row">
									        	<label for="coun_amt">당사인수금액(권면금액)</label>
									        </th>
									        <td>
									        	<input id="coun_amt" name="coun_amt"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="sal_pri">당사인수금액(매출가액)</label>
									        </th>
									        <td>
									        	<input id="sal_pri" name="sal_pri"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									        <th scope="row">
									        	<label for="conv_pri">전환가</label>
									        </th>
									        <td>
									        	<input id="conv_pri" name="conv_pri"
														class="form-control">
									        </td>
									        <th scope="row">
									        	<label for="war_pri">신주인수권행사가격</label>
									        </th>
									        <td>
									        	<input id="war_pri" name="war_pri"
														class="form-control">
									        </td>
									    </tr>
									    <tr>
									    	 <th scope="row">
									        	<label for="war_pri_sta_date">신주인수권행사기간개시일</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="war_pri_sta_date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									         <th scope="row">
									        	<label for="war_pri_end_date">신주인수권행사기간종료일</label>
									        </th>
									        <td>
									        	<div class="input-group date"> 
													<input type="text" class="form-control" id="war_pri_end_date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
												</div> 
									        </td>
									    </tr>
									    <tr>
									    	 <th scope="row">
									        	<label for="cre_rat">신용등급</label>
									        </th>
									        <td colspan="3">
												<input type="text" class="form-control" id="cre_rat">
									        </td>
									    <tr>
									        <th scope="row">
									        	<label for="desc_text">비고</label>
									        </th>
									        <td colspan="3">
									        	<textarea id="desc_text" name="desc_text"
														class="form-control" rows="3"></textarea>
									        </td>
									    </tr>
									</table>
									<!-- /.게시판 목록 -->
									<!-- Modal -->
									<div class="modal fade" id="boardNewModal" tabindex="-1"
										role="dialog" aria-labelledby="newModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document" style="width:1000px;">
											<div class="modal-content" style="height:760px;width:1000px;">
												<div class="modal-header">
													<div class="row">
														<div class="col-xs-10">
															<h5 class="modal-title" id="newModalLabel">관련Deal</h5>
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
															        	<label for="deal_name_pop">Deal명</label>
															        </th>
															        <td>
																        <input id="deal_name_pop" name="deal_name_pop"
																					type="text" class="form-control" placeholder="Deal명"
																					required>
																	</td>
																	 <th scope="row">
															        	<label for="deal_type_pop">Deal유형</label>
															        </th>
															        <td>
																        <select id="deal_type_pop"
																			class="form-control select2" style="width: 100%;">
																			<option selected="selected" value="all">전체</option>
																			<option value="IB">IB</option>
																			<option value="CB">금융상품</option>
																			<option value="RB">대체상품</option>
																		</select>
																	</td>
															    </tr>
															     <tr>
															        <th scope="row">
															        	<label for="biz_type_pop">영업구분</label>
															        </th>
															        <td>
																        <select id="biz_type_pop"
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
																	 <th scope="row">
															        	<label for="emp_name_pop">작성자</label>
															        </th>
															        <td>
																        <input id="emp_name_pop" name="emp_name_pop"
																					type="text" class="form-control" placeholder="작성자"
																					required>
																	</td>
															    </tr>
															  </table>
															  <div class="box-footer">
																<button type="button" onclick="getPagination()"
																	class="btn btn-info pull-right">검색</button>
															</div>
															<%-- <input type="hidden" id="user_id" name="user_id"
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
															</div> --%>
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
												Deal Inv목록 <span id='id_span_msg' class="label label-success"></span>
											</h3>
										</div>
										<!-- /.box-header -->
										<table
											class="table table-bordered table-striped table-hover text-center">
											<thead>
												<tr>
													<th style="width: 10%;text-align: center">선택</th>
													<th style="width: 10%;text-align: center">유형</th>
													<th style="width: 15%;text-align: center">영업구분</th>
													<th style="width: 15%;text-align: center">Deal명</th>
													<th style="width: 10%;text-align: center">진행단계</th>
													<th style="width: 10%;text-align: center">작성부서</th>
													<th style="width: 10%;text-align: center">작성자</th>
													<th style="width: 10%;text-align: center">작성일자</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
											<tbody id="deal_list">
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
																<button id="btnDealSet" type="button" onClick="fn_setDealInfo()"
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
													</form>
												</div>
											</div>
										</div>
									</div>
									<!--/. Modal -->
									</div>
									<div class="modal fade" id="empList" tabindex="-1"
										role="dialog" aria-labelledby="newModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document" style="width:1000px;">
											<div class="modal-content" style="height:760px;width:1000px;">
												<div class="modal-header">
													<div class="row">
														<div class="col-xs-10">
															<h5 class="modal-title" id="searchRM">RM조회</h5>
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
															        	<label for="emp_no_pop2">사원번호</label>
															        </th>
															        <td>
																       <input id="emp_no_pop2" name="emp_no_pop2"
																					type="text" class="form-control" placeholder="사원번호"
																					required>
																	</td>
																	 <th scope="row">
															        	<label for="emp_name_pop2">사원명</label>
															        </th>
															        <td>
																        <input id="emp_name_pop2" name="emp_name_pop2"
																					type="text" class="form-control" placeholder="사원명"
																					required>
																	</td>
															    </tr>
															  </table>
															  <div class="box-footer">
																<button type="button" onclick="getPagination_emp()"
																	class="btn btn-info pull-right">검색</button>
															</div>
															<%-- <input type="hidden" id="user_id" name="user_id"
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
															</div> --%>
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
									RM 목록 <span id='id_span_msg' class="label label-success"></span>
								</h3>
							</div>
							<!-- /.box-header -->
							<table
								class="table table-bordered table-striped table-hover text-center">
								<thead>
									<tr>
										<th style="width: 10%;text-align: center">선택</th>
										<th style="width: 10%;text-align: center">사번</th>
										<th style="width: 15%;text-align: center">이름</th>
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
																<button id="bthEmpSet" type="button" onClick="fn_setEmpInfo()"
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
													</form>
												</div>
											</div>
										</div>
									</div>
									<!--/. Modal -->
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
															<button type="button" onclick="getPagination_epr()"
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
		$("#isu_date").css("cursor", "pointer");
		$("#contract_date").css("cursor", "pointer");
		$("#due_date").css("cursor", "pointer");
		$("#war_pri_sta_date").css("cursor", "pointer");
		$("#war_pri_end_date").css("cursor", "pointer");
	
		$("#isu_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#contract_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#due_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#war_pri_sta_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#war_pri_end_date").datepicker({
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
			//getPagination();
		GDS_DEAL_INFO = "";
		GDM_CHECK_IDX = -1;
		GDS_EMP_INFO = "";
		GDM_CHECK_EMP_IDX = -1;
		GDS_EPR_INFO = "";
		GDM_CHECK_EPR_IDX = -1;
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
			var deal_lgr_no = document.getElementById("deal_lgr_no").value;
			debugger;
			if(!isEmpty(deal_lgr_no)){
				var obj = {};
				obj.deal_lgr_no = $("input[id='deal_lgr_no']")[0].value;
				url = "/deal/searchlgrDetail";
				
				transactionGet(url,obj,function(obj){
					$("input[id='deal_lgr_name']")[0].value= o.deal_lgr_name ;
					$("input[id='deal_lgr_no']")[0].value= o.deal_lgr_no ;
					$("input[id='deal_name']")[0].value= o.deal_name ;
					$("input[id='deal_no']")[0].value= o.deal_no ;
					$("input[id='rm_emp_no']")[0].value= o.rm_emp_no ;
					$("input[id='rm_emp_name']")[0].value= o.rm_emp_name ;
					$("input[id='epr_name']")[0].value= o.epr_name ;
					$("input[id='epr_no']")[0].value= o.epr_no ;
					$("#dbt_type option:eq("+o.dbt_type+")").attr("selected","selected");
					$("#sub_type option:eq("+o.sub_type+")").attr("selected","selected");
					$("#grt_yn option:eq("+o.grt_yn+")").attr("selected","selected");
					$("#cur_cd option:eq("+o.cur_cd+")").attr("selected","selected");
					$("input[id='tot_isu_amn']")[0].value= o.tot_isu_amn ;
					$("input[id='isu_num']")[0].value= o.isu_num ;
					$("input[id='isu_date']")[0].value= o.isu_date ;
					$("#lead_mgr option:eq("+o.lead_mgr+")").attr("selected","selected");
					$("#pcp_type option:eq("+o.pcp_type+")").attr("selected","selected");
					$("input[id='contract_date']")[0].value= o.contract_date ;
					$("input[id='due_date']")[0].value= o.due_date ;
					$("input[id='due_year']")[0].value= o.due_year ;
					$("input[id='isu_yld']")[0].value= o.isu_yld ;
					$("input[id='surf_intr_rate']")[0].value= o.surf_intr_rate ;
					$("input[id='int_pay_mod']")[0].value= o.int_pay_mod ;
					$("input[id='coun_amt']")[0].value= o.coun_amt ;
					$("input[id='sal_pri']")[0].value= o.sal_pri ;
					$("input[id='conv_pri']")[0].value= o.conv_pri ;
					$("input[id='war_pri']")[0].value= o.war_pri ;
					$("input[id='war_pri_sta_date']")[0].value= o.war_pri_sta_date ;
					$("input[id='war_pri_end_date']")[0].value= o.war_pri_end_date ;
					$("input[id='cre_rat']")[0].value= o.cre_rat ;
					$("textarea[id='desc_text']")[0].value= o.desc_text ;
					
				})
		}
		});
		function fn_save(){
			var o = {};
			var url = "/deal/UpdateLgr";

			o.deal_lgr_name =$("input[id='deal_lgr_name']")[0].value;
			o.deal_lgr_no = $("input[id='deal_lgr_no']")[0].value= o.deal_lgr_no ;
			o.rm_emp_no = $("input[id='rm_emp_no']")[0].value  ;
			o.rm_emp_name = $("input[id='rm_emp_name']")[0].value  ;
			o.epr_name =$("input[id='epr_name']")[0].value ;
			o.epr_no = $("input[id='epr_no']")[0].value ;
			o.dbt_type = $("#dbt_type  option:selected").val();
			o.sub_type = $("#sub_type  option:selected").val();
			o.grt_yn = $("#grt_yn  option:selected").val();
			o.cur_cd = $("#cur_cd  option:selected").val();
			o.tot_isu_amn  = $("input[id='tot_isu_amn']")[0].value;
			o.isu_num  = $("input[id='isu_num']")[0].value ;
			o.isu_date =$("input[id='isu_date']")[0].value.replaceAll("-","") ;
			o.lead_mgr = $("#lead_mgr  option:selected").val();
			o.pcp_type = $("#pcp_type  option:selected").val();
			o.contract_date = $("input[id='contract_date']")[0].value;
			o.due_date = $("input[id='due_date']")[0].value.replaceAll("-","") ;
			o.due_year= $("input[id='due_year']")[0].value ;
			o.isu_yld=$("input[id='isu_yld']")[0].value ;
			o.surf_intr_rate = $("input[id='surf_intr_rate']")[0].value;
			o.int_pay_mod = $("input[id='int_pay_mod']")[0].value;
			o.coun_amt = $("input[id='coun_amt']")[0].value;
			o.sal_pri = $("input[id='sal_pri']")[0].value;
			o.conv_pri = $("input[id='conv_pri']")[0].value;
			o.war_pri = $("input[id='war_pri']")[0].value ;
			o.war_pri_sta_date = $("input[id='war_pri_sta_date']")[0].value.replaceAll("-","");
			o.war_pri_end_date = $("input[id='war_pri_end_date']")[0].value.replaceAll("-","");
			o.cre_rat = $("input[id='cre_rat']")[0].value;
			o.desc_text = $("textarea[id='desc_text']")[0].value ;
			debugger;
			if(isEmpty($("input[id='deal_lgr_no']")[0].value)){
				url = "/deal/InsertLgr";
			}else{
				o.deal_no = $("input[id='deal_lgr_no']")[0].value;
			}
			
			transactionPost(url,o,function(){
				alert("저장되었습니다.");
			})
		}
		function fn_del(){
			var obj = {};
			obj.deal_lgr_no = $("input[id='deal_lgr_no']")[0].value;
			var url = "/deal/DeleteLgr"
			transactionPost(url,obj,function(){
				alert("삭제되었습니다.");
			})
		}
		function fn_menuOpen(){
			parent.document.getElementById("main_frame").src = "/deal/DealLedger";
			
		}
	
		function fn_searchDeal(){
			
			/* $('#newModalLabel').text('Deal Inventory 조회');
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
		 */	$('.editBoard').hide();
		
			$('#boardNewModal').modal('show');
		}
		
		//transactionGet('/login/user','',searchMenu);
		function getPagination() {
			var obj = {};
			
			obj.deal_name = $("input[id='deal_name_pop']")[0].value;
			obj.deal_type = $("select[id='deal_type_pop']")[0].value;
			obj.biz_type = $("select[id='biz_type_pop']")[0].value;
			
			obj.emp_name = $("input[id='emp_name_pop']")[0].value;
			$.get({
				url : '/deal/DealPage',
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

					searchDeal(page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		function searchDeal(page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			obj.deal_name = $("input[id='deal_name_pop']")[0].value;
			obj.deal_type = $("select[id='deal_type_pop']")[0].value;
			obj.biz_type = $("select[id='biz_type_pop']")[0].value;
			obj.emp_name = $("input[id='emp_name_pop']")[0].value;
			url = "/deal/SearchDeal";
			
			transactionPost(url,obj,grid_table_deal);
		}
		function grid_table_deal(obj) {
			GDS_DEAL_INFO = obj.dealList;
			var div = document.querySelector('#deal_list');
			var html = '';
			$.each(obj.dealList, function(i, val) {
								html += '<tr onClick="clickRow('+i+')">';
								html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>';
								html += '<td style="text-align: center;font-weight:100;">'+ val.deal_type_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.biz_type_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.deal_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.proc_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.dept_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.bse_dt	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function clickRow(i){
	           var allData = $('#deal_list tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#deal_list tr')[i].children[0].children[0];
	           //GDM_CHECK = $('#deal_list tr')[i];
	           GDM_CHECK_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		function fn_setDealInfo(){
			$('#deal_no')[0].value = GDS_DEAL_INFO[GDM_CHECK_IDX].deal_no;
			$('#deal_name')[0].value = GDS_DEAL_INFO[GDM_CHECK_IDX].deal_name;
		}
		function fn_searchRM(){
			$('#empList').modal('show');
			
		}
		
		function getPagination_emp() {
			var obj = {};
			
			obj.emp_name = $("input[id='emp_name_pop2']")[0].value;
			obj.emp_no = $("input[id='emp_no_pop2']")[0].value;
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
						var div = document.querySelector('#deal_list');
						div.innerHTML =""; 
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_pagination_emp(totalPages, visiblePages) {

			$('#pagination').twbsPagination('destroy');
			window.pagObj = $('#pagination').twbsPagination({
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
			/* obj.deal_name = $("input[id='deal_name_pop']")[0].value;
			obj.deal_type = $("select[id='deal_type_pop']")[0].value;
			obj.biz_type = $("select[id='biz_type_pop']")[0].value;
			obj.emp_name = $("input[id='emp_name_pop']")[0].value; */
			url = "/admin/SearchUser";
			
			transactionPost(url,obj,grid_table_emp);
		}
		function grid_table_emp(obj) {
			GDS_EMP_INFO = obj;
			var div = document.querySelector('#emp_list');
			var html = '';
			$.each(obj, function(i, val) {
								html += '<tr onClick="clickRowEmp('+i+')">';
								html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>';
								html += '<td style="text-align: center;font-weight:100;">'+ val.emp_no	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.emp_name	+ '</td>';
								html += '</tr>';
							});
			html += '</tbody>';

			// console.log("Tbody == " + html);
			div.innerHTML = html;
		}
		function clickRowEmp(i){
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
			$('#rm_emp_no')[0].value = GDS_EMP_INFO[GDM_CHECK_EMP_IDX].emp_no;
			$('#rm_emp_name')[0].value = GDS_EMP_INFO[GDM_CHECK_EMP_IDX].emp_name;
		}
		function fn_searchEpr(){
			$('.editBoard').hide();
		
			$('#eprList').modal('show');
		}
		function getPagination_epr() {
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
						grid_pagination_epr(totalPages, visiblePages);

					}else{
						var div = document.querySelector('#epr_list');
						div.innerHTML =""; 
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_pagination_epr(totalPages, visiblePages) {

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
								html += '<tr onClick="clickRowEpr('+i+')">';
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
		function clickRowEpr(i){
	           var allData = $('#epr_list tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#epr_list tr')[i].children[0].children[0];
	           //GDM_CHECK = $('#deal_list tr')[i];
	           GDM_CHECK_EPR_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		function fn_setEprInfo(){
			$('#epr_no')[0].value = GDS_EPR_INFO[GDM_CHECK_EPR_IDX].epr_no;
			$('#epr_name')[0].value = GDS_EPR_INFO[GDM_CHECK_EPR_IDX].epr_name;
		}
	 </script>
</body>
</html>