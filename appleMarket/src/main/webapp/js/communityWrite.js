// 유효성검사 후 submit
$('.btn-success').click(function(){
  if($('input[name=communityboard_subject]').val() == ''){
    $('input[name=communityboard_subject]').attr('placeholder', '제목을 입력해주세요');
  }else if($('textarea[name=communityboard_content]').val() == ''){
    $('textarea[name=communityboard_content]').attr('placeholder', '내용을 입력해주세요');
  }else{
    $.ajax({
      url: '/appleMarket/communityboard/communityboardWrite',
      type: 'post',
      data: $('#communityWriteForm').serialize(),
      success: function(){
        console.log('조잘 폼제출 성공~~~~~~');
        alert('글작성을 완료하였습니다');
        location.href = '/appleMarket/view/communityboard/communityboardList.jsp?pg=1';
      },
      error: function(){
        console.log('조잘 폼제출 실패')
      }
    });
  }
});

$('.btn-primary').click(function(){
  location.href = '/appleMarket/view/communityboard/communityboardList.jsp?pg=1';
});
