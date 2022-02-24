<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard관리</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- Select2 -->
<link rel="stylesheet"
	href="/resources/bower_components/select2/dist/css/select2.min.css">
	<style>
  .box-body::-webkit-scrollbar {
    width: 5px;
  }
  .box-body::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 5px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .box-body::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 5px;
    box-shadow: inset 0px 0px 5px white;
  }
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
 <!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Dashboard관리 <small>관리자</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">관리자</li>
					<li class="active">Dashboard관리</li>
				</ol>
			</section>
				<section class="content">
					<div class="box" style="width:35%;float:left;">
							<div class="box box-default">
								<div class="box-header with-border">
									<h3 class="box-title">Dashboard</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- board table -->
									<!-- /.게시판 목록 -->
										<table
											class="table table-bordered table-striped table-hover text-center" id="com_code">
											<thead>
												<tr>
													<th style="width: 20%;text-align:center">이름</th>
													<th style="width: 40%;text-align:center">경로</th>
													<th style="width: 10%;text-align:center">추가</th>
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
								</div>
							</div>
						</div>
						<div class="box" style="width:65%;float:right;">
							<div class="box box-default">
								<div class="box-header with-border" style="padding-bottom: 5px;padding-top: 5px;">
									<input type="hidden" id="user_id" name="user_id"
												value=<%=session.getAttribute("sessionID")%>> 
										<button type="button" id="save" style="margin-left:5px;padding: 5px 9px;font-size: 13px;" onclick="save_com_code()"
											class="btn btn-info pull-right">저장</button>
								</div>
								<div class="box-body" style="overflow:auto;height:620px;padding-right: 5px;">
									<div class="gridster" style="background:#fadca5;">
									    <ul style="list-style:none;">
									
									    </ul>
									</div>
									<!-- <div class="column" id="column1">
									  <div class="box2" position="1X1" style="padding:5px;margin:1px">
									    <div class="box-header with-border ">Feeds</div>
									    <div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
									  </div>
									  <div class="box2" style="padding:5px;margin:1px">
									    <div class="box-header with-border" >News</div>
									    <div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
									  </div>
									</div>
									<div class="column" id="column2">
									  <div class="box2" style="padding:5px;margin:1px">
									    <div class="box-header with-border">Shopping</div>
									    <div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
									  </div>
									</div>
									<div class="column" id="column3">
								 
									  <div class="box2" style="padding:5px;margin:1px">
									    <div class="box-header with-border">Links</div>
									    <div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
									  </div>
								 
									  <div class="box2" style="padding:5px;margin:1px">
									    <div class="box-header with-border">Images</div>
									    <div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
									  </div>
									   <div class="box2" data-sizex="2" data-sizey="1" style="padding:5px;margin:1px;width:450px;position:static">
								             <div class="box-header with-border">Total Revenue</div>
								              <div class="box-body" style="height:120px;">
								                 <div class="metric-value d-inline-block">
								                     <h1 class="mb-1" style="margin-top: 0px;">$12099</h1>
								                 </div>
								                 <div class="metric-label d-inline-block float-right text-success font-weight-bold">
								                     <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span>
								                 </div>
								             	<div id="sparkline-11" class="sparkline-1">
								             	</div>
								            </div>
								         </div>
								         </div>
									<div class="column" id="column4">
									</div>-->
								</div> 
							</div>
						</div>
				</section>
	<jsp:include page="../include/commonJs.jsp" />
	<!-- Select2 -->
	<script src="/resources/js/common.js"></script>
 	<script type="text/javascript">
 	    var gridster;

    $(function () {

        gridster = $(".gridster > ul").gridster({
            widget_margins: [3, 3],
            widget_base_dimensions: [225, 190],
            max_cols: 4,
            min_rows: 3
        }).data('gridster');

        var widgets = [
            ['<li> <div class="box" style="padding:5px;margin:1px"> <div class="box-header with-border ">Feeds</div><div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div></div></li>', 1, 1],
            ['<li> <div class="box" style="padding:5px;margin:1px"> <div class="box-header with-border">Total Revenue</div><div class="box-body" style="height:120px;"><div class="metric-value d-inline-block"><h1 class="mb-1" style="margin-top: 0px;">$12099</h1></div><div class="metric-label d-inline-block float-right text-success font-weight-bold"><span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span></div><div id="sparkline-11" class="sparkline-1"></div></div></div></div></li>', 1, 1],
            ['<li> <div class="box" style="padding:5px;margin:1px"> <div class="box-header with-border ">Feeds</div><div class="box-body"  style="height:120px">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div></div></li>', 2, 1]
        ];

        $.each(widgets, function (i, widget) {
            gridster.add_widget.apply(gridster, widget)
        });

    });
 	$(document).ready(function() {
 		 // Sparkline charts
 	 	  var myvalues = [1000, 1200, 920, 927, 931, 1027, 819, 930, 1021];
 	 	  $('#sparkline-11').sparkline(myvalues, {
 	 	    type     : 'line',
 	 	    lineColor: '#92c1dc',
 	 	    fillColor: '#ebf4f9',
 	 	    height   : '35',
 	 	    width    : '200'
 	 	  }); 
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
         
           $.each(allData,function(idx,d){
        	   debugger;
        	   d.removeAttribute('style');
           })
		   var checkbox = $('#commonCode tr')[i].setAttribute('style','background-color:#367fa961');
           GDM_CHECK = $('#commonCode tr')[i];
           GDM_CHECK_IDX = i;
            if(checkbox.getAttribute('checked') == null){
            	checkbox.checked = true;
            	$('#commonDtlCode').empty();
            	//상세조회 처리
            	getPagination(GDM_CHECK.children[2].textContent);
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
								html += '<td style="text-align: center;font-weight:100;">'+ val.grp_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.grp_cd	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" value="'+val.del_yn+'" class="form-control select2" style="width:100%;" disabled><option value="Y">Y</option>	<option value="N">N</option></select></td>';
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
			html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
			html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
			html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
			html += '</tr>';
			table.innerHTML +=  html;
		}else{
			if(flag){
				var html = '';
				//html += '<tr onClick="view_rpt(' + val.rpt_no + ')">';
				html += '<tr onClick="clickRow('+trs_length+')">';
				html += '<td style="text-align: center;font-weight:100;" value="C" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;" contentEditable="true"></td>';
				html += '<td style="text-align: center;font-weight:100;"><select id="del_yn" name="del_yn" class="form-control select2" style="width:100%;"><option value="Y">Y</option>	<option value="N" selected>N</option></select></td>';
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
 	</script>
</body>
</html>
