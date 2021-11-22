<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">
</head>
<body>
    <form id="checkIdForm">
        <h1>아이디 중복 체크</h1>
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
    
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarketr/js/user.js"></script> 
</body>
</html>