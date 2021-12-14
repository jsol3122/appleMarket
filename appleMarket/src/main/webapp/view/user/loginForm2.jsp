<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user2.css">
<meta name="google-signin-client_id" content="618037962343-sbg29ei4a6dcd9acrv01ndougru7va1b.apps.googleusercontent.com">
</head>
<body>
	<div id="modal-content">
		<div class="modal-body"> <!-- modal body -->
	            <div class="button-wrap">
	                <div id="btn"></div>
	                <button type="button" class="togglebtn" onclick="login()"
	                style="padding-left: 25px; padding-right: 15px;">아이디찾기</button>
	                <button type="button" class="togglebtn" onclick="register()" 
	                style="padding-left: 0px; padding-right: 20px;">비밀번호 찾기</button>
	            </div>
            <form id="login" action="" class="input-group">
                <input type="text" id="member_id" name="member_id" class="loginInput" placeholder="이름을 입력해!" style="width:350px;height:45px;margin-left: 0px;"/>
				<input type="password" id="member_pwd" name="member_pwd" class="loginInput" placeholder="이메일 적어!" style="width:350px; height:45px;"/>

				<input type="button" value="아이디 찾기" class="sbm" id="loginBtn" style="cursor:pointer; width: 350px;"/>
            </form>
            <form id="register" action="" class="input-group">
	            <div class="first-hi" id="register-hi" style="display: none;">
	                <input type="text" id="member_id" name="member_id" class="loginInput" placeholder="이름을 입력해!" style="width:350px;height:45px;margin-left: 30px;"/>
					<input type="password" id="member_pwd" name="member_pwd" class="loginInput" placeholder="이메일 적어!" style="width:350px; height:45px;"/>
					<input type="password" id="member_pwd" name="member_pwd" class="loginInput" placeholder="아이디 적어!!" style="width:350px; height:45px;"/>
	
					<input type="button" value="비밀번호 찾기" class="sbm" id="loginBtn" style="cursor:pointer; width: 350px; margin-left: 30px;"/>
				</div>
            </form>
	      <form id="loginForm">
	            <!-- 로그아웃 기능 구현시 아래 코드 사용  -->
	          <!-- <ul>
	            <li onclick="kakaoLogout();">
	            <a href="javascript:void(0)">
	            <span>카카오 인증 취소</span>
	            </a>
	            </li>
	         </ul>    -->
	      </form>
	    </div>
      <br>
      <br>
   </div> <!-- section -->
   <script>
        var x = document.getElementById("login");
        var y = document.getElementById("register");
        var z = document.getElementById("btn");


        function login() {
        	$('#register-hi').show();
            x.style.left = "50px";
            y.style.left = "500px";
            z.style.left = "0";
        }

        function register() {
        	$('#register-hi').show();
            x.style.left = "-400px";
            y.style.left = "0px";
            z.style.left = "110px";
        }
    </script>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//로그인 유효성 검사   
$('#loginBtn').click(function(){
   var loginForm = document.querySelector('#loginForm');
   
   loginForm.querySelector('#member_id').classList.remove("placeholderColor");
   loginForm.querySelector('#member_pwd').classList.remove("placeholderColor");

   if(loginForm.querySelector("#member_id").value==""){
      loginForm.querySelector('#member_id').classList.add("placeholderColor");  
      $('#loginResult').html('아이디와 비밀번호를 정확히 입력해 주세요.');
      $('#loginResult').css('color', 'red');
      $('#loginResult').css('font-size', '10pt');
      $('#loginResult').css('font-weight', 'bold');
      $('#loginResult').css('text-align', 'center');
   }
   else if(loginForm.querySelector("#member_pwd").value=="")	   
      loginForm.querySelector('#member_pwd').classList.add("placeholderColor");
   else{
      $.ajax({
            url: '/appleMarket/login',
            type: 'post',
            data: 'member_id='+$('#member_id').val()+'&member_pwd='+$('#member_pwd').val(),
            //dataType: 'text',
            success: function(data){
               //alert(data);
               data = data.trim();         
              if(data==1){
                  location.href="/appleMarket/index";                  
               }else{
                  $('#loginResult').text('아이디 또는 비밀번호가 잘못 입력 되었습니다.아이디와 비밀번호를 정확히 입력해 주세요.');
                  $('#loginResult').css('color', 'red');
                  $('#loginResult').css('font-size', '15pt');
                  $('#loginResult').css('font-weight', 'bold');
               } 
            },
            error: function(err){
               console.log(err);
            }
            });
         
   }
});
   
Kakao.init('d3c8b329c0894ae4a9c4d564f7e0315f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그인
function kakaoLogin() {
	   	$.ajax({
	         url: '/appleMarket/login/getKakaoAuthUrl',
	         type: 'get',
	         //data: {'member_id' : id},
	         dataType: 'text',
	         success: function(data){
	        	 location.href = data;
	         },
	         error: function(err){
	            console.log(err);
	         }
	        });
}

$(document).ready(function() {
	
    var kakaoInfo = '${kakaoInfo}';
    if(kakaoInfo != ""){
        var data = JSON.parse(kakaoInfo);

        alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
        alert(
        "user : \n" + "email : "
        + data['email']  
        + "\n nickname : " 
        + data['nickname']);
    }
});  
  
//카카오로그아웃  
/* 
 
 function kakaoLogout() {
=======
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             console.log(response)
             alert('로그인 합니다.');
             location.href='/appleMarket/index.jsp';
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
>>>>>>> a93d96737d193454a44d622e534e34c0a3cd9cbc
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
<<<<<<< HEAD
  }   
*/

 


</script>

</html>