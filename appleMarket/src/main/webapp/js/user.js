// 회원가입 유효성 검사
$('#writeBtn').click(function(){
	// 공백 체크
	var writeForm = document.querySelector('#writeForm');
	var id_valid = /^[a-zA-Z0-9]{5,20}$/;
	var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	var email_valid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var tel_valid = /^[0-9]{3,4}$/;
	
	writeForm.querySelector('#member_id').placeholder = '5자 이상 입력해주세요';
	writeForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	writeForm.querySelector('#member_rePwd').placeholder = '비밀번호를 한번 더 입력해주세요';
	writeForm.querySelector('#member_email').placeholder = '예: appleMarket@gmail.com';
	
	writeForm.querySelector('#member_id').classList.remove("placeholderColor");
	writeForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_rePwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_email').classList.remove("placeholderColor");
	

	if(!id_valid.test(writeForm.querySelector('#member_id').value)){
		writeForm.querySelector("#member_id").value = '';
		writeForm.querySelector("#member_id").placeholder = "아이디는 5자 이상 입력해주세요";
		writeForm.querySelector('#member_id').classList.add("placeholderColor");
	}else if(!pwd_valid.test(writeForm.querySelector('#member_pwd').value)){
		writeForm.querySelector("#member_pwd").value = '';
		writeForm.querySelector("#member_pwd").placeholder = "비밀번호는 문자와 숫자를 혼용하여 8자 이상 입력해주세요";
		writeForm.querySelector('#member_pwd').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_pwd").value != writeForm.querySelector("#member_rePwd").value){
		writeForm.querySelector('#member_rePwd').placeholder = "동일한 비밀번호를 입력해주세요";
		writeForm.querySelector('#member_rePwd').classList.add("placeholderColor");
	}else if(!email_valid.test(writeForm.querySelector('#member_email').value)){
		writeForm.querySelector("#member_email").value = '';
		writeForm.querySelector("#member_email").placeholder = "이메일 형식에 맞게 입력해 주세요";
		writeForm.querySelector('#member_email').classList.add("placeholderColor");
	}else if(!tel_valid.test(writeForm.querySelector('#member_tel2').value)){
		writeForm.querySelector("#member_tel2").value = '';
		writeForm.querySelector("#member_tel2").placeholder = "숫자만 입력";
		writeForm.querySelector('#member_tel2').classList.add("placeholderColor");
	}else if(!tel_valid.test(writeForm.querySelector('#member_tel3').value)){
		writeForm.querySelector("#member_tel3").value = '';
		writeForm.querySelector("#member_tel3").placeholder = "숫자만 입력";
		writeForm.querySelector('#member_tel3').classList.add("placeholderColor");
	}else{
	
		// 아이디 중복체크 여부 & 본인인증 여부 확인 후 submit
		if($('#checked_id').val() == false || $('#checked_id').val() == '') {
			writeForm.querySelector('#id_valid').classList.remove('hidden');
			$('#id_valid').css('color', 'tomato');
			$('#id_valid').val('아이디 중복확인이 필요합니다');
			return false;
		}
		if($('#checked_user').val() == false || $('#checked_user').val() == '') {
			writeForm.querySelector('#user_valid').classList.remove('hidden');
			$('#user_valid').css('color', 'tomato');
			$('#user_valid').val('본인인증을 완료해 주세요');
			return false;
		}
		writeForm.submit();
	}
});

