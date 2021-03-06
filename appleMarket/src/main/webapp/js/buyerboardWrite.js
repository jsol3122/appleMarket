// 상품 등록 폼 내에서 글 등록 버튼 클릭
$('#buyerboardWriteButton').click(function(){
  // 초기화
  $('#select_valid').text('');

  // 유효성 검사
  if($('#buyerboard_category').val() == ''){
    $('#select_valid').css('color', 'tomato');
    $('#select_valid').css('font-size', '8pt'); 
    $('#select_valid').text('카테고리를 선택해주세요');
  }else if($('#buyerboard_price').val() == ''){
    $('#buyerboard_price').attr('placeholder', '가격을 입력해주세요');
  }else if($('#buyerboard_subject').val() == ''){
    $('#buyerboard_subject').attr('placeholder', '제목을 입력해주세요');
  }else if($('#buyerboard_content').val() == ''){
    $('#buyerboard_content').attr('placeholder', '내용을 입력해주세요');
  }else if($('#ex_filename').val() == ''){
    alert('이미지파일을 한 개 이상 선택해주세요');
  }else{
    var formData = new FormData($('#buyerboardWriteForm')[0]);

    $.ajax({
      url: '/appleMarket/buyerboard/buyerboardWrite',
      type: 'post',
	    enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    data: formData,
      success: function(){
        alert('상품 등록이 완료되었습니다');
        location.href = '/appleMarket/view/buyerboard/buyerboardList.jsp?pg=1';
      },
      error: function(){
        console.log('바이보드 등록 실패')
      }

    });
  }

});