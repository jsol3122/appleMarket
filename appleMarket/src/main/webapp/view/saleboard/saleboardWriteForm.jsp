<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔고게시판 글 등록</title>
<style>
#wrap{ 
	width: 100%;
	margin: 0 auto; 
	height: auto;
	min-height: 100%; 
}
hr{
	background: #f35d22;
	height: 1px;
	border: 0;
}	

form h1{
	color: #f35d22;
	text-align: center;
	text-indent: 1em;
}
form{
	width: 80%;
	margin: 0 auto;
}
form div{
	padding: 15px 15px;
	display: flex;
}
form label{
	display: inline-block;
	width: 18%;
	align-items: center;
	text-align: left;
	padding: 15px 30px;
	font-weight: bold;
}
form input{
	height: 45px;
}
form input[type=text]{
	width: 70%;
	/* margin-right: 20px; */
	text-indent: 1.5em;
}
form textarea{
	width: 70%;
}
form input[type=text]:focus, textarea:focus{
	background: #f1ac90;
}
.sbm{
	background: #f35d22;
	margin: 0 auto;
	color: white;
	width: 510px;
	height: 60px;
	border-radius: 4px;
	border: 0;
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="wrap">
		<form name="saleboardWriteForm" action="">
			<h1>팔고게시판 글 등록</h1>
			<hr>
			<br>
			<br>
			<div>
				<label>카테고리</label>
				<select name="sale_category">
					<option value="X" selected>-- 선택하세요 --</option>
					<option value="디지털기기/생활가전">디지털기기/생활가전</option>
					<option value="가구/인테리어">가구/인테리어</option>
					<option value="유아동">유아동</option>
					<option value="생활/가공식품">생활/가공식품</option>
					<option value="여성패션/잡화">여성패션/잡화</option>
					<option value="남성패션/잡화">남성패션/잡화</option>
					<option value="게임/취미">게임/취미</option>
					<option value="스포츠/레저">스포츠/레저</option>
					<option value="뷰티/미용">뷰티/미용</option>
					<option value="반려동물용품">반려동물용품</option>
					<option value="도서/티켓/음반">도서/티켓/음반</option>
					<option value="기타중고물품">기타중고물품</option>
				</select>
			</div>
			<div>
				<label>가격</label>
				<input type="text" name="buyerboard_price" />
			</div>
			<div>
				<label>가격 제시 가능 여부</label>
				<input type="radio" name="sale_nego_YN" id="nego_Y" value="Y" checked>
				<label for="nego_Y" class="radio_lbl"> 가능 </label>
				<input type="radio" name="sale_nego_YN" id="nego_N" value="N">
				<label for="nego_N" class="radio_lbl"> 불가능 </label>
			</div>
			<div>
				<label>글 제목</label>
				<input type="text"  name="sale_subject"/>
			</div>
			<div>
				<label>글 내용</label>
				<textarea name="sale_content" rows="15"></textarea>
			</div>
			<div>
				<label>나눔 여부</label>
				<input type="radio" name="sale_free_YN" id="free_Y" value="Y">
				<label for="free_Y" class="radio_lbl"> 나눔상품 </label>
				<input type="radio" name="sale_free_YN" id="free_N" value="N" checked>
				<label for="free_N" class="radio_lbl"> 나눔상품이 아님 </label>
			</div>
			<div>
				<input type="file" name="img" multiple>
			</div>
			<div>
				<input type="button" value="글 등록" class="sbm" id="saleboardWriteBtn" />
			</div>
		</form>
		<br>
		<br>
		<hr>
	</div>
	
</body>
</html>
=======

<h3>이미지 등록</h3>

<!-- 1. 단순 submit ~ action -->
<%--
<form id="imageboardWriteForm" enctype="multipart/form-data" method="post" 
action="/chapter06_SpringMaven/user/imageboardWrite">
 --%>
        
<!-- 2. AJax -->
<form id="saleboardWriteForm" >        
	<table border="1" cellpadding="5" cellspacing="0">

<!-- 		<tr>
			<td align="center" width="100">작성자</td>
			<td><input type="text" name="member_id" id="member_id" size="50"></td>
		</tr> -->
	
		<tr>
			<td align="center" width="100">상품명</td>
			<td><input type="text" name="sale_subject" id="sale_subject" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">단가</td>
			<td><input type="text" name="sale_price" id="sale_price" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">카테고리</td>
			<td><input type="text" name="sale_category" id="sale_category" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">내용</td>
			<td><textarea cols="50" rows="15" name="sale_content" id="sale_content"></textarea></td>
		</tr>
		
		<!-- 이미지 input은 name 을 다 같게 해줘야 배열로 데이터가 간다. name = image1, 2, ... 이렇게 하면 안되고 img 로 통일 -->
		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr>
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
		 <tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 				

<%-- 		<tr>
			<td colspan="2">
				<input type="file" name="img[]" multiple>
			</td>
		</tr>		
 --%>		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="saleboardWriteBtn" value="이미지등록"/>
				<input type="reset" value="다시작성"/>
			</td>
      </tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#saleboardWriteBtn').click(function(){
		//1. 단순 submit
		//$('#imageboardWriteForm').submit();
		
		//2. AJax 통신
		var formData = new FormData($('#saleboardWriteForm')[0]); // form 안에 있는 모든 것
		//FormData 는 Forms 라는 복수형 객체들을 내장하고 있기 때문에 이렇게 form 하나만 쓰더라도 [0]이라고 인덱스를 써줘야 한다. 
		$.ajax({
			url: '/appleMarket/saleboard/saleboardWrite',
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(){
				alert('이미지 등록 완료');
			},
			error: function(err){
				console.log(err)
			}
		});
	});
</script>

<!-- 
processData
 - 기본값은 true
 - 기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
 - 파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)
 
contentType
  - 기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
  - 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
 -->
>>>>>>> 481d671775efde5eebd6ed6c1385b96f07d5a16f
