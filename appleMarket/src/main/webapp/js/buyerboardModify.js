// 주소값에서 상품 글번호 추출
function get_query(){ 
  var url = document.location.href; 
  var qs = url.substring(url.indexOf('?') + 1).split('&'); 
  for(var i = 0, result = {}; i < qs.length; i++){
      qs[i] = qs[i].split('='); 
      result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
  } 
  return result; 
}

$(function(){
  let result = get_query();
  
  $('#seq').val(result.buyerboard_seq);

  // 기존 상품 정보 띄우고 시작
  $.post('/appleMarket/buyerboard/buyerboardGetView', {
    buyerboard_seq: result.buyerboard_seq
  }, function(data){
    let DTO = data[0];

    $('#buyerboard_category').val(DTO.buyerboard_category);
    $('#buyerboard_price').val(DTO.buyerboard_price);
    $('#buyerboard_subject').val(DTO.buyerboard_subject);
    $('#buyerboard_content').val(DTO.buyerboard_content);
    if(DTO.buyerboard_image2 != null && DTO.buyerboard_image3 == null)
      $('.upload-name').val(DTO.buyerboard_image1+', '+DTO.buyerboard_image2);
    else if(DTO.buyerboard_image3 != null)
      $('.upload-name').val(DTO.buyerboard_image1+', '+DTO.buyerboard_image2+', '+DTO.buyerboard_image3);
  }, 'json');
  
});

// 상품 수정 폼 안에서 글 수정 버튼 클릭
$('#buyerboardModifyButton').click(function(){
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
      var formData = new FormData($('#buyerboardModifyForm')[0]);
  
      $.ajax({
        url: '/appleMarket/buyerboard/buyerboardModify',
        type: 'post',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: formData,
        success: function(){
          alert('상품정보 수정이 완료되었습니다');
          location.href = '/appleMarket/view/buyerboard/buyerboardList.jsp?pg=1';
        },
        error: function(){
          console.log('바이보드 등록 실패')
        }
  
      });
    }
  
});