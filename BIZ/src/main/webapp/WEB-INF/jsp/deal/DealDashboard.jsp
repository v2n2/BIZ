<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deal Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/commonCss.jsp" />
<!-- DataTables -->
<link rel="stylesheet"
	href="/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	<style type="text/css">
		.ulLine{
			list-style:none;
			display:flex;
			justify-content:center;
			
		}
		.liLine{
			flex-basis: 150px;
			padding-left:0px;
			display:flex;
			flex-direction:column;
			padding-right:25px;
		}
		
		.circle{
			margin-left:50px; 
			float: left;
			position: relative;
			background-color:#f39c12 !important;
			width:30px;
			height:30px;
			border-radius:50%;
			text-align:center;
			font-size:12px;
			line-height:50px;
		}
		.circle::after{
			/* border: 2px dotted #ddd;
			content: '';
			position:absolute;
			height:4px;
			width:100%;
			left:30px;
			top:13px;
			border-radius:2px; */
			content:"";
			float:left;
			background-image: linear-gradient(to 
		    right, black 10%, rgba(255,255,255,0) 50%);
		    background-position: bottom;
		    background-size: 10px 2px;
		    background-repeat: repeat-x;
		    padding-bottom: 17px;
		    width:400%;
		    left:30px;
		    position:absolute;
		}
		.circle_last{
			margin-left:50px; 
			float: left;
			position: relative;
			background-color:#f39c12 !important;
			width:30px;
			height:30px;
			border-radius:50%;
			text-align:center;
			font-size:12px;
			line-height:50px;
		}
	.deal_box{
		border: 3px solid #3c8dbc;
		border-radius:10%;
		height:100px;
		margin-top:10px;
	}
	
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow-y:scroll;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Deal Dashboard<small>Deal</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/iframe/Dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Deal</li>
					<li class="active">Deal Dashboard</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Search -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box box-default">
								<div class="box-header with-border">
									<div class="box-tools pull-right">
										<button type="button" class="btn btn-box-tool"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button> -->
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row" style="margin-bottom:10px">
										<div class="col-md-4">
											<div class="form-group">
												<div class="col-sm-10">
													<label for="">기간</label>
													<div class="input-group date">
														<input type="text" class="form-control" id="before_date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control" id="after_date">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
													<!-- /.input group -->
												</div>
											</div>
											<!-- /.form group -->
										</div>
										<!-- /.col -->
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" onclick="searchDealDashboard()"
										class="btn btn-info pull-right">검색</button>
								</div>
							</div>
						</div>
						<!-- /.box -->
					</div>
				<!-- /.Search -->
				<!-- 캠페인목록 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="nav-tabs-custom" id="tabs">
								<ul class="nav nav-tabs">
									<!-- <li class="active">
										<a href="#tab_1" data-toggle="tab" aria-expanded="false">회사채</a>
									</li> -->
									<!-- <li>
										<a href="#tab_2" data-toggle="tab" aria-expanded="false">증자</a>
									</li>
									<li>
										<a href="#tab_3" data-toggle="tab" aria-expanded="false">IPO</a>
									</li> -->
								</ul>
							
								<div class="tab-content">
									<!-- <div class="tab-pane active" id="tab_1">
										<ul class="ulLine">
											<li class="liLine">
												<div>
													<div class="circle"></div>
												</div>
												<div>
													<h4 style="margin-left:50px;"><b>123</b></h4>
													<h6 style="margin-left:30px;">14건 100 (억)</h6>
												</div>
												<div>
													<div class="deal_box">
														<p style="font-size:small;">[회사채] <b>테스트</b></p>
														<p style="font-size:xx-small;">홍길동</p>
														<p style="font-size:xx-small;">2022.01.01</p>
														<p  style="float:right;font-size:small;font-weight:bold">1,200,000,000</p>
													</div>
													<div class="deal_box" >
														<p style="font-size:small;">[회사채] <b>테스트</b></p>
														<p style="font-size:xx-small;">홍길동</p>
														<p style="font-size:xx-small;">2022.01.01</p>
														<p  style="float:right;font-size:small;font-weight:bold">1,200,000,000</p>
													</div>
												</div>
											</li>
											<li class="liLine">
												<div>
													<div class="circle"></div>
												</div>
												<div >
													<h4 style="margin-left:50px;"><b>123</b></h4>
													<h6 style="margin-left:30px;">14건 100 (억)</h6>
												</div>
												<div>
													<div class="deal_box">
													
													</div>
												</div>
											</li>
											<li class="liLine">
												<div>
													<div class="circle_last"></div>
												</div>
												<div >
													<h4 style="margin-left:50px;"><b>123</b></h4>
													<h6 style="margin-left:30px;">14건 100 (억)</h6>
												</div>
												<div>
													<div class="deal_box">
													
													</div>
												</div>
											</li>
										
										</ul>
									</div> -->
									<!-- <div class="tab-pane" id="tab_2">
										
									</div>
									<div class="tab-pane" id="tab_3">
										
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /.Main content -->
	<jsp:include page="../include/commonJs.jsp" />
	<!-- DataTables -->
	<script
		src="/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- AI_CAMPAIGN JS -->
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
		$("#before_date").css("cursor", "pointer");
		$("#after_date").css("cursor", "pointer");
		$("#before_date").datepicker({
			format : "yyyy-mm-dd",
			language : "kr",
			autoclose : true,
			todayHighlight : true
		}).on('hide', function(e) {
			e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
		});
		$("#after_date").datepicker({
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
	var tabs = $("#tabs").tabs();
	var tabTemplate = "<li><a href='<%="#"%>{href}' data-toggle='tab' aria-expanded='false'><%="#"%>{label}</a></li>";
	var lineTemplate = "<ul class='ulLine'></ul>";
	var procTemplate = "<li class='liLine' id='<%="#"%>{id}'><div><div class='circle'></div></div><div><h4 style='text-align:center'><b><%="#"%>{label}</b></h4><h6 style='text-align:center;'><%="#"%>{count}건 <%="#"%>{value}(억)</h6></li>";
	var boxTemplate = "<div class='deal_box'><p style='font-size:small;''>[<%="#"%>{biz_type_name}] <b><%="#"%>{deal_name}</b></p><p style='font-size:xx-small;'><%="#"%>{emp_name}</p><p style='font-size:xx-small;'><%="#"%>{con_dt}</p><p style='float:right;font-size:small;font-weight:bold'><%="#"%>{exp_pri}</p></div>";
	/* 
<div>
	<div class="deal_box">
		<p style="font-size:small;">[회사채] <b>테스트</b></p>
		<p style="font-size:xx-small;">홍길동</p>
		<p style="font-size:xx-small;">2022.01.01</p>
		<p  style="float:right;font-size:small;font-weight:bold">1,200,000,000</p>
	</div>
	<div class="deal_box" >
		<p style="font-size:small;">[회사채] <b>테스트</b></p>
		<p style="font-size:xx-small;">홍길동</p>
		<p style="font-size:xx-small;">2022.01.01</p>
		<p  style="float:right;font-size:small;font-weight:bold">1,200,000,000</p>
	</div>
</div>
</li> */
	$(document).ready(function() {
		nowPages = 1;
		totalPages = 1;
		visiblePages = 5;

		page_st = 1;
		page_end = 5;
		pageSize = 10;
		
		getDashboard();
		
		tabs.tabs({
			activate: function(event, ui){
				//패널 초기화 후 재조회
				ui.newPanel[0].innerHTML = ""
				
				searchDealDashboard(ui.newTab.attr("aria-controls"));
			}
		})
	});
		//transactionGet('/login/user','',searchMenu);
		function getDashboard() {
			var obj = {};
			obj.grp_cd = "DEAL_BIZ_TYPE";
			$.get({
				url : '/dealDashboard/DealTabSearch',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {
					/* var div = document.querySelector("select[id='epr_biz_type']")
					var html = '<option selected="selected" value="0">선택</option>';
					$.each(o,function(i, val) {
										html += '<option value="' + val.grp_dtl_cd
												+ '">'+val.grp_dtl_name;
										
										html += '</option>';
									});
					div.innerHTML = html;
					var epr_no = document.getElementById("epr_no").value;
					if(!isEmpty(epr_no)){
						searchEprDtl();
					} */
					addTab(data);

				},
				error : function(request, status, error) {
				}
			});
		}
		 // 탭 추가
        function addTab(data){
        	var activeId = "";
        	$.each(data,function(i, val) {
	            // 탭 라벨 선언
	            var label = val.grp_dtl_name;
	            // id 값을 grp_dtl_cd 로 선언
	            id =  val.grp_dtl_cd;
	            // rel : link의 속성 중 rel을 찾는다 (ajax로 탭에 보여줄 내용을 가져올 html의 주소가 들어간다)
	            var rel = "/dealDashboard/DealDashboardSearch";
	            // li replace
	            var li = $( tabTemplate.replace( /#\{href\}/g, "#" + id ).replace( /#\{label\}/g, label ) );
	            // tab내용 선언
	            var tabContentHtml = $("<div class='tab-pane' id='"+id+"'></div>");
	            if(i == 0){
	            	li.addClass("active");
	            	activeId = id;
	            }
	            
	            // 탭의 ui-tabs-nav 찾아서 li를 append 시킨다
	            tabs.find(".nav-tabs").append(li);
	            // 추가된 탭의 내용을 삽입
	            tabs.find(".tab-content").append(tabContentHtml);
	           // tabs.append( "<div id='" + id + "'><p>" + tabContentHtml + "</p></div>" );
	            
	            // 생성 된 탭으로 바로 가게 한다.
	            //tabs.tabs( "option", "active", $("#tab_header").index());
        	});
        	// 탭 새로고침
            tabs.tabs( "refresh" );
           	//$('ul.tabs li').removeClass('active');
    		/* $(tabs.find(".tab-pane")[0]).addClass("active");
    		$(tabs.find(".tab-pane")[0]).css("display","block");
    		$(tabs.find(".tab-pane")[0]).attr("aria-hidden","false"); */
    		tabs.tabs("option","active",0);
    		
           //	activeId =  $(tabs.find(".tab-pane")[0]).attr("id");
    		//searchDealDashboard(activeId);
        }
		 
		function searchDealDashboard(id){
			var obj = {};
			if(isEmpty(id)){
				id = tabs.find(".active").attr("aria-controls");
			}
			$("#"+id)[0].innerHTML = "";
			obj.proc_type = "PROC_TYPE";
			obj.biz_type = id;
			$.get({
				url : '/dealDashboard/DealDashboardSearch',
				data : obj,
				async : 'true',
				cache : false,
				success : function(data) {
					$("#"+id).append(lineTemplate);
					$.each(data.dealDashboardList,function(i, val) {
						var appendLi = $(procTemplate.replace( /#\{id\}/g, val.grp_dtl_cd ).replace(/#\{label\}/g, val.grp_dtl_name).replace( /#\{count\}/g, val.cnt ).replace(/#\{value\}/g, val.value));
						if(data.dealDashboardList.length==i+1){
							var tmp = appendLi.find('.circle');
							tmp.removeClass('circle');
							tmp.addClass('circle_last');
						}
						
						$("#"+id).find('.ulLine').append(appendLi);
					});
					var div = $("<div></div>");
					$.each(data.dealList,function(i, val) {
						var appendBox = $(boxTemplate.replace( /#\{biz_type_name\}/g, val.biz_type_name ).replace(/#\{deal_name\}/g, val.deal_name).replace( /#\{emp_name\}/g, val.emp_name ).replace(/#\{con_dt\}/g, val.con_dt).replace(/#\{exp_pri\}/g, val.exp_pri));
						//div.append(appendBox);
						//$("#"+val.proc_type).append(appendBox);
						$("#"+id).find('#'+val.proc_type).append(appendBox);
					});
					

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
		//등록화면 이동
		function registDealInv(){
			//alert("call Content_NoticeBoard!!");
			//최상위 메인프레임의 경로를 등록화면으로 이동
			parent.document.getElementById("main_frame").src = "/deal/DealRegist";
		}
		function grid_table_deal(obj) {
			var div = document.querySelector('#deal_list');
			var html = '';
			$.each(obj.dealList, function(i, val) {
								html += '<tr onClick="view_deal(' + val.deal_no
										+ ')">';
								html += '<td style="text-align: center;font-weight:100;">'+ val.deal_type_name	+ '</td>';
								html += '<td style="text-align: center;font-weight:100;">' + val.epr_name	+ '</td>';
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
		function view_deal(deal_no){
			parent.document.getElementById("main_frame").src = "/deal/DealRegist?deal_no="+deal_no;
		}
		function searchDeal(page_st, page_end){
			var obj = {};
			var url = "";
			obj.page_st = page_st;
			obj.page_end = page_end;
			obj.before_date = $("input[id='before_date']")[0].value.replaceAll("-","");
			obj.after_date = $("input[id='after_date']")[0].value.replaceAll("-","");
			obj.deal_name = $("input[id='deal_name']")[0].value;
			obj.deal_type = $("select[id='deal_type']")[0].value;
			obj.dept_Name = $("select[id='dept_name']")[0].value;
			obj.corp_name = $("input[id='corp_name']")[0].value;
			obj.biz_type = $("select[id='biz_type']")[0].value;
			obj.deal_type = $("select[id='deal_type']")[0].value;
			obj.emp_name = $("input[id='emp_name']")[0].value;
			url = "/deal/SearchDeal";
			
			transactionPost(url,obj,grid_table_deal);
		}
	</script>
</body>
</html>