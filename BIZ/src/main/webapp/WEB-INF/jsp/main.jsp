<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%
	if (session.getAttribute("sessionID") == null) {
		// 로그인 화면으로 이동
		response.sendRedirect("/login");
	}

	if (session.getAttribute("sessionROLE") == null) {
		session.setAttribute("sessionROLE", "1");
	}
%>
<meta charset="UTF-8">
<title>법인 CRM</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="./include/commonCss.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Top bar -->
		<jsp:include page="./include/00_topBar.jsp"/>
		<!-- Side Bar -->
		<jsp:include page="./include/20_sideBar.jsp"/>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<!--<section class="content">-->
				<iframe  id="main_frame" src="/include/Dashboard" width="100%" height="89%"></iframe>
			<!--</section>-->
			<!-- /.Main content -->
			<!-- /.content -->
		</div>
		<!-- Footer -->
		<jsp:include page="./include/90_footer.jsp"/>
	</div>
	<!-- ./wrapper -->
	<!-- 세션에서 로그인 사용자를 생성자 텍스트에 입력하려면 이 것을 사용해야 함 -->
	<input name="session_name" type="hidden">
	<jsp:include page="./include/commonJs.jsp" />
	<script src="/resources/js/common.js"></script>
	
<script type="text/javascript">
	var sessionName;
  
	$.get({
		url : '/login/menu',
		data : '',
		cache : false,
		success : function(data, status, xhr) {
			//data
			createMenu(data);
		}
		
	});
	function fn_menuOpen(url){
		document.getElementById("main_frame").src = url;
		
	}
  	function Content_Dashboard() {
		//alert("call Content_Dashboard!!");
		document.getElementById("main_frame").src = "/iframe/Dashboard";
	}
	
	function Content_AutoOrder() {
		//alert("call Content_AutoOrder!!");
		document.getElementById("main_frame").src = "/iframe/AutoOrder";
	}
	
	function Content_Pretreatment() {
		//alert("call Content_Pretreatment!!");
		document.getElementById("main_frame").src = "/iframe/Pretreatment";
	}
	
	function Content_PretreatmentResult() {
		//alert("call Content_PretreatmentResult!!");
		document.getElementById("main_frame").src = "/iframe/PretreatmentResult";
		//$("input[name='session_name']").val("Hansam");
	}
	function Content_Learning() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/iframe/Learning";
		//$("input[name='session_name']").val("Hansam");
	}
  
	function Content_RunForecast() {
		//alert("call Content_Learning!!");
		document.getElementById("main_frame").src = "/iframe/RunForecast";
	}
	
	function Content_RunForecastResult() {
		//alert("call Content_RunForecastResult!!");
		document.getElementById("main_frame").src = "/iframe/RunForecastResult";
		//$("input[name='session_name']").val("Hansam");
	}
	
	function Content_Statistics_m1() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m1";
		//$("input[name='session_name']").val("Hansam");
	}
	
	function Content_Statistics_m2() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m2";
		//$("input[name='session_name']").val("Hansam");
	}
	
	function Content_Statistics_m3() {
		//alert("call Content_Statistics!!");
		document.getElementById("main_frame").src = "/iframe/Statistics_m3";
		//$("input[name='session_name']").val("Hansam");
	}
	
	function Content_NoticeBoard() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/NoticeBoard";
	}
	
	function Content_NoticeMgr() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/admin/NoticeMgr";
	}
	
	function Content_UserMgr() {
		//alert("call Content_NoticeBoard!!");
		document.getElementById("main_frame").src = "/iframe/admin/UserMgr";
	}
	
  </script>
</body>
</html>