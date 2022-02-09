<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통코드 관리</title>
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
					공통코드 관리 <small>관리 </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">관리자</li>
					<li class="active">공통코드 관리</li>
				</ol>
			</section>
			<!-- 게시판 목록 -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box" style="width:49%;float:left;">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">공통코드</h3>
									<input type="hidden" id="user_id" name="user_id"
											value=<%=session.getAttribute("sessionID")%>> 
									<button type="button" id="delete" style="margin-left:5px" onclick="delete_com_code()"
										class="btn btn-info pull-right">삭제</button>
									<button type="button" id="update" style="margin-left:5px" onclick="update_com_code()"
										class="btn btn-info pull-right">수정</button>
									<button type="button" id="save" style="margin-left:5px" onclick="save_com_code()"
										class="btn btn-info pull-right">저장</button>
									<button type="button" id="insert" style="margin-left:5px" onclick="insert_com_code()"
										class="btn btn-info pull-right">추가</button>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<form id="noticeForm" name="noticeForm" method="post">
										<table
											class="table table-bordered table-striped table-hover text-center" id="com_code">
											<thead>
												<tr>
													<th style="width: 10%;text-align:center">선택</th>
													<th style="width: 20%;text-align:center">그룹코드명</th>
													<th style="width: 20%;text-align:center">그룹코드</th>
													<th style="width: 20%;text-align:center">활성화여부</th>
													<th style="width: 20%;text-align:center">그룹코드내용</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
											<tbody id="commonCode">
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
									<h3 class="box-title">상세코드</h3>
									<button type="button" id="deleteDtl" style="margin-left:5px" onclick="delete_com_dtl_code()"
										class="btn btn-info pull-right">삭제</button>
									<button type="button" id="updateDtl" style="margin-left:5px" onclick="update_com_dtl_code()"
										class="btn btn-info pull-right">수정</button>
									<button type="button" id="saveDtl" style="margin-left:5px" onclick="save_com_dtl_code()"
										class="btn btn-info pull-right">저장</button>
									<button type="button" id="insertDtl" style="margin-left:5px" onclick="insert_com_dtl_code()"
										class="btn btn-info pull-right">추가</button>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
									<form id="noticeForm" name="noticeForm" method="post">
										<table
											class="table table-bordered table-striped table-hover text-center" id="com_dtl_code">
											<thead>
												<tr>
													<th style="width: 10%;text-align:center">선택</th>
													<th style="width: 20%;text-align:center">코드명</th>
													<th style="width: 20%;text-align:center">코드</th>
													<th style="width: 20%;text-align:center">활성화여부</th>
													<th style="width: 20%;text-align:center">코드내용</th>
													<!--<th>조회수</th>-->
												</tr>
											</thead>
											<tbody id="commonDtlCode">
											</tbody>
										</table>
										<nav aria-label="Page navigation example"
											style="text-align: center;">
											<ul class="pagination-sm" id="paginationDtl"></ul>
										</nav>
									</form>
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
		$(document).ready(function() {
			//table 클릭 시 발생
			/*$("#com_code tr").on('click',function () {
	            // 현재 클릭된 Row(<tr>)
	            var checkbox = $(this).find('td:first-child').children()[0];
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.setAttribute('checked',true);	
	            }else{
	            	checkbox.removeAttribute('checked');	
	            }
	            
	        });*/
			nowPages = 1;
			totalPages = 1;
			visiblePages = 5;
			
			nowDtlPages = 1;
			totalDtlPages = 1;
			visibleDtlPages = 5;

			page_st = 1;
			page_end = 5;
			pageSize = 10;
			
			page_dtl_st = 1;
			page_dtl_end = 5;
			pageDtlSize = 10;

			getPagination();
		});
		var GDM_CHECK = "";
		var GDM_DTL_CHECK = "";
		var GDM_CHECK_IDX = "";
		var GDM_DTL_CHECK_IDX = "";
		var GDS_DATA = "";
		var GDS_DTL_DATA = "";
		
		function clickRow(i){
	           var allData = $('#commonCode tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#commonCode tr')[i].children[0].children[0];
	           GDM_CHECK = $('#commonCode tr')[i];
	           GDM_CHECK_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            	$('#commonDtlCode').empty();
	            	//상세조회 처리
	            	getDtlPagination(GDM_CHECK.children[2].textContent);
	            }
		}
		//검색 서비스 호출
		function searchCommonCode(now_page, page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			
			url = "/admin/SearchCode";
			
			transactionPost(url,obj,grid_table_com_code)
		}
		
		
		function grid_table_com_code(obj) {
			if(obj.length > 0){
				GDS_DATA = obj; 
				var div = document.querySelector('#commonCode');
				var html = '';
				$.each(obj,
								function(i, val) {
									html += '<tr onClick="clickRow('+i+')">';
									html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
									html += '<td style="text-align: center;font-weight:100;">'+ val.grp_name	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_cd	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" value="'+val.del_yn+'" class="form-control select2" style="width:100%;" disabled><option value="Y">Y</option>	<option value="N">N</option></select></td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_desc	+ '</td>';
									html += '</tr>';
								});
				html += '</tbody>';
				// console.log("Tbody == " + html);
				div.innerHTML = html;
				var tr = $('#commonCode tr');
				
				$.each(tr,function(i,d){
					var select_del = d.children[3].children[0].children;
					var del_yn = d.children[3].children[0].getAttribute("value");
					$.each(select_del,function(ii,dd){
						if(dd.value == del_yn){
							dd.setAttribute("selected","selected");
						}
					});
				});
			}
		}
		function clickDtlRow(i){
	           var allData = $('#commonDtlCode tr');
	           $.each(allData,function(i,d){
	        	   d.children[0].children[0].removeAttribute('checked');
	           })
			   var checkbox = $('#commonDtlCode tr')[i].children[0].children[0];
	           GDM_DTL_CHECK = $('#commonDtlCode tr')[i];
	           GDM_DTL_CHECK_IDX = i;
	            if(checkbox.getAttribute('checked') == null){
	            	checkbox.checked = true;
	            }
		}
		//검색 서비스 호출
		function searchCommonDtlCode(now_page, page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			/*
			obj.before_date = $("input[id='before_date']")[0].value.replaceAll("-","");
			obj.after_date = $("input[id='after_date']")[0].value.replaceAll("-","");
			obj.biz_sta_date = $("input[id='biz_sta_date']")[0].value.replaceAll("-","");
			obj.biz_end_date = $("input[id='biz_end_date']")[0].value.replaceAll("-","");
			obj.rpt_name = $("input[id='rpt_name']")[0].value;
			obj.rpt_type = $("select[id='rpt_type']")[0].value;
			obj.dept_Name = $("select[id='dept_name']")[0].value;
			obj.corp_name = $("input[id='corp_name']")[0].value;
			obj.emp_name = $("input[id='emp_name']")[0].value;*/
			obj.grp_cd = GDM_CHECK.children[2].textContent;
			url = "/admin/SearchDtlCode";
			
			transactionPost(url,obj,grid_table_com_dtl_code)
		}
		
		
		/* function grid_table_com_code(obj) {
			if(obj.length > 0){
				GDS_DATA = obj; 
				var div = document.querySelector('#commonCode');
				var html = '';
				$.each(obj,
								function(i, val) {
									html += '<tr onClick="clickRow('+i+')">';
									html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
									html += '<td style="text-align: center;font-weight:100;">'+ val.grp_name	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_cd	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" value="'+val.del_yn+'" class="form-control select2" style="width:100%;" disabled><option value="Y">Y</option>	<option value="N">N</option></select></td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_desc	+ '</td>';
									html += '</tr>';
								});
				html += '</tbody>';
				// console.log("Tbody == " + html);
				div.innerHTML = html;
				var tr = $('#commonCode tr');
				
				$.each(tr,function(i,d){
					var select_del = d.children[3].children[0].children;
					var del_yn = d.children[3].children[0].getAttribute("value");
					$.each(select_del,function(ii,dd){
						if(dd.value == del_yn){
							dd.setAttribute("selected","selected");
						}
					});
				});
			}
		} */
		function grid_table_com_dtl_code(obj) {
			if(obj.length > 0){
				GDS_DTL_DATA = obj; 
				var div = document.querySelector('#commonDtlCode');
				var html = '';
				$.each(obj,
								function(i, val) {
									html += '<tr onClick="clickDtlRow('+i+')">';
									html += '<td style="text-align: center;"><input type="radio" name="checkDtl"></input></td>'
									html += '<td style="text-align: center;font-weight:100;">'+ val.grp_dtl_name	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_dtl_cd	+ '</td>';
									html += '<td style="text-align: center;font-weight:100;"><select id="dtl_del_yn" name="dtl_del_yn" value="'+val.del_yn+'" class="form-control select2" style="width:100%;" disabled><option value="Y">Y</option>	<option value="N">N</option></select></td>';
									html += '<td style="text-align: center;font-weight:100;">' + val.grp_dtl_desc	+ '</td>';
									html += '</tr>';
								});
				html += '</tbody>';
				// console.log("Tbody == " + html);
				div.innerHTML = html;
				var tr = $('#commonDtlCode tr');
				
				$.each(tr,function(i,d){
					var select_del = d.children[3].children[0].children;
					var del_yn = d.children[3].children[0].getAttribute("value");
					$.each(select_del,function(ii,dd){
						if(dd.value == del_yn){
							dd.setAttribute("selected","selected");
						}
					});
				});
			}
		}
		function insert_com_code()
		{
			$('#update').attr('disabled','true');
			//$('#delete').attr('disabled','true');
			$('#insert').attr('disabled','true');
			var table = document.getElementById("commonCode");
			var trs = table.querySelectorAll('tr');
			var trs_length = trs.length;
			var flag = true;
			$.each(trs,function(i,d){
				if(d.children[1].contentEditable == "true"){
					flag = false;
					return false;
				}
			});
			if(table.querySelector('td') == null){
				var html = '';
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr onClick="clickRow('+trs_length+')">';
				html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
				html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
				html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML +=  html;
			}else{
				if(flag){
					var html = '';
					//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
					html += '<tr onClick="clickRow('+trs_length+')">';
					html += '<td style="text-align: center;"><input type="radio" name="check"></input></td>'
					html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
					html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
					html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
					html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
					html += '</tr>';
					table.innerHTML += html;
				}else{
					alert("한 건씩 등록 가능합니다.");	
				}
				
			}
			
		}

		function insert_com_dtl_code ()
		{
			$('#updateDtl').attr('disabled','true');
			//$('#delete').attr('disabled','true');
			$('#insertDtl').attr('disabled','true');
			var table = document.getElementById("commonDtlCode");
			var trs = table.querySelectorAll('tr');
			var trs_length = trs.length;
			var flag = true;
			$.each(trs,function(i,d){
				if(d.children[1].contentEditable == "true"){
					flag = false;
					return false;
				}
			});
			if(table.querySelector('td') == null){
				var html = '';
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr onClick="clickDtlRow('+trs_length+')">';
				html += '<td style="text-align: center;"><input type="radio" name="checkDtl"></input></td>'
				html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;"><select id="dtl_del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
				html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '</tr>';
				table.innerHTML +=  html;
			}else{
				if(flag){
					var html = '';
					//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
					html += '<tr onClick="clickDtlRow('+trs_length+')">';
					html += '<td style="text-align: center;"><input type="radio" name="checkDtl"></input></td>'
					html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
					html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
					html += '<td style="text-align: center;font-weight:100;"><select id="dtl_del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
					html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
					html += '</tr>';
					table.innerHTML += html;
				}else{
					alert("한 건씩 등록 가능합니다.");	
				}
				
			}
			
		}
		
		function update_com_code (){
			//선택한 포커스 위치
			//추가버튼 막고 
			$('#insert').attr('disabled','true');
			//업데이트 버튼 취소로 변경 및 호출 함수 변경
			$('#update').text("취소");
			$('#update').attr("onclick","cancel_com_code()");
			//선택 라디오 버튼 비활성 처리
			var allData = $('#commonCode tr');
			$.each(allData,function(i,d){
				d.children[0].children[0].setAttribute("disabled","true");
			});
			
			GDM_CHECK.children[1].contentEditable = true;
			GDM_CHECK.children[3].children[0].removeAttribute("disabled");
			GDM_CHECK.children[4].contentEditable =	true;
			GDM_CHECK.children[1].focus();
		}
		function cancel_com_code(){
			$('#insert')[0].removeAttribute('disabled');
			var allData = $('#commonCode tr');
			$.each(allData,function(i,d){
				d.children[0].children[0].removeAttribute("disabled");
			});
			$('#update').text("수정");
			$('#update').attr("onclick","update_com_code()");
			GDM_CHECK.children[1].contentEditable = false;
			GDM_CHECK.children[3].children[0].setAttribute("disabled","true");
			GDM_CHECK.children[4].contentEditable =	false;
			
			
			GDM_CHECK.children[1].textContent = GDS_DATA[GDM_CHECK_IDX].grp_name;
			//GDM_CHECK.children[3]. = GDS_DATA[GDM_CHECK_IDX].del_yn;
			GDM_CHECK.children[4].textContent = GDS_DATA[GDM_CHECK_IDX].grp_desc;
			var select_del = GDM_CHECK.children[3].children[0].children;
			GDM_CHECK.children[3].children[0].setAttribute("value","GDS_DATA[GDM_CHECK_IDX].del_yn");
			var del_yn = GDM_CHECK.children[3].children[0].getAttribute("value");
			$.each(select_del,function(ii,dd){
				if(dd.value == del_yn){
					dd.setAttribute("selected","selected");
				}
			});

		}
		function save_com_code(){
			
			$('#update')[0].removeAttribute('disabled');
			$('#insert')[0].removeAttribute('disabled');
			//$('#delete')[0].removeAttribute('disabled');
			var allData = $('#commonCode tr');
			var flag = false;
			var data = {};
			$.each(allData,function(i,d){
				if(d.children[1].contentEditable == "true"){
					flag = true;
					data = d;
					return false;
				}
			});
			if(flag){
				var obj = {};
				obj.grp_name = data.children[1].innerText; 
				obj.grp_cd = data.children[2].innerText;
				obj.del_yn = data.children[3].children[0].value;
				obj.grp_desc = data.children[4].innerText;
				obj.emp_no = document.getElementById('user_id').value;
				var url = "/admin/InsertCode";
				if($('#update').text() == "취소")
				{
					url = "/admin/UpdateCode";
				}
				
				transactionPost(url,obj,function(){
					alert("등록되었습니다.");
					if($('#update').text() == "취소"){
						cancel_com_code();
					}
					
					getPagination();
				});
			}
		}
		function delete_com_code () {
			if(GDM_CHECK.children[1].getAttribute("value") == "C"){
				 var table = document.getElementById('com_code');
				 table.deleteRow(GDM_CHECK_IDX+1);
				 $('#update')[0].removeAttribute('disabled');
				 $('#insert')[0].removeAttribute('disabled');
			}else{
				var obj = {};
				obj.grp_cd = GDM_CHECK.children[2].innerText;
				var url = "/admin/DeleteCode";
	
				
				transactionPost(url,obj,function(){
					alert("삭제되었습니다.");
					getPagination();
				});
			}
				
		}
		function save_com_dtl_code(){
			
			$('#updateDtl')[0].removeAttribute('disabled');
			$('#insertDtl')[0].removeAttribute('disabled');
			//$('#delete')[0].removeAttribute('disabled');
			var allData = $('#commonDtlCode tr');
			var flag = false;
			var data = {};
			$.each(allData,function(i,d){
				if(d.children[1].contentEditable == "true"){
					flag = true;
					data = d;
					return false;
				}
			});
			if(flag){
				var obj = {};
				obj.grp_dtl_name = data.children[1].innerText; 
				obj.grp_dtl_cd = data.children[2].innerText;
				obj.del_yn = data.children[3].children[0].value;
				obj.grp_dtl_desc = data.children[4].innerText;
				obj.grp_cd = GDM_CHECK.children[2].textContent;
				if(obj.grp_cd == null || obj.grp_cd ==""){
					alert("공통코드를 선택한 후 등록 바랍니다.");
					return;
				}
				obj.emp_no = document.getElementById('user_id').value;
				var url = "/admin/InsertDtlCode";
				if($('#updateDtl').text() == "취소")
				{
					url = "/admin/UpdateDtlCode";
				}
				
				transactionPost(url,obj,function(){
					alert("등록되었습니다.");
					if($('#updateDtl').text() == "취소"){
						cancel_com_dtl_code();
					}
					
					getDtlPagination(GDM_CHECK.children[2].textContent);
				});
			}
		}
		function update_com_dtl_code (){
			//선택한 포커스 위치
			//추가버튼 막고 
			$('#insertDtl').attr('disabled','true');
			//업데이트 버튼 취소로 변경 및 호출 함수 변경
			$('#updateDtl').text("취소");
			$('#updateDtl').attr("onclick","cancel_com_dtl_code()");
			//선택 라디오 버튼 비활성 처리
			var allData = $('#commonDtlCode tr');
			$.each(allData,function(i,d){
				d.children[0].children[0].setAttribute("disabled","true");
			});
			
			GDM_DTL_CHECK.children[1].contentEditable = true;
			GDM_DTL_CHECK.children[3].children[0].removeAttribute("disabled");
			GDM_DTL_CHECK.children[4].contentEditable =	true;
			GDM_DTL_CHECK.children[1].focus();
		}
		function cancel_com_dtl_code(){
			$('#insertDtl')[0].removeAttribute('disabled');
			var allData = $('#commonDtlCode tr');
			$.each(allData,function(i,d){
				d.children[0].children[0].removeAttribute("disabled");
			});
			$('#updateDtl').text("수정");
			$('#updateDtl').attr("onclick","update_com_dtl_code()");
			GDM_DTL_CHECK.children[1].contentEditable = false;
			GDM_DTL_CHECK.children[3].children[0].setAttribute("disabled","true");
			GDM_DTL_CHECK.children[4].contentEditable =	false;
			
			
			GDM_DTL_CHECK.children[1].textContent = GDS_DATA_DTL[GDM_DTL_CHECK_IDX].grp_name;
			//GDM_CHECK.children[3]. = GDS_DATA[GDM_CHECK_IDX].del_yn;
			GDM_DTL_CHECK.children[4].textContent = GDS_DATA_DTL[GDM_DTL_CHECK_IDX].grp_desc;
			var select_del = GDM_DTL_CHECK.children[3].children[0].children;
			GDM_DTL_CHECK.children[3].children[0].setAttribute("value","GDS_DATA[GDM_CHECK_IDX].del_yn");
			var del_yn = GDM_DTL_CHECK.children[3].children[0].getAttribute("value");
			$.each(select_del,function(ii,dd){
				if(dd.value == del_yn){
					dd.setAttribute("selected","selected");
				}
			});

		}
		function delete_com_dtl_code () {
			if(GDM_CHECK.children[1].getAttribute("value") == "C"){
				 var table = document.getElementById('com_dtl_code');
				 table.deleteRow(GDM_DTL_CHECK_IDX+1);
				 $('#updateDtl')[0].removeAttribute('disabled');
				 $('#insertDtl')[0].removeAttribute('disabled');
			}else{
				var obj = {};
				obj.grp_cd = GDM_CHECK.children[2].innerText;
				obj.grp_dtl_cd = GDM_DTL_CHECK.children[2].innerText;
				var url = "/admin/DeleteDtlCode";
	
				
				transactionPost(url,obj,function(){
					alert("삭제되었습니다.");
					getDtlPagination(GDM_CHECK.children[2].textContent);
				});
			}
				
		}
		//transactionGet('/login/user','',searchMenu);
		function getPagination() {

			$.get({
				url : '/admin/CodePage',
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

					searchCommonCode(page, page_st, page_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
		
		function getDtlPagination(grp_code) {
			var obj = {};
			obj.grp_cd = grp_code;
			$.get({
				url : '/admin/CodeDtlPage',
				async : 'true',
				cache : false,
				data : obj,
				success : function(data) {

					if (data[0] != "0") {
						totalDtlPages = Math.ceil(data[0] / pageDtlSize);
						grid_dtl_pagination(totalDtlPages, visibleDtlPages);

					}else {
						//0이니깐 초기화
						var table = document.getElementById('com_dtl_code');
					}
				},
				error : function(request, status, error) {
				}
			});
		}

		function grid_dtl_pagination(totalDtlPages, visiblePages) {

			$('#paginationDtl').twbsPagination('destroy');
			window.pagObj = $('#paginationDtl').twbsPagination({
				totalPages : totalDtlPages,
				visiblePages : visibleDtlPages,
				onPageClick : function(event, page) {
					// alert("on1 " + page + ' (from event listening)');

					page_dtl_st = ((1 * pageDtlSize) * page) - (pageDtlSize - 1);
					page_dtl_end = (page_dtl_st + pageDtlSize) - 1;

					searchCommonDtlCode(page, page_dtl_st, page_dtl_end);
				}
			}).on('page', function(event, page) {
				// alert("on2 " + page + ' (from event listening)');
			});
		}
	</script>
</body>
</html>