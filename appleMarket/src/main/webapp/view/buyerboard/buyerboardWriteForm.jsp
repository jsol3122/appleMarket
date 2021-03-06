<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사고게시판 글 등록</title>
	<style>
        #wrap {
            width: 100%;
            margin: 0 auto;
            height: auto;
            min-height: 100%;
        }
        
        hr {
            background: #f35d22;
            height: 1px;
            border: 0;
        }
        
        form h1 {
            color: #f35d22;
            text-align: center;
            text-indent: 1em;
        }
        
        form {
            width: 80%;
            margin: 0 auto;
        }
        
        form div {
            padding: 15px 15px;
            display: flex;
        }
        
        form label {
            display: inline-block;
            width: 18%;
            align-items: center;
            text-align: left;
            padding: 15px 30px;
            font-weight: bold;
        }
        
        form input {
            height: 45px;
        }
        
        form input[type=text] {
            width: 70%;
            /* margin-right: 20px; */
            text-indent: 1.5em;
        }
        
        form textarea {
            width: 70%;
        }
        
        #buyerboardWriteForm input::-ms-input-placeholder { color: #f00; }
		#buyerboardWriteForm input::-webkit-input-placeholder { color: #f00; }
		#buyerboardWriteForm input::-moz-placeholder { color: #f00; }
		
		#buyerboardWriteForm textarea::-ms-input-placeholder { color: #f00; }
		#buyerboardWriteForm textarea::-webkit-input-placeholder { color: #f00; }
		#buyerboardWriteForm textarea::-moz-placeholder { color: #f00; }
        
        .filebox input[type="file"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }
        
        .filebox>.uploadfile {
            display: inline-block;
            padding: 5px 10px 10px 10px;
            margin-left: 10px;
            margin-top: 15px;
            color: rgb(255, 255, 255);
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #8d79ff;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
        }
        /* named upload */
        
        .filebox>.upload-name {
            display: inline-block;
            padding: .5em .75em;
            margin-top: 15px;
            /* label의 패딩값과 일치 */
            font-size: inherit;
            font-family: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #f5f5f5;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            -webkit-appearance: none;
            /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
        }
        
        form input[type=text]:focus,
        textarea:focus {
            background: #f1ac90;
        }
        
        .sbm {
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
<%@include file="/includes/header.jsp" %>
	<div id="wrap">
		<form name="buyerboardWriteForm" id="buyerboardWriteForm">
			<h1>사고게시판 글 등록</h1>
			<hr>
			<br>
			<br>
			<div>
				<label>카테고리</label>
				<select name="buyerboard_category" id="buyerboard_category">
					<option value="" selected >-- 선택하세요 --</option>
					<option value="tech">디지털기기/생활가전</option>
					<option value="furniture">가구/인테리어</option>
					<option value="baby">유아동</option>
					<option value="living">생활/가공식품</option>
					<option value="female">여성패션/잡화</option>
					<option value="male">남성패션/잡화</option>
					<option value="hobby">게임/취미</option>
					<option value="sports">스포츠/레저</option>
					<option value="beauty">뷰티/미용</option>
					<option value="pet">반려동물용품</option>
					<option value="book">도서/티켓/음반</option>
					<option value="etc">기타중고물품</option>
				</select>
				<label for="select_valid" id="select_valid"></label>
			</div>
			<div>
				<label>가격</label>
				<input type="text" name="buyerboard_price" id="buyerboard_price"/>
			</div>
			<div>
				<label>글 제목</label>
				<input type="text"  name="buyerboard_subject" id="buyerboard_subject"/>
			</div>
			<div>
				<label>글 내용</label>
				<textarea name="buyerboard_content" id="buyerboard_content" rows="15"></textarea>
			</div>
			<div class="filebox">
                <label>물품 사진등록</label>
                <input class="upload-name" value="파일선택" disabled="disabled" style="height: 15px;">
                <label for="ex_filename" class="uploadfile" style="width: 80px; height: 15px;">사진업로드</label>
                <input type="file" id="ex_filename" class="upload-hidden" name="img[]"  multiple>
            </div>
			<div>
				<input type="button" value="글 등록" class="sbm" id="buyerboardWriteButton" />
			</div>
		</form>
		<br>
		<br>
		<hr>
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/appleMarket/js/buyerboardWrite.js"></script>
  		<script>
            $(document).ready(function() {
                var fileTarget = $('.filebox .upload-hidden');
                fileTarget.on('change', function() { // 값이 변경되면 
                    if (window.FileReader) { // modern browser 
                        var filename = $(this)[0].files[0].name;
                    	// 이미지 등록 수 제한
                    	if(parseInt($(this)[0].files.length) > 3){
                    		alert('이미지는 최대 3장까지만 등록 가능합니다')
                    		return false;
                    	}else if(parseInt($(this)[0].files.length) == 1){
                    	  var filename1 = $(this)[0].files[0].name;
                    	  $(this).siblings('.upload-name').val(filename1);
                        }else if(parseInt($(this)[0].files.length) == 2){
                    	  var filename1 = $(this)[0].files[0].name;
                          var filename2 = $(this)[0].files[1].name;
                          $(this).siblings('.upload-name').val(filename1+', '+filename2);
                        }else {
                    	  var filename1 = $(this)[0].files[0].name;
                          var filename2 = $(this)[0].files[1].name;
                          var filename3 = $(this)[0].files[2].name;
                          $(this).siblings('.upload-name').val(filename1+', '+filename2+', '+filename3);
                      }
                    } else { // old IE 
                        var filename = $(this).val().split('/').pop().split('\\').pop();
                    } // 추출한 파일명 삽입 
                    $(this).siblings('.upload-name').val(filename);
                });
            });
        </script>
		<%@include file="/includes/footer.jsp" %>
	</div>
</body>
</html>