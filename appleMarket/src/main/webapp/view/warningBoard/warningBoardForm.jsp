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
        <form id="warningWriteForm">
            <fieldset>
                <label for="name">신고사유:</label>
                <select name="language">
                    <option value="none">=== 선택 ===</option>
                    <option value="">비매너</option>
                    <option value="">욕설</option>
                    <option value="">사기</option>
                    <option value="">불법,유해</option>
                    <option value="">기타</option>
                  </select>
                   <div id="subjectDiv"></div>

                <label for="message">신고내용:</label>
                <textarea id="message" placeholder="신고내용을 적어주세요."></textarea>
                <div id="contentDiv"></div>

                <input type="button" id="WarningWriteBtn" value="신고하기">

            </fieldset>
      	</form>
    </div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#WarningWriteBtn').click(function(){
	//초기화 과정
	$('#contentDiv').empty();
	
	
	if($('select').val() == 'none') {
		$('#subjectDiv').html('신고사유를 선택해주세요.'); 
		$('#admin_notice_subject').focus();
	}
	
	else if($('#message').val() == ''){
		$('#contentDiv').html('내용 입력');
		$('#message').focus();
	}
	else{ 
		$.ajax({
			url: '/appleMarket/warningBoardWrite',
			type: 'post',
			data: $('#warningWriteForm').serialize(),
			success: function(){
				alert("글 작성 성공");
				location.href="/appleMarket/index"
			},
			error: function(err){
				console.log(err);
			}	
		});
	}	
});


</script>

</body>
</html>