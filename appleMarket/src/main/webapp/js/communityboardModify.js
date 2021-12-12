// view의 주소값에서 상품 글번호 추출
function get_query(){ 
  var url = document.location.href; 
  var qs = url.substring(url.indexOf('?') + 1).split('&'); 
  for(var i = 0, result = {}; i < qs.length; i++){
       qs[i] = qs[i].split('='); 
       result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
  } 
  return result; 
}

// 기존 글 정보 뿌리고 시작
$(function(){
  let result = get_query();

  $.ajax({
    url: '/appleMarket/communityboard/communityboardGetView',
    type: 'post',
    data: 'communityboard_seq='+result.communityboard_seq,
    dataType: 'json',
    success: function(DTO){
      $('input[name=communityboard_subject]').val(DTO.communityboard_subject);
      $('textarea[name=communityboard_content]').val(DTO.communityboard_content);
      $('#communityboard_seq').val(result.communityboard_seq);
    },
    error: function(){
      console.log('조잘 글수정 정보불러오기 실패')
    }
  });
});


// 유효성검사 후 submit
$('.btn-success').click(function(){
  let result = get_query();

  if($('input[name=communityboard_subject]').val() == ''){
    $('input[name=communityboard_subject]').attr('placeholder', '제목을 입력해주세요');
  }else if($('textarea[name=communityboard_content]').val() == ''){
    $('textarea[name=communityboard_content]').attr('placeholder', '내용을 입력해주세요');
  }else{
    $.ajax({
      url: '/appleMarket/communityboard/communityboardModify',
      type: 'post',
      data: $('#communityboardModifyForm').serialize(),
      success: function(){
        console.log('조잘 수정폼제출 성공~~~~~~');
        alert('글수정을 완료하였습니다');
        location.href = '/appleMarket/view/communityboard/communityboardView.jsp?communityboard_seq='+result.communityboard_seq;
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