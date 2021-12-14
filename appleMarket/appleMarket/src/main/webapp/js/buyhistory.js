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
  
  $.ajax({
    url: '/appleMarket/myBuyerGetList',
    type: 'post',
    data: 'pg='+result.pg,
    dataType:'json',
    success: function(data){
      console.log(JSON.stringify(data));
      $.each(data.list, function(index, list){
        // 글목록 html 생성&삽입 함수 호출
        make_list(list);
      });
      
      // 페이징처리
      $('form fieldset').append(data.boardPaging);
      $('a.prev').attr('href', '/appleMarket/buyhistory?pg='+(parseInt(result.pg)-1));
      $('a.next').attr('href', '/appleMarket/buyhistory?pg='+(parseInt(result.pg)+1));
      
      $('a.paging').each(function (index, item){
        item.href = '/appleMarket/buyhistory?pg='+item.text;
      });
      
      $('.bd_pg a').removeClass('this');
      $('.bd_pg a').eq(parseInt(result.pg)).addClass('this');
    },
    error:function(request,status,error){
    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }

  })
});

function make_list(list){

  let html =
  "<tr>"+
    "<td class=product-thumb>"+
       "<a href='/appleMarket/view/buyerboard/buyerboardView.jsp?buyerboard_seq="+list.buyerboard_seq+"'>"+
      "<img width=80px height=auto src='/appleMarket/storage/"+list.buyerboard_image1+"' alt='구매내역사진'>"+
    "</td>"+
    "<td class=product-details value="+list.member_id+">"+
      "<h3 class=title>"+list.buyerboard_subject+"</h3>"+
      "<span class=add-id><strong>ID:</strong>"+list.member_id+"</span>"+
      "<span><strong>날짜:</strong><time>2021/11/27</time></span>"+
      "<span class=status><strong>가격:</strong>"+list.buyerboard_price+"</span>"+
      "<span class=location><strong>장소:</strong>"+list.location_dong+"</span>"+
    "</td>"+
    "<td class=buyer_status align=center>"+
      "<span class=buyer_status>"+list.buyer_status+"</span><br><br>"+
      "<input type=button class=complete id="+list.buyer_status+" value=완료>"+
    "</td>"+
    "<td class=action data-title=Action value="+list.buyerboard_seq+">"+
      "<div class=''>"+
        "<ul class=list-inline>"+
          "<li class=list-inline-item>"+
            "<a data-toggle=tooltip data-placement=top title=Delete class=delete href='' value="+list.buyerboard_seq+">"+
              "<i class=fa></i>"+
            "</a>"+
        "</ul>"+
      "</div>"+
    "</td>"+
  "</tr>";
    
  $('.product-dashboard-table tbody').append(html);
  $('.status').addClass('active');
  $('.list-inline').addClass('justify-content-center');
  $('.fa').addClass('fa-trash');
    
}

// 글 삭제버튼 클릭
$(document).on('click', '.delete',function(){
  let seq = $(this).attr('value');
  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/buyhistoryDelete',
      type: 'post',
      data: 'buyerboard_seq='+seq,
      success: function(){
        console.log('바이보드 글삭 성공~~~~~~~');
      },
      error: function(){
        console.log('바이보드 글삭 실패')
      }
    });
  }else return false;
});


// 거래완료 버튼
$(document).on('click', '.complete',function(){
  var buyer_status = $(this).attr('id'); 
  var buyerboard_seq = $(this).parents().next().attr('value');
  var member_id= $(this).parents().prev().attr('value');
	
  if(buyer_status=='구매중'){
  // 거래완료 다시한번 확인
	  if(confirm('구매완료 처리하시겠습니까?')){
	    $.ajax({
	      url: '/appleMarket/buyerComplete',
	      type: 'post',
	      data: {'buyerboard_seq' : buyerboard_seq, 'member_id': member_id, 'buyer_status' : buyer_status},
	      success: function(data){
	        alert('구매완료 처리되었습니다.');
	        location.href='/appleMarket/buyhistory?pg=1';
	      },
	      error: function(err){
	      
	      }
	    });
	  }
	  
	}
 
});
