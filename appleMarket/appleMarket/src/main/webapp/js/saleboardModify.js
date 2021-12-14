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
  
  $('#seq').val(result.sale_seq);

  // 기존 상품 정보 띄우고 시작
  $.post('/appleMarket/saleboard/saleboardGetView', {
    sale_seq: result.sale_seq
  }, function(data){
    let DTO = data[0];

    $('#sale_category').val(DTO.sale_category);
    $('#sale_price').val(DTO.sale_price);
    if(DTO.sale_nego_YN == 'N')
      $('#nego_N').prop('checked', true);
    if(DTO.sale_free_YN == 'Y')
      $('#free_Y').prop('checked', true);
    $('#sale_subject').val(DTO.sale_subject);
    $('#sale_content').val(DTO.sale_content);
    if(DTO.sale_image2 != null && DTO.sale_image3 == null)
      $('.upload-name').val(DTO.sale_image1+', '+DTO.sale_image2);
    else if(DTO.sale_image3 != null && DTO.sale_image4 == null)
      $('.upload-name').val(DTO.sale_image1+', '+DTO.sale_image2+', '+DTO.sale_image3);
  	else if(DTO.sale_image4 != null && DTO.sale_image5 == null)
      $('.upload-name').val(DTO.sale_image1+', '+DTO.sale_image2+', '+DTO.sale_image3+', '+DTO.sale_image4);
    else if(DTO.sale_image5 != null)
      $('.upload-name').val(DTO.sale_image1+', '+DTO.sale_image2+', '+DTO.sale_image3+', '+DTO.sale_image4+', '+DTO.sale_image5);
  }, 'json');
  
});

// 상품 수정 폼 안에서 글 수정 버튼 클릭
$('#saleboardModifyButton').click(function(){
    // 초기화
    $('#select_valid').text('');

    // 유효성 검사
    if($('#sale_category').val() == ''){
      $('#select_valid').css('color', 'tomato');
      $('#select_valid').css('font-size', '8pt'); 
      $('#select_valid').text('카테고리를 선택해주세요');
    }else if($('#sale_price').val() == ''){
      $('#sale_price').attr('placeholder', '가격을 입력해주세요');
    }else if($('#sale_subject').val() == ''){
      $('#sale_subject').attr('placeholder', '제목을 입력해주세요');
    }else if($('#sale_content').val() == ''){
      $('#sale_content').attr('placeholder', '내용을 입력해주세요');
    }else if($('#ex_filename').val() == ''){
      alert('이미지파일을 한 개 이상 선택해주세요');
    }else{
      var formData = new FormData($('#saleboardModifyForm')[0]);
  
      $.ajax({
        url: '/appleMarket/saleboard/saleboardModify',
        type: 'post',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: formData,
        success: function(){
          alert('상품정보 수정이 완료되었습니다');
          location.href = '/appleMarket/view/saleboard/saleboardList.jsp?pg=1';
        },
        error: function(){
          console.log('sale보드 등록 실패')
        }
  
      });
    }
  
});