<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>신고하기</title>

    <link href="/appleMarket/css/warningboardwriteForm.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>

    <div id="contact">
        <h1>신고하기</h1>
        <form name="warningWriteForm" id="warningWriteForm">
            <fieldset>
                <label for="name">신고사유:</label>
                <select name="warning_category" id="warning_category">
                    <option value="">=== 선택 ===</option>
                    <option value="비매너">비매너</option>
                    <option value="욕설">욕설</option>
                    <option value="사기">사기</option>
                    <option value="불법,유해">불법,유해</option>
                    <option value="기타">기타</option>
                  </select>

				<label for="warning_subject">제목:</label>
                <input type="text" id="warning_subject" name="warning_subject" placeholder="제목을 적어주세요."/>
				
                <label for="warning_content">신고내용:</label>
                <textarea name="warning_content" id="warning_content" placeholder="신고내용을 적어주세요."></textarea>
				
				<label for="input_file" class="input_file">사진등록:</label>
                <input type="file" name="input_file" id="input_file" class="upload-hidden">
				
                <input type="button" id="WarningWriteBtn" value="신고하기">
                <input type="hidden" name="board_seq" id="board_seq" value="">
                <input type="hidden" name="warning_id" id="warning_id" value="">
                <input type="hidden" name="board_name" id="board_name" value="">
                <input type="hidden" name="member_id" id="member_id" value="${member_id}" />
                <input type="hidden" name="comment_YN" id="comment_YN" value="">  
                <input type="hidden" name="comment_seq" id="comment_seq" value="">  
			  </fieldset>
      	</form>
    </div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/appleMarket/js/warning.js"></script>
</body>
</html>