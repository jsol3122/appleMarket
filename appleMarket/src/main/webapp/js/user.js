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
		if($('#checked_id').val() == false) {
			$('#id_valid').show();
			$('#id_valid').value = '아이디 중복확인이 필요합니다';
			return false;
		}
		if($('#checked_user').val() == false) {
			$('#user_valid').show();
			$('#user_valid').value = '본인인증을 완료해 주세요';
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
	}else{
		$.ajax({
			url: '/appleMarket/user/checkId',
			type: 'post',
			data: 'member_id='+$('#member_id').val(),
			dataType: 'text',
			success: function(data){
				alert("확인" + data);
				console.log(data);
				if(data =='exist'){
					$('#id_valid').text('사용 불가능한 아이디 입니다');
					$('#id_valid').style.color = 'tomato';
					$('#checked_id').text('false');
				}else if(data =='non_exist'){ // 가능한 아이디값 hidden인풋창에 저장
					$('#id_valid').text('사용 가능한 아이디 입니다');
					$('#id_valid').style.color = 'blue';
					$('#checked_id').text(writeForm.querySelector("#member_id").value);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});


// 휴대폰 본인 인증
$('#tel_chk').click(function(){
	var writeForm = document.querySelector('#writeForm');


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
	