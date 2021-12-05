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
    url: '/appleMarket/localCommunityboard/localCommunityboardGetList',
    type: 'get',
    data: 'pg='+result.pg,
    dataType: 'json',
    success: function(data){
    	console.log('우리동네 목록 잘 불러옴');
    	console.log(JSON.stringify(data))
      	$.each(data.list, function(index, list){
       	 	make_list(list);
      	});
    },
    errer: function(err){
      console.log('우리동네 목록 못불러옴')
    }
  });
});

// 목록 html태그 생성 후 삽입 함수
function make_list(list){
  let html =
  "<tr>"+
    "<td class=no>"+list.localcommunity_seq+"</td>"+
    "<td class=title>"+
      "<a href='' class=hx data-viewer=''>"+list.localcommunity_subject+"</a>"+
        "<span class=extraimages></span>"+
    "</td>"+
    "<td class=author><span><a href='#popup_menu_area' class='' onclick='return false'>"+
      list.localcommunity_user_id+
      "</a></span>"+
    "</td>"+
    "<td class=time title=''>21.11.11"+ // 임시로 날짜 고정
    "</td>"+
    "<td class=m_no>"+list.localcommunity_hit+"</td>"+
  "</tr>";

  $('.bd_lst tbody').append(html);
    
}

// 페이징 처리 html 태그 생성 및 삽입