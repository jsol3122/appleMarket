// 우리동네 게시판 글 등록 버튼 클릭
$('#localCommunityboardWriteBtn').click(function(){
    // div 초기화
    $('#subjectDiv').empty();
    $('#contentDiv').empty();

	// 유효성 검사 - 제목&내용
    if($('#localcommunity_subject').val() == ''){
        $('#subjectDiv').val('제목을 입력해 주세요');
    }else if($('#localcommunity_content').val() ==''){
        $('#contentDiv').val('내용을 입력해 주세요');
    }else{
        var formData = new FormData($('#localCommunityboardWriteForm')[0]);
        $.ajax({
            url: '/appleMarket/localCommunityboard/localCommunityboardWrite',
            type:'post',
            enctype: 'multipart/form-data',
            processData: false,
			contentType: false,
			data: formData,
            success: function(){
                alert('우리동네 글 등록 완료');
                location.href = '/appleMarket/index.jsp';
            },
            error: function(err){
                console.log(err);
            }
        });
    }
});