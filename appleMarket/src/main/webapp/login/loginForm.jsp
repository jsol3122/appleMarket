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
         <input type="button"  value="로그인" class="sbm" id="loginBtn" style="cursor:pointer;"/>
          <input type="button" value="카카오톡 로그인" id="kakao_login" onclick="kakaoLogin();" href="javascript:void(0)"  style="cursor:pointer;"/>
         </div>
         <div id="loginResult">
           
            <!-- 로그아웃 기능 구현시 아래 코드 사용  -->
          <!-- <ul>
            <li onclick="kakaoLogout();">
            <a href="javascript:void(0)">
            <span>카카오 인증 취소</span>
            </a>
            </li>
         </ul>    -->
      </form>
      <br>
      <br>
   </section> <!-- section -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	               $('#loginResult').text('로그인 실패');
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