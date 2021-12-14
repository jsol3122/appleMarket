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
	<body style="overflow-x: hidden">
	<div id="modal-content">
		<div class="modal-body"> <!-- modal body -->
	            <div class="button-wrap">
	                <div id="btn"></div>
	                <button type="button" class="togglebtn" onclick="login()"
	                style="padding-left: 25px; padding-right: 15px;">아이디찾기</button>
	                <button type="button" class="togglebtn" onclick="register()" 
	                style="padding-left: 15px; padding-right: 0px;">비밀번호 찾기</button>
	            </div>
	            
            <form id="login" action="" class="input-group">
                <input type="text" id="member_email2" name="member_email2" class="loginInput" placeholder="email을 입력해주세요" style="width:350px;height:45px;margin-left: 0px;"/>			
				<input type="button" value="아이디 찾기" class="sbm" id="loginBtn" style="cursor:pointer; width: 350px;"/>
				<div id="idchk"></div>
            </form>
            
            <form id="register" action="" class="input-group">
	            <div class="first-hi" id="register-hi" style="display: none;">
	                <input type="text" id="member_id" name="member_id" class="loginInput" placeholder="아이디를 입력해주세요" style="width:350px;height:45px;margin-left: 30px;"/>
					<input type="email" id="member_email" name="member_email" class="loginInput" placeholder="email을 입력해주세요" style="width:350px; height:45px;"/>			
					<input type="button" value="비밀번호 찾기" class="sbm" id="pwBtn" style="cursor:pointer; width: 350px; margin-left: 30px;"/>
					<div id="pwdchk"></div>
				</div>
            </form>
	    </div>
      <br>
      <br>
   </div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/* 이메일 찾기 */
$('#loginBtn').click(function(){

	if($('#member_email2').val()==""){
		$('#idchk').html('이메일을 입력해주세요');
		$('#idchk').css('color', 'red');
	}else{
	
	$.ajax({
		url: '/appleMarket/searchId',
		type: 'post',
		data: 'member_email='+$('#member_email2').val(),
		dataType: 'text',
		success: function(data){
			if(data =='non_exist'){
				$('#idchk').text('없는 아이디 입니다.');
				$('#idchk').css('color', 'red');
	
			}else{ 				
				$('#idchk').text('회원님의 아이디는" '+data.slice(0,data.length-3)+'*** "입니다.');
				$('#idchk').css('color', 'red');		
			}
	},
	error: function(err){
		console.log(err);
			}
		});
	}
});
/* 비밀번호 찾기  */
$('#pwBtn').click(function(){
	
	if($('#member_id').val()==""){
		$('#pwdchk').html('아이디을 입력해주세요');
		$('#pwdchk').css('color', 'red');
	}else if($('#member_email').val()==""){
		$('#pwdchk').html('이메일을 입력해주세요');
		$('#pwdchk').css('color', 'red');
	}else{	
		
		
	$.ajax({
		url: '/appleMarket/searchPwd',
		type: 'post',
		data: $("#register").serialize(),
		dataType: "text",
		success: function(data){
			alert('이메일을 발송 하였습니다. 이메일을 확인하여 주세요!');
			if(data=="non_exist"){
				$('#pwdchk').text('아이디나 이메일이 맞지 않습니다.');
				$('#pwdchk').css('color', 'red');
	
			}else if(data=="exist"){ 				
				$('#pwdchk').text('이메일이 발송 되었습니다. 이메일을 확인해 주세요.');
				$('#pwdchk').css('color', 'blue');		
			} 
	},
	error: function(err){
		console.log(err);
			}
		});
	}
});
</script>
<script>
        var x = document.getElementById("login");
        var y = document.getElementById("register");
        var z = document.getElementById("btn");

		/* 이메일찾기 */
        function login() {
        	$('#register-hi').show();
            x.style.left = "50px";
            y.style.left = "500px";
            z.style.left = "0";
        }
		/* 비밀번호 찾기  */
        function register() {
        	$('#register-hi').show();
            x.style.left = "-400px";
            y.style.left = "0px";
            z.style.left = "110px";
        }
        
       
    </script>