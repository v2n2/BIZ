<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Left side column. contains the logo and sidebar -->
	<style>
  .sidebar-menu::-webkit-scrollbar {
    width: 5px;
  }
  .sidebar-menu::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 5px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .sidebar-menu::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 5px;
    box-shadow: inset 0px 0px 5px white;
  }
</style>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel" style="height:60px;">
			<div class="" style="text-align:center;color:#b8c7ce;">
				<p style="margin:0;"><%=session.getAttribute("sessionNAME")%>님 환영 합니다.
				</p>
				<a href="#" style=""><i class="fa fa-circle text-success"></i>Online</a>
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree" id="trv_main" style="height:700px;overflow-y:auto">
		
			<%-- <li class="header">메인</li>
			<li><a href="javascript:Content_Dashboard();"><i
					class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
			<li class="header">캠페인 수행</li>
			<li><a href="javascript:Content_AutoOrder();"><i
					class="fa fa-circle-o text-aqua"></i> <span>캠페인 AI 분석</span></a></li>
			<li class="header">캠페인 조회</li>
			<!-- <li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>캠페인 목록</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a
						href="/iframe/Pretreatment"><i
							class="fa fa-circle-o"></i></a></li>
				</ul></li> -->
			<li><a href="javascript:Content_Pretreatment();"><i
					class="fa fa-circle-o text-aqua"></i> <span>AI 분석 캠페인 목록</span></a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>AI 분석 결과 조회</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<!-- <li class="active"><a
						href="javascript:Content_PretreatmentResult();"><i
							class="fa fa-circle-o"></i>AI 전처리 결과</a></li> -->
					<!-- <li class="active"><a href="javascript:Content_Learning();"><i
							class="fa fa-circle-o"></i>캠페인 AI 학습 결과</a></li> -->
					<li class="active"><a href="javascript:Content_RunForecastResult();"><i
							class="fa fa-circle-o"></i>캠페인 AI 예측 결과</a></li>
				</ul></li>
			<!-- <li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>AI 캠페인 대상자 선정</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="/iframe/RunForecast"><i
							class="fa fa-circle-o"></i>AI 대상자 로딩</a></li>
				</ul></li> -->
			<li class="header">부가 기능</li>
				<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
					<span>통계기능</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a
						href="javascript:Content_Statistics_m1();"><i
							class="fa fa-circle-o"></i>기존캠페인 성공률</a></li>
					<li class="active"><a
						href="javascript:Content_Statistics_m2();"><i
							class="fa fa-circle-o"></i>AI캠페인 예측률</a></li>
					<li class="active"><a
						href="javascript:Content_Statistics_m3();"><i
							class="fa fa-circle-o"></i>AI캠페인 실질반응</a></li>
				</ul></li>
			<li><a href="javascript:Content_NoticeBoard();"><i
					class="fa fa-book"></i> <span>게시판(Q&amp;A)</span></a></li>
			<%
				if (session.getAttribute("sessionROLE").equals("0")) {
			%>
			<li class="treeview"><a href="#"> <i class="fa fa-share"></i>
					<span>관리자 기능</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="javascript:Content_NoticeMgr();"><i
							class="fa fa-circle-o"></i>공지사항 관리</a></li>
					<li class="active"><a href="javascript:Content_UserMgr();"><i
							class="fa fa-circle-o"></i>계정 관리</a></li>
				</ul> <%
 	}
 %></li> --%>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>