// 아이디 중복 체크
$('#id_chk').click(function(){
	var writeForm = document.querySelector('#writeForm');

	if(writeForm.querySelector("#member_id").value == ''){ // 공백 먼저 체크
		writeForm.querySelector("#member_id").placeholder = "아이디를 입력하세요";
		writeForm.querySelector('#member_id').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_id").value.length < 5){
		writeForm.querySelector("#member_id").value = '';
		writeForm.querySelector("#member_id").placeholder = "아이디는 5자 이상 입력해주세요";
		writeForm.querySelector('#member_id').classList.add("placeholderColor");
	}else{
		$.ajax({
			url: '/appleMarket/view/user/checkId',
			type: 'post',
			data: 'member_id='+$('#member_id').val(),
			dataType: 'text',
			success: function(data){
			writeForm.querySelector('#id_valid').classList.remove('hidden');
				if(data =='exist'){
					$('#id_valid').val('사용 불가능한 아이디 입니다');
					$('#id_valid').css('color', 'tomato');
					$('#checked_id').val('false');
				}else if(data =='non_exist'){ // 가능한 아이디값 hidden인풋창에 저장
					$('#id_valid').val('사용 가능한 아이디 입니다');
					$('#id_valid').css('color', 'blue');
					$('#checked_id').val(writeForm.querySelector("#member_id").value);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});


// 휴대폰 본인 인증
var timer = null;
var isRunning = false;
$("#tel_chk").click(function(e){
	var writeForm = document.querySelector('#writeForm');
	var display = $('.time');
	var leftSec = 180;
	// 남은 시간
	// 이미 타이머가 작동중이면 중지
	if (isRunning){
		clearInterval(timer);
		display.val("");
		startTimer(leftSec, display);
	}else{
		startTimer(leftSec, display);
	}
	$.ajax({
		url: '/appleMarket/view/user/phoneCheck',
		type: 'get',
		data: 'phone='+$('#member_tel1').val()+$('#member_tel2').val()+$('#member_tel3').val(),
		success: function(){
			console.log('인증번호 전송 완료');
		},
		error: function(err){
			console.log(err);
		}
	});
});
    
function startTimer(count, display) {
	var minutes, seconds;
    timer = setInterval(function () {
		minutes = parseInt(count / 60, 10);
		seconds = parseInt(count % 60, 10);
	
		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;
 
    	display.value(minutes + ":" + seconds);
 
        // 타이머 끝
        if (--count < 0) {
	     clearInterval(timer);
	     $('#phone2').val("시간초과");
	     $('#tel_valid').attr("disabled","disabled");
	     isRunning = false;
        }
    }, 1000);
    isRunning = true;
}

$('#tel_valid').click(function(){
	$.ajax({
		url: '/appleMarket/view/user/phoneCheckNum',
		data: 'phone2='+$('#phone2').val(),
		dataType: 'text',
		success: function(data){
			if(data == 'ok'){
				$('#checked_user').val('본인인증 완료');
				writeForm.querySelector('#user_valid').classList.remove('hidden');
				$('#user_valid').val('본인인증 완료');
			}else if(data == 'fail'){
				$('#checked_user').val('false');
				writeForm.querySelector('#user_valid').classList.remove('hidden');
				$('#user_valid').val('잘못된 번호입니다');
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});


// 우편번호 검색
$('#addr_chk').click(function(){
	window.open("/appleMarket/view/user/checkPost", "우편번호검색", "width=500 height=500 top=200 left=700");
});

$('#checkPostSearchBtn').click(function(){
	$.ajax({
		url: '/appleMarket/view/user/checkPostSearch',
		type: 'post',
		data: $('#checkPostForm').serialize(),
		dataType: 'json', 
		success: function(data){
			// alert(JSON.stringify(data)); -- 확인용
			
			$('#zipcodeTable tr:gt(2)').remove(); // 테이블에서 맨 위 3줄 빼고 나머지는 검색누를때마다 초기화
			
			$.each(data, function(index, items){
				var address = items.sido+' '
							+ items.sigungu+' '
							+ items.yubmyundong+' '
							+ items.ri+' '
							+ items.roadname+' '
							+ items.buildingname;
				
				// undefined라는 내용을 g(=global,전체)에서 찾아서 ''으로 바꾸기
				address = address.replace(/null/g, ''); 
				
				$('<tr/>').append($('<td/>',{ // td태그 안의 내용
					align: 'center',
					text: items.zipcode
				})).append($('<td/>',{
					colspan: 3,
				}).append($('<a/>',{
					href: '#',
					text: address,
					class: 'addressA'
				}))).appendTo($('#zipcodeTable'));
			}); // each
			
			// 주소 클릭하면 회원가입 폼으로 값 이동시키기
			$('.addressA').click(function(){ 
				addr = $(this).text().split(" ");
	
				$('#member_sido_sigungu', opener.document).val(addr[0]+' '+addr[1]); // 주소 넣기
				$('#member_dong', opener.document).val(addr[2]);
				$('#member_address', opener.document).val(addr[3]+' '+addr[4]+' '+addr[5]);
				window.close();
				$('#member_detailAddr', opener.document).focus();
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});
	