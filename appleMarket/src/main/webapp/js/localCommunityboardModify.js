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
    url: '/appleMarket/localCommunityboard/localCommunityboardGetView',
    type: 'post',
    data: 'localcommunity_seq='+result.localcommunity_seq,
    dataType: 'json',
    success: function(DTO){
      $('input[name=localcommunity_subject]').val(DTO.localcommunity_subject);
      $('textarea[name=localcommunity_content]').val(DTO.localcommunity_content);
      $('#localcommunity_seq').val(result.localcommunity_seq);
    },
    error: function(){
      console.log('우동 글수정 정보불러오기 실패')
    }
  });
});


// 유효성검사 후 submit
$('.btn-success').click(function(){
  let result = get_query();

  if($('input[name=localcommunity_subject]').val() == ''){
    $('input[name=localcommunity_subject]').attr('placeholder', '제목을 입력해주세요');
  }else if($('textarea[name=localcommunity_content]').val() == ''){
    $('textarea[name=localcommunity_content]').attr('placeholder', '내용을 입력해주세요');
  }else{
    $.ajax({
      url: '/appleMarket/localCommunityboard/localCommunityboardModify',
      type: 'post',
      data: $('#localCommunityModifyForm').serialize(),
      success: function(){
        console.log('우동 수정폼제출 성공~~~~~~');
        alert('글수정을 완료하였습니다');
        location.href = '/appleMarket/view/localCommunityboard/localCommunityboardView.jsp?localcommunity_seq='+result.localcommunity_seq;
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