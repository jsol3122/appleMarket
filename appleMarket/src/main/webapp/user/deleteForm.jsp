<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
삭제할 아이디 입력 : <input type="text" id="searchId">
<input type="button" id="searchBtn" value="검색">
<br><br>
<div id="resultDiv"></div>
<br><br>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){

	$('#searchBtn').click(function(){
		$('#resultDiv').empty();
		
		$.ajax({
			url: '/chapter06_SpringWebMaven/user/getUser',
			type : 'post',
			data : {'searchId' : $('#searchId').val()},
			success: function(data){
				//alert(JSON.stringify(data));
				
				if(data == ''){
					$('#resultDiv').text('찾고자 하는 아이디가 없습니다.');
					$('#resultDiv').css('color', 'red');
					$('#resultDiv').css('font-weight', 'bold');
				}else{
					if(confirm('정말로 삭제하시겠습니까?')){
					 $.ajax({
						url:'/chapter06_SpringWebMaven/user/delete',
						type : 'post',
						data : {'searchId' : $('#searchId').val()},
						success: function(data){
							alert('회원 정보 삭제 완료');
							location.href='/chapter06_SpringWebMaven/user/list'
						},
						error:function(err){
							console.log(err);
						}
						
					 });
					}
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	});
});	
</script>
</body>
</html>