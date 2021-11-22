<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">
</head>
<body>
	<section id="sectionLogin">
		<form id="loginForm">
			<h1>로그인</h1>
			<hr>
			<br>
			<br>
			<div>
				<input type="text" id="member_id" name="member_id" placeholder="아이디를 입력해주세요"/>
			</div>
			<div>
				<input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력해주세요"/>
			</div>
			<div>
				<input type="button" value="로그인" class="sbm" id="loginBtn"/>
			</div>
			<div>
				<input type="button" value="카카오톡 로그인" id="kakao_login"/>
			</div>
			<div>
				<input type="button" value="구글 로그인" id="google_login"/>
			</div>
		</form>
		<br>
		<br>
	</section> <!-- section -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/user.js"></script>
</html>