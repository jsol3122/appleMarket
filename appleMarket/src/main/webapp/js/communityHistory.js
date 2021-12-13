// 주소값에서 pg번호 추출
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

  $.ajax({
    url: '/appleMarket/myCommunityGetList',
    type: 'post',
    data: 'pg='+result.pg,
    success: function(data){
      console.log(JSON.stringify(data));
      $.each(data.list, function(index, list){
        // 글목록 html 생성&삽입 함수 호출
        make_list(list);
      });

      // 페이징처리
      $('form fieldset').append(data.boardPaging);
      $('a.prev').attr('href', '/appleMarket/communityHistory?pg='+(parseInt(result.pg)-1));
      $('a.next').attr('href', '/appleMarket/communityHistory?pg='+(parseInt(result.pg)+1));
      
      $('a.paging').each(function (index, item){
        item.href = '/appleMarket/communityHistory?pg='+item.text;
      });
      
      $('.bd_pg a').removeClass('this');
      $('.bd_pg a').eq(parseInt(result.pg)).addClass('this');
    },
    error: function(err){
      console.log('조잘조잘 마페 실패');
    }
  });
});

function make_list(list){
  let logtime = list.communityboard_logtime;
  let logtime_str = "2021."+(logtime.month+1)+"."+logtime.date;

  let html =
  "<tr>"+
    "<td class=no>"+list.communityboard_seq+"</td>"+
    "<td class=title>"+
      "<a href='/appleMarket/view/communityboard/communityboardView.jsp?communityboard_seq="+list.communityboard_seq+"' class=hx data-viewer=''>"+list.communityboard_subject+"</a>"+
        "<span class=extraimages></span>"+
    "</td>"+
    "<td class=author><span><a href='#popup_menu_area' class='' onclick='return false'>"+
      list.communityboard_user_id+
      "</a></span>"+
    "</td>"+
    "<td class=time title=''>"+logtime_str+"</td>"+
    "<td class=m_no><a href='' class=delete value="+list.communityboard_seq+"><i class=fas></i></a></td>"+
  "</tr>";
    
  $('.bd_tb_lst tbody').append(html);
  
  $('.fas').addClass('fa-trash');
    
}

// 글 삭제버튼 클릭
$(document).on('click', '.delete',function(){
  let seq = $(this).attr('value');
  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/communityHistoryDelete',
      type: 'post',
      data: 'communityboard_seq='+seq,
      success: function(){
        console.log('조잘조잘(마페) 글삭 성공~~~~~~~');
      },
      error: function(){
        console.log('조잘조잘(마페) 글삭 실패')
      }
    });
  }else return false;
})