//회원가입
$('#writeBtn').click(function(){
	
	$('#nameDiv').empty(); 
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').html("아이디를 입력하세요");
	}else if($('#id').val() == ''){
		$('#idDiv').html("아이디를 입력하세요");
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').html("비밀번호를 입력하세요");
	}else{
	
		$.ajax({
			url: '/chapter06_SpringWebMaven/user/write',
			type: 'post',
			data: $('#writeForm').serialize(),
			success:function(){//dataType없어서 success에서 받을 data가 없다.
				alert("회원 가입 등록");
			},error:function(err){
				console.log(err);
			}
		});
	}
});

//중복체크 - 포커스 아웃
$('#id').focusout(function(){
	
	$('#idDiv').empty();

	if($('#id').val() == ''){
		$('#idDiv').html("아이디를 입력하세요");
	}else{
		$.ajax({//화면 이동x[갔다가 다시 돌아와야 한다 - spring에서는 @ResponseBody가 붙어야 한다.]
			url:'/chapter06_SpringWebMaven/user/checkId',
			type: 'post', 
			data: 'id=' + $('#id').val(),//서버로 보낼 데이터 {'id' : $('#id').val()} -- jason 타입 
			dataType: 'text',//서버로 부터 받을 데이터 자료형 - exist (사용불가능) non_exist (사용가능)
			success: function(data){
				if(data == 'exist') {
					$('#idDiv').text('사용 불가능'); 
				}else if(data == 'non_exist'){
					$('#idDiv').text('사용 가능');
				}
			},
			error:function(err){
				console.log(err);
			}	
		
		});
	}
});

	