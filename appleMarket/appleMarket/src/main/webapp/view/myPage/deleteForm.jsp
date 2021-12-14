<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   						<div class="article">
                            <form class="memberuptext" id="userUpdataForm" >
                                <h3>회원탈퇴</h3>
                                <br>
                                <hr>
                                
                                
                                <div class="memberupwriteid">
                                	
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" readonly/>
                                </div>
                                <div class="memberupwrite">
                                    <label>비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호를 입력해주세요" />
                                </div>
                                <div><p align="center">※카카오 회원일 경우 비밀번호에 이메일 입력해주세요.</p></div>
                                <div class="memberupwrite">
                                    <label>비밀번호확인 </label>
                                    <input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요" />
                                </div>
                                <input type="button" value="탈퇴하기" id="writeBtn" class="sbm" />
                            </form>
                           </div>
                            
<script type="text/javascript">
$('#writeBtn').click(function(){
	var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	
	userUpdataForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	userUpdataForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	
	if(userUpdataForm.querySelector("#member_pwd").value != userUpdataForm.querySelector("#member_rePwd").value){
		userUpdataForm.querySelector("#member_rePwd").value = '';
		userUpdataForm.querySelector('#member_rePwd').placeholder = "동일한 비밀번호를 입력해주세요";
		userUpdataForm.querySelector('#member_rePwd').classList.add("placeholderColor");
	}else{
		var result = confirm("정말 탈퇴 하시겠습니까?");
		console.log(result);
		if(result){
		$.ajax({
			url:'/appleMarket/delete',
			type:'post',
			data:'member_id='+$('#member_id').val()+'&member_pwd='+$('#member_pwd').val(),
			success: function(){
				
				alert('탈퇴를 완료하였습니다. 사과마켓을 이용해주셔서 감사합니다.');
				window.location.href="/appleMarket/index";
			},
			error:function(err){
				console.log(err)
				}
			});
		}
	}
});
</script> 
     