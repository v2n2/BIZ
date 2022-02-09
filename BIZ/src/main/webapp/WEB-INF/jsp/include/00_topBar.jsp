<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Top bar -->
<header class="main-header">
	<!-- Logo -->
	<a href="/main" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>CRM</b>사업팀</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>법인 CRM</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Tasks: style can be found in dropdown.less -->
				<li class="dropdown tasks-menu"><a onclick="Logout();"
					class="dropdown-toggle" data-toggle="dropdown"> <label>로그아웃</label>
				</a></li>
			</ul>
		</div>
	</nav>
</header>
<script>

	function Logout() {
		var result = confirm("Logout 진행 하시겠습니까? ");
		if (result) {
			window.location.href = "/logout";
		} else {
			result;
		}
	}
</script>