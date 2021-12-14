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
    url: '/appleMarket/myLocalCommentGetList',
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
      $('a.prev').attr('href', '/appleMarket/localCommunityCommentHistory?pg='+(parseInt(result.pg)-1));
      $('a.next').attr('href', '/appleMarket/localCommunityCommentHistory?pg='+(parseInt(result.pg)+1));
      
      $('a.paging').each(function (index, item){
        item.href = '/appleMarket/localCommunityCommentHistory?pg='+item.text;
      });
      
      $('.bd_pg a').removeClass('this');
      $('.bd_pg a').eq(parseInt(result.pg)).addClass('this');
    },
    error: function(err){
      console.log('우리동네 댓글 마페 실패');
    }
  });
});

function make_list(list){
  let html =
  "<tr>"+
    "<td class=no>"+list.localcommunity_seq+"</td>"+
    "<td class=no>"+list.localcommunity_comment_seq+"</td>"+
    "<td class=title>"+
      "<a href='/appleMarket/view/localCommunityboard/localCommunityboardView.jsp?localcommunity_seq="+list.localcommunity_seq+"' class=hx data-viewer=''>"+list.localcommunity_comment_content+"</a>"+
        "<span class=extraimages></span>"+
    "</td>"+
    "<td class=author><span><a href='#popup_menu_area' class='' onclick='return false'>"+
      list.localcommunity_comment_user_id+
      "</a></span>"+
    "</td>"+
    "<td class=time title=''>21.12.05"+
    "</td>"+
    "<td class=m_no><a href='' class=delete value="+list.localcommunity_comment_seq+"><i class='fas fa-trash'></i></a></td>"+
  "</tr>";
    
  $('.bd_tb_lst tbody').append(html);
    
}

// 글 삭제버튼 클릭
$(document).on('click', '.delete',function(){
  let seq = $(this).attr('value');
  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/myLocalCommentDelete',
      type: 'post',
      data: 'localcommunity_comment_seq='+seq,
      success: function(){
        console.log('우동(마페) 댓글 글삭 성공~~~~~~~');
      },
      error: function(){
        console.log('우동(마페) 댓글 글삭 실패')
      }
    });
  }else return false;
})