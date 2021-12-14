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
   <div id="modal-content">
   
      <div class="modal-body"> <!-- modal body -->
         <form id="loginForm">
            <h3>로그인</h3>
            <hr>
            <br>
            <br>
            <div>
               <input type="text" id="member_id" name="member_id" class="loginInput" placeholder="아이디를 입력해주세요" style="width:350px; height:45px;"/>
            </div>
            <div>
               <input type="password" id="member_pwd" name="member_pwd" class="loginInput" placeholder="비밀번호를 입력해주세요" style="width:350px; height:45px;"/>
            </div>
            <div>
         <!--크롬은 resizeable 적용 안됨  -->
            <a href="/appleMarket/searchIdPwdForm" onclick="window.open(this.href, '_blank', 'width=400, height=500,scrollbars=no, resizable=no,toolbars=no, menubar=no'); return false;">아이디 찾기|비밀번호 찾기</a>
            </div>
            <div style="padding:0 5px;">
               <input type="button" value="로그인" class="sbm" id="loginBtn" style="cursor:pointer;"/>
               <input type="button" value="카카오톡 로그인" id="kakao_login" onclick="kakaoLogin();" href="javascript:void(0)"  style="cursor:pointer;"/>
               <br>
               <div id="loginResult"></div>
            </div>
            
        

         </form>
       </div>
      <br>
      <br>
   </div> <!-- section -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//로그인 유효성 검사   
$('#loginBtn').click(function(){
   var loginForm = document.querySelector('#loginForm');
   var id = document.querySelector('#member_id').value;
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
               console.log(JSON.stringify(data));
               
              if(data.login==1 && data.loginGPS==1){                 
                 alert(id+"님 반갑습니다.");
                  location.href="/appleMarket/index";      
                
               }else if(data.login==1 && data.loginGPS==0){
                //var result = confirm("앗 지역인증 안하셨네요? 하실건가요?");
                 if(!confirm("앗 지역인증 안하셨네요? 하실건가요?")){
                     alert('앗 아쉽네요. 지역등록을 해야 원활한 서비스 이용이 가능합니다 😭😭');
                    location.href="/appleMarket/index";
                  }else{
                     window.open("http://localhost:8080/appleMarket/view/location/map.jsp", '_blank', 'width=500, height=500');
                     location.href="/appleMarket/index";
                  }
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
</script>
</html>