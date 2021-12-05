<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">

    <form>
        <h3>아이디 찾기</h3>
        <hr>
        <br>
        <br>
        <label for="searchEmail">회원가입시 등록한 이메일주소를 입력해주세요</label>
        <div>
           <input type="text" id="member_email" name="member_email" placeholder="email을 입력해주세요"/>
           <input type="button" id="chk" class="chk" value="확인"/>
           <div id="idchk"></div>
        </div>  
     </form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$('#chk').click(function(){

	if($('#member_email').val()==""){
		$('#idchk').html('이메일을 입력해주세요');
		$('#idchk').css('color', 'red');
	}else{
	
	$.ajax({
		url: '/appleMarket/searchId',
		type: 'post',
		data: 'member_email='+$('#member_email').val(),
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
</script>
