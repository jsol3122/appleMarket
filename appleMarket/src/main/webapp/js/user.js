// 회원가입 유효성 검사
$('#writeBtn').click(function(){
	// 공백 체크
	var writeForm = document.querySelector('#writeForm');
	
	writeForm.querySelector('#member_id').placeholder = '5자 이상 입력해주세요';
	writeForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	writeForm.querySelector('#member_rePwd').placeholder = '비밀번호를 한번 더 입력해주세요';
	writeForm.querySelector('#member_email').placeholder = '예: appleMarket@gmail.com';
	
	writeForm.querySelector('#member_id').classList.remove("placeholderColor");
	writeForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_rePwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_email').classList.remove("placeholderColor");
	

	if(writeForm.querySelector("#member_id").value == ''){
		writeForm.querySelector("#member_id").placeholder = "아이디를 입력하세요";
		writeForm.querySelector('#member_id').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_pwd").value==""){
		writeForm.querySelector('#member_pwd').placeholder = "비밀번호를 입력하세요";
		writeForm.querySelector('#member_pwd').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_pwd").value != writeForm.querySelector("#member_rePwd").value){
		writeForm.querySelector('#member_rePwd').placeholder = "동일한 비밀번호를 입력해주세요";
		writeForm.querySelector('#member_rePwd').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_email").value==""){
		writeForm.querySelector('#member_email').placeholder = "이메일을 입력하세요";
		writeForm.querySelector('#member_email').classList.add("placeholderColor");
	}else { // 형식 체크
		var id_valid = /^[a-zA-Z0-9]{5,20}$/
		var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8.30}$/;
		var email_valid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_valid = /^[0-9]+/g;
		
		if(!id_valid.test(writeForm.querySelector('#member_id'))){
			writeForm.querySelector("#member_id").innerText = '';
			writeForm.querySelector("#member_id").placeholder = "아이디는 5자 이상 입력해주세요";
			writeForm.querySelector('#member_id').classList.add("placeholderColor");
			return false;
		}
		
		if(!pwd_valid.test(writeForm.querySelector('#member_pwd'))){
			writeForm.querySelector("#member_pwd").innerText = '';
			writeForm.querySelector("#member_pwd").placeholder = "비밀번호는 문자와 숫자를 혼용하여 8자 이상 입력해주세요";
			writeForm.querySelector('#member_pwd').classList.add("placeholderColor");
			return false;
		}
		
		if(!email_valid.test(writeForm.querySelector('#member_email'))){
			writeForm.querySelector("#member_email").innerText = '';
			writeForm.querySelector("#member_email").placeholder = "이메일 형식에 맞게 입력해 주세요";
			writeForm.querySelector('#member_email').classList.add("placeholderColor");
			return false;
		}
		
		if(!tel_valid.test(writeForm.querySelector('#member_tel2'))){
			writeForm.querySelector("#member_tel2").innerText = '';
			writeForm.querySelector("#member_tel2").placeholder = "휴대폰 번호는 숫자만 입력 가능합니다";
			writeForm.querySelector('#member_tel2').classList.add("placeholderColor");
			return false;
		}
		
		if(!tel_valid.test(writeForm.querySelector('#member_tel3'))){
			writeForm.querySelector("#member_tel3").innerText = '';
			writeForm.querySelector("#member_tel3").placeholder = "휴대폰 번호는 숫자만 입력 가능합니다";
			writeForm.querySelector('#member_tel3').classList.add("placeholderColor");
			return false;
		}
		
		// 아이디 중복체크 여부 & 본인인증 여부 확인 후 submit
	}
});

// 아이디 중복 체크
$('#id_chk').click(function(){
	window.open("/appleMarket/user/checkId", "아이디중복체크", "width=500 height=500 top=200 left=700");
});

// 휴대폰 본인 인증
$('#tel_chk').click(function(){
	window.open("/appleMarket/user/phone", "휴대폰본인인증", "width=500 height=500 top=200 left=700");
});

// 우편번호 검색
$('#addr_chk').click(function(){
	window.open("/appleMarket/user/addr", "우편번호검색", "width=500 height=500 top=200 left=700");
});
	
// 로그인 유효성 검사	
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