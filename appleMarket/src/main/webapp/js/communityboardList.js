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
  var result = get_query();
  // 일반 글목록 띄우기 - 
  $.ajax({
    url: '/appleMarket/communityboard/communityboardGetList',
    type: 'get',
    data: 'pg='+result.pg,
    dataType: 'json',
    success: function(data){
    	console.log('조잘조잘 목록 잘 불러옴');
    	console.log(JSON.stringify(data))
      $.each(data.list, function(index, list){
        make_list(list);
      });
      $('form fieldset').append(data.boardPaging);
      $('a.prev').attr('href', '/appleMarket/view/communityboard/communityboardList.jsp?pg='+(parseInt(result.pg)-1));
      $('a.next').attr('href', '/appleMarket/view/communityboard/communityboardList.jsp?pg='+(parseInt(result.pg)+1));
      for(step=1; step<$('.bd_pg a').length; step++){
        $('a.paging').eq(step).attr('href', '/appleMarket/view/communityboard/communityboardList.jsp?pg='+(step-1));
      }
      $('.bd_pg a').removeClass('this');
      $('.bd_pg a').eq(parseInt(result.pg)).addClass('this');
    },
    errer: function(err){
      console.log('조잘조잘 목록 못불러옴')
    }
  });
});

function make_list(list){
  let html =
  "<tr>"+
    "<td class=no>"+list.communityboard_seq+"</td>"+
    "<td class=title>"+
      "<a href='' class=hx data-viewer=''>"+list.communityboard_subject+"</a>"+
        "<span class=extraimages></span>"+
    "</td>"+
    "<td class=author><span><a href='#popup_menu_area' class='' onclick='return false'>"+
      list.communityboard_user_id+
      "</a></span>"+
    "</td>"+
    "<td class=time title=''>21.12.05"+
    "</td>"+
    "<td class=m_no>"+list.communityboard_hit+"</td>"+
  "</tr>";

  $('.bd_lst tbody').append(html);
    
}
