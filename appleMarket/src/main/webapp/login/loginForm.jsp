<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">
<meta name="google-signin-client_id" content="618037962343-sbg29ei4a6dcd9acrv01ndougru7va1b.apps.googleusercontent.com">
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
				<input type="button" value="카카오톡 로그인" id="kakao_login" onclick="kakaoLogin();" href="javascript:void(0)"  style="cursor:pointer;"/>
				<!-- 로그아웃 기능 구현시 아래 코드 사용  -->
		 		<ul><!-- 
					<li onclick="kakaoLogin();">
				      <a href="javascript:void(0)">
				          <span>카카오 로그인</span>
				      </a>
					</li> -->
					<li onclick="kakaoLogout();">
				      <a href="javascript:void(0)">
				          <span>카카오 로그아웃</span>
				      </a>
					</li>
			</ul>
			</div>	
				<ul>
				 <li id="GgCustomLogin">
				  <a href="javascript:void(0)">
				   <span>Login with Google</span>
				  </a>
				 </li>
				</ul>
			<div id="GgCustomLogin">
				<input type="button" value="구글 로그인" id="google_login" class="g-signin2" data-onsuccess="onSignIn" style="cursor:pointer;"/>
			</div>
			
			 <!-- <input type="button" value="구글 로그인"id="google_login"/> -->
		</form>
		<br>
		<br>
	</section> <!-- section -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//로그인 유효성 검사   
$('#loginBtn').click(function(){
   var loginForm = document.querySelector('#loginForm');
   
   loginForm.querySelector('#member_id').classList.remove("placeholderColor");
   loginForm.querySelector('#member_pwd').classList.remove("placeholderColor");

   if(loginForm.querySelector("#member_id").value=="")
      loginForm.querySelector('#member_id').classList.add("placeholderColor");
   else if(loginForm.querySelector("#member_pwd").value=="")
      loginForm.querySelector('#member_pwd').classList.add("placeholderColor");
   else loginForm.submit();
});
//구글 로그인 함수
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
      // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
      // 인스턴스의 함수 호출 - element에 로그인 기능 추가
      // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
  	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
      // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyAXMvTIIcUNy28-VBtYzjByJD7C9xPL7_I ', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
      //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
/*
//구글 로그인 인증
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}*/
	
Kakao.init('d3c8b329c0894ae4a9c4d564f7e0315f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  

</script>

</html>