<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/userupdatapage.css">
    <title>사고팔고마켓</title>
    <style>
    .placeholderColor::-webkit-input-placeholder{
	color: tomato;
	}
    </style>
</head>
   <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>회원비밀번호변경</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" placeholder="아이디를 입력해주세요" />
                                </div>                                
                                <div class="memberupwrite">
                                    <label>새 비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>새 비밀번호확인 </label>
                                    <input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요" />
                                </div>
                                <input type="button" value="비밀변호변경" id="writeBtn" class="sbm" />
                            </form>
                            
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
$('#writeBtn').click(function(){
	var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	
	userUpdataForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	userUpdataForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	
	if(!pwd_valid.test(userUpdataForm.querySelector('#member_pwd').value)){
		userUpdataForm.querySelector("#member_pwd").value = '';
		userUpdataForm.querySelector("#member_pwd").placeholder = "비밀번호는 문자와 숫자를 혼용하여 8자 이상 입력해주세요";
		userUpdataForm.querySelector('#member_pwd').classList.add("placeholderColor");
	}else if(userUpdataForm.querySelector("#member_pwd").value != userUpdataForm.querySelector("#member_rePwd").value){
		userUpdataForm.querySelector("#member_rePwd").value = '';
		userUpdataForm.querySelector('#member_rePwd').placeholder = "동일한 비밀번호를 입력해주세요";
		userUpdataForm.querySelector('#member_rePwd').classList.add("placeholderColor");
	}else{
	$.ajax({

		url:'/appleMarket/changePwd',
		type:'post',
		data:'member_id='+$('#member_id').val()+'&member_pwd='+$('#member_pwd').val(),
		success: function(){			
			alert('비밀번호 변경을 완료하였습니다. 로그인 해주세요.');
			window.location.href="/appleMarket/index";
		},
		error:function(err){
			console.log(err)
			}
		});
	}
});
  
  
  </script>