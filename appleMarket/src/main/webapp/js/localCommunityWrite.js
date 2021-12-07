// 유효성검사 후 submit
$('.btn-success').click(function(){
  if($('input[name=localcommunity_subject]').val() == ''){
    $('input[name=localcommunity_subject]').attr('placeholder', '제목을 입력해주세요');
  }else if($('textarea[name=localcommunity_content]').val() == ''){
    $('textarea[name=localcommunity_content]').attr('placeholder', '내용을 입력해주세요');
  }else{
    $.ajax({
      url: '/appleMarket/localCommunityboard/localCommunityboardWrite',
      type: 'post',
      data: $('#localCommunityWriteForm').serialize(),
      success: function(){
        console.log('우동 폼제출 성공~~~~~~');
        alert('글작성을 완료하였습니다');
        location.href = '/appleMarket/view/localCommunityboard/localCommunityboardList.jsp?pg=1';
      },
      error: function(){
        console.log('우동 폼제출 실패')
      }
    });
  }
});

$('.btn-primary').click(function(){
  location.href = '/appleMarket/view/localCommunityboard/localCommunityboardList.jsp?pg=1';
});
