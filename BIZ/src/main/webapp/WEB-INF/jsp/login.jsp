<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>법인CRM LOGIN</title>
<!-- css 파일 분리 
<link href='/resources/css/join_style.css' rel='stylesheet' style='text/css'/>
-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="./include/commonCss.jsp" />
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/iCheck/square/blue.css">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a><br>
			<!-- <img src="/resources/img/TargetAI_Logo.png"> -->
			<br>법인CRM</a>
			
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">로그인</p>
			<div class="form-group has-feedback">
				<input id="ADM_ID" name="ADM_ID" type="text" class="form-control"
					placeholder="아이디"> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input id="ADM_PW" name="ADM_PW" type="password"
					class="form-control" placeholder="비밀번호"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-8"></div>
				<!-- /.col -->
				<div class="col-xs-4">
					<button onclick="login_check();"
						class="btn btn-primary btn-block btn-flat">로그인</button>
				</div>
				<!-- /.col -->
			</div>
			<!-- <a href="#">비밀번호 찾기</a><br> -->
			<!-- <a href="register" class="text-center">회원가입</a> -->
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<!-- jQuery 3 -->
	<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#ADM_PW').keydown(function(key) {
				if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
					login_check();
				}
			});
		});

		var _response = $('#msg');
		function login_check() {
			var _response = $('#msg');
			var admin = new Object();
			admin.Emp_no = $('#ADM_ID').val();
			admin.Emp_password = $('#ADM_PW').val();
			$.get({
				url : '/login/proc',
				data : admin,
				cache : false,
				success : function(data, status, xhr) {
					if (data == "success") {
						location.href = "main";
					} else {
						alert(data[0]);
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					responseError(error);
					$('#msg').html(error);
				}
			});
		}
	</script>
</body>
</html>