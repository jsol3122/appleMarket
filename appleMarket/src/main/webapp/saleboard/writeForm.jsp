<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form id="writeForm">
	<img alt="애플마켓" src="/chapter06_SpringMaven/image/AppleMarket.png" width="200" height="200"
		onclick="location.href='/chapter06_SpringMaven/index.jsp'" style="cursor: pointer;">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">이름</td>
			<td>
				<input type="text" id="name" name="name">
				<div id="nameDiv"></div>
			</td>
		</tr>
			
		<tr>
			<td width="100" align="center">아이디</td>
			<td>
				<input type="text" id="id" name="id">
				<div id="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">비밀번호</td>
			<td>
				<input type="password" id="pwd" name="pwd">
				<div id="pwdDiv"></div>
			</td>
		</tr>
			
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="writeBtn" value="회원가입">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/chapter06_SpringMaven/js/user.js"></script>
</body>
</html>