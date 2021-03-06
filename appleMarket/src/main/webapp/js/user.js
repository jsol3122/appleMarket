	var writeForm = document.querySelector('#writeForm');
	var id_valid = /^[a-zA-Z0-9]{5,20}$/;
	var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	var email_valid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var tel_valid = /^[0-9]{3,4}$/;
// 회원가입 유효성 검사
$('#writeBtn').click(function(){
	// 공백 체크
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
		writeForm.querySelector("#member_rePwd").value = '';
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

// 회원가입 유효성 검사
$('#userchangBtn').click(function(){
	// 공백 체크
	
	writeForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	writeForm.querySelector('#member_rePwd').placeholder = '비밀번호를 한번 더 입력해주세요';
	writeForm.querySelector('#member_email').placeholder = '예: appleMarket@gmail.com';
	
	writeForm.querySelector('#member_id').classList.remove("placeholderColor");
	writeForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_rePwd').classList.remove("placeholderColor");
	writeForm.querySelector('#member_email').classList.remove("placeholderColor");
	
	if(!pwd_valid.test(writeForm.querySelector('#member_pwd').value)){
		writeForm.querySelector("#member_pwd").value = '';
		writeForm.querySelector("#member_pwd").placeholder = "비밀번호는 문자와 숫자를 혼용하여 8자 이상 입력해주세요";
		writeForm.querySelector('#member_pwd').classList.add("placeholderColor");
	}else if(writeForm.querySelector("#member_pwd").value != writeForm.querySelector("#member_rePwd").value){
		writeForm.querySelector("#member_rePwd").value = '';
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
		 $.ajax({
				url:'/appleMarket/checkPwd'
				,type:'post'
				,data:  'member_id='+$('#member_id').val()+'&member_beforepwd='+$('#member_beforepwd').val()
				,success:function(data){
					console.log(JSON.stringify(data));
					
					if(data.pwdCheck==1){
						
						$.ajax({
							url: '/appleMarket/modify',
							type: 'post',
							data: $('#writeForm').serialize(),				
							success: function(){
								alert('정보를 수정하였습니다.');
							
							},
							error: function(err){
								console.log(err);
							}
						});
					}else if(data.pwdCheck==0){
						
						writeForm.querySelector("#member_beforepwd").value = '';
						writeForm.querySelector("#member_beforepwd").placeholder = "이전 비밀번호와 맞지 않습니다.";
						writeForm.querySelector('#member_beforepwd').classList.add("placeholderColor");
					}else if(data.pwdCheck==2){
						
						alert("서버상태가 좋지않으니 다시 실행해주세요");
					}
				}
				,error:function(err){
					console.log(err);
				}
			});
	
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
			url: '/appleMarket/user/checkId',
			type: 'post',
			data: 'member_id='+$('#member_id').val(),
			dataType: 'text',
			success: function(data){
			writeForm.querySelector('#id_valid').classList.remove('hidden');
				if(!data){
					$('#id_valid').val('사용 가능한 아이디 입니다');
					$('#id_valid').css('color', 'blue');
					$('#checked_id').val(writeForm.querySelector("#member_id").value);
					
				}else if(data){ // 가능한 아이디값 hidden인풋창에 저장
					$('#id_valid').val('사용 불가능한 아이디 입니다');
					$('#id_valid').css('color', 'tomato');
					$('#checked_id').val('false');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

// 이메일 중복 체크
$('#member_email').on("focusout",function(event){
	//$(this).css("backgroundColor","red");		
		$.ajax({
			url: '/appleMarket/emailChk',
			type: 'post',
			data: 'member_email='+$('#member_email').val(),
			dataType: 'text',
			success: function(data){				
			if(data == 1){		
			writeForm.querySelector("#member_email").value = '';
			writeForm.querySelector("#member_email").placeholder = "사용 불가능한 이메일 입니다.";
			writeForm.querySelector('#member_email').classList.add("placeholderColor");
			}
			},
			error: function(err){
				console.log(err);
			}
		});
});


// 휴대폰 본인 인증
var timer = null;
var isRunning = false;
$("#tel_chk").click(function(e){
	
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
		
	if(!tel_valid.test(writeForm.querySelector('#member_tel2').value)){
			writeForm.querySelector("#member_tel2").value = '';
			writeForm.querySelector("#member_tel2").placeholder = "숫자만 입력";
			writeForm.querySelector('#member_tel2').classList.add("placeholderColor");
		}else if(!tel_valid.test(writeForm.querySelector('#member_tel3').value)){
			writeForm.querySelector("#member_tel3").value = '';
			writeForm.querySelector("#member_tel3").placeholder = "숫자만 입력";
			writeForm.querySelector('#member_tel3').classList.add("placeholderColor");
		}else{
		
		// 숨겨놨던 인증번호 관련 3개 띄우기
		writeForm.querySelector('#phone2').classList.remove('hidden');
		writeForm.querySelector('#timer').classList.remove('hidden');
		writeForm.querySelector('#tel_valid').classList.remove('hidden');
		$.ajax({
			url: '/appleMarket/phoneCheck',
			type: 'get',
			data: 'phone='+$('#member_tel1').val()+$('#member_tel2').val()+$('#member_tel3').val(),
			success: function(){
				console.log('인증번호 전송 완료');
			},
			error: function(err){
				console.log(err);
			}
		});
	}
	
});
    
function startTimer(count, display) {
	var minutes, seconds;
    timer = setInterval(function () {
		minutes = parseInt(count / 60, 10);
		seconds = parseInt(count % 60, 10);
	
		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;
 
    	$('.time').val(minutes + ":" + seconds);
 
        // 타이머 끝
        if (--count < 0) {
	     clearInterval(timer);
	     $('#phone2').val("시간초과");
		 writeForm.querySelector('#tel_valid').classList.add('hidden');
	     isRunning = false;
        }
    }, 1000);
    isRunning = true;
}
//휴대폰인증번호 버튼
$('#tel_valid').click(function(){

//중복체크 여기서
	$.ajax({
		url: '/appleMarket/phoneCheckNum',
		type: 'post',
		data: 'phone2='+$('#phone2').val()+'&phone='+$('#member_tel1').val()+$('#member_tel2').val()+$('#member_tel3').val(),
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
/*recommend_id 주소값 추출  */
function get_query(){ 
	  var url = document.location.href; 
	  var qs = url.substring(url.indexOf('?') + 1).split('&'); 
	  for(var i = 0, result = {}; i < qs.length; i++){
	       qs[i] = qs[i].split('='); 
	       result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
	  } 
	  return result; 
}

$(function(){
	  var result = get_query();
	  $('#recommend_id').attr('value',result.recommend_id);
  
});

	