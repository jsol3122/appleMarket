<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">
</head>
<body>
    <form id="loginForm">
        <h3>아이디 찾기</h3>
        <hr>
        <br>
        <br>
        <label for="searchEmail">회원가입시 등록한 이메일주소를 입력해주세요</label>
        <div>
           <input type="text" id="searchEmail" name="member_email" />
           <input type="button" value="확인"  class="chk"/>
        </div>
        <div>
           <input type="password" id="member_pwd" name="member_pwd" class="loginInput" placeholder="비밀번호를 입력해주세요" style="width:350px; height:45px;"/>
        </div>
        <div>
            <a href="/appleMarket/view/user/searchId" onclick="window.open(this.href, '_blank', 'width=400, height=300'); return false;">아이디 찾기</a>
             | <a href="/appleMarket/view/user/searchPwd" onclick="window.open(this.href, '_blank', 'width=400, height=300'); return false;">비밀번호 찾기</a>
        </div>
        <div style="padding:0 5px;">
            <input type="button" value="로그인" class="sbm" id="loginBtn" style="cursor:pointer;"/>
            <input type="button" value="카카오톡 로그인" id="kakao_login" onclick="kakaoLogin();" href="javascript:void(0)"  style="cursor:pointer;"/>
            <br>
            <div id="loginResult"></div>
        </div>
     </form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/user.js"></script>
</body>
</html>