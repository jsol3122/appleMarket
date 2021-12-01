<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고게시판 글 등록</title>
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
		<form name="buyerboardWriteForm" action="">
			<h1>사고게시판 글 등록</h1>
			<hr>
			<br>
			<br>
			<div>
				<label>카테고리</label>
				<select name="buyerboard_category">
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
				<label>글 제목</label>
				<input type="text"  name="buyerboard_subject"/>
			</div>
			<div>
				<label>글 내용</label>
				<textarea name="buyerboard_content" rows="15"></textarea>
			</div>
			<div>
				<input type="file" name="img" multiple>
			</div>
			<div>
				<input type="button" value="글 등록" class="sbm" id="buyerboardWriteBtn" />
			</div>
		</form>
		<br>
		<br>
		<hr>
	</div>
	
</body>
</html>