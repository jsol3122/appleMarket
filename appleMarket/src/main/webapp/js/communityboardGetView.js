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


// 추출한 글번호로 db 갔다와서 해당하는 글 내용 불러오기
$(function(){
  var result = get_query(); //result { category: "1060192", } - 의형식으로 추출됨
  $('#communityboard_seq').val(result.communityboard_seq);

  $.ajax({
      url: '/appleMarket/communityboard/communityboardGetView',
      type: 'post',
      data: 'communityboard_seq='+result.communityboard_seq,
      dataType: 'json',
      success: function(DTO){
          // 글 제목&내용 삽입
          get_detail(DTO);

          // 해당 글의 댓글 불러오기
          $.ajax({
            url: '/appleMarket/comment/communityboardCommentGetList',
            type: 'get',
            data: 'communityboard_seq='+DTO.communityboard_seq,
            dataType: 'json',
            success: function(data){
              $.each(data, function(index, DTO){
                commentList(false, DTO);

              })
            },
            error: function(){
              console.log('조잘 댓글 불러오기x')
            }
          });

          // 해당 글의 댓글 수 계산
          $.ajax({
            url: '/appleMarket/communityboard/commentTotal',
            type: 'get',
            data: 'communityboard_seq='+DTO.communityboard_seq,
            dataType: 'text',
            success: function(count){
              $('.fdb_tag b').text(count);
            },
            error: function(){
              console.log('댓글수 못불러옴')
            }
          });
          
          // 공지사항 띄우기
		  $.ajax({
		    url: '/appleMarket/getAdminNoticeList',
		    type: 'post',
		    dataType: 'json',
		    success: function(data){
		      $.each(data, function(index, list){
		        // 글목록 html 생성&삽입 함수 호출
		        notice_list(list);
		      });      
		    },
		    error: function(err){
		      console.log('조잘공지 목록 못불러옴')
		    }
		  });
          
          // 하단에 최신글 1페이지 불러오기
          $.ajax({
              url: '/appleMarket/communityboard/communityboardGetList',
              type: 'get',
              data: 'pg=1',
              dataType: 'json',
              success: function(data){
                $.each(data.list, function(index, list){
                  // 글목록 html 생성&삽입 함수 호출
                  make_list(list);
                });
              },
              errer: function(err){
                  console.log('조잘상세페이지 하단리스트 불러오기 실패')
              }
          });
      },
      error: function(err){
          console.log(err);
      }
  });
});

// 화면에 글 상세페이지 삽입하는 함수
function get_detail(DTO){
  // 글제목&사용자 삽입
  let hd = 
  "<div class=top_area>"+
    "<div class=fr>"+
      "<span class=date>"+DTO.communityboard_logtime+"</span>"+
    "</div>"+
    "<h1 class=np_18px>"+
      "<a href=''>"+DTO.communityboard_subject+"</a>"+
    "</h1>"+
  "</div>"+
  "<div class=btm_area>"+
    "<div class=side>"+
      "<a href='' class=nick onclick='return false;'>"+DTO.communityboard_user_id+"</a>"+
    "</div>"+
    "<div class=hit>"+
      "<span>조회 수 <b>"+DTO.communityboard_hit+"</b></span>"+
    "</div>"+
  "</div>";  

  $(".rd_hd .board").append(hd);

  $('.top_area').addClass('ngeb');
  $('.date').addClass('m_no');
  $('.btm_area').addClass('clear');
  $('.hit').addClass(['side', 'fr']);

  // 글 내용 부분 삽입
  let body =
  "<div class=xe_content>"+
    "<p>"+DTO.communityboard_content+"</p>"+
  "</div>";

  $(".rd_body").append(body);

  // 본인 작성글일 경우 글수정&글삭제 버튼 생성 - 채팅하기 버튼 비활성화
  if(DTO.communityboard_user_id == $('#session_id').val()){
    let buttons = 
    "<a class=back_to href='' id=communityboard_modify title=수정 onclick='return false;'>"+ 
      "<i class=fa-pencil></i><b class=tx>수정</b>"+
    "</a>"+
    "<a class=back_to href='' id=communityboard_delete title=삭제 onclick='return false;'>"+ 
      "<i class=fa-trash></i><b class=tx>삭제</b>"+
    "</a>";

    $('.rd_ft_nav .rd_nav').prepend(buttons);

    $('.back_to').addClass(['bubble', 'm_no']);
    $('.fa-pencil').addClass('fa');
    $('.fa-trash').addClass('fa');
  }
  
  console.log('상세페이지 뜨기 완료')
}

// 댓글 출력 함수
let commentList = function(mode, DTO){

  // 리스트 html을 정의
  let comment1 = 
  "<li class=fdb_itm>"+
    "<div class=meta>"+
      "<a href='#popup_menu_area' onclick='return false;'>"+DTO.communityboard_comment_user_id+"</a>"+
      "<span class=date>"+DTO.communityboard_comment_logtime+"</span>"+
    "</div>"+
    "<div class=xe_content>"+DTO.communityboard_comment_content+"</div>"+
    "<div class=img_tx>"+
      "<a class=bell><i class=fa-concierge-bell></i>신고</a>"+
    "</div>"+
    "<input type=hidden id=comment_seq value="+DTO.communityboard_comment_comment_seq+" />"+
  "</li>";

  let comment2 = 
  "<li class=fdb_itm>"+
    "<div class=meta>"+
      "<a href='#popup_menu_area' onclick='return false;'>"+DTO.communityboard_comment_user_id+"</a>"+
      "<span class=date>"+DTO.communityboard_comment_logtime+"</span>"+
    "</div>"+
    "<div class=xe_content>"+DTO.communityboard_comment_content+"</div>"+
    "<div class=img_tx>"+
      "<a class=trash><i class=fa-trash></i>삭제</a>"+
      "<a class=bell><i class=fa-concierge-bell></i>신고</a>"+
    "</div>"+
    "<input type=hidden id=comment_seq value="+DTO.communityboard_comment_seq+" />"+
  "</li>";

  // 본인 댓글일 경우에만 삭제&신고버튼 활성화
  if(DTO.communityboard_comment_user_id == $('#session_id').val()){
    $("#cmtPosition .fdb_lst_ul").append(comment2);
  }else{
    $("#cmtPosition .fdb_lst_ul").append(comment1);
  }

  $('.fdb_itm').addClass('clear');
  $('.fdb_itm .img_tx').addClass('fdb_nav');
  $('.fa-concierge-bell').addClass('fa');  
  $('.bell').addClass('re_comment');
  $('.fa-trash').addClass('fa'); 
  $('.trash').addClass('re_comment'); 
  

}

// 상세페이지 하단 리스트 1페이지 삽입
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
    "<td class=m_no>"+list.communityboard_hit+"</td>"+
  "</tr>";

  $('.bd_lst tbody').append(html);
    
}

function notice_list(list){
  //let logtime = list.localcommunity_logtime;
  //let logtime_str = "2021."+(logtime.month+1)+"."+logtime.date;

  let html =
  "<tr class=notice>"+
    "<td class=no><strong>공지</strong></td>"+
    "<td class=title>"+
      "<a href=''><strong>"+
        "<span style=font-weight:bold;color:#ff0000>"+list.admin_notice_subject+"</span>"+
      "</strong></a>"+
    "</td>"+
    "<td class=author>"+
      "<span><a href='' class='' onclick='return false'>관리자</a></span>"+
    "</td>"+
    "<td class=time title=''>"+list.admin_notice_logtime+"</td>"+
    "<td class=m_no>-</td>"+
  "</tr>";

  $('.bd_lst tbody').append(html);    
}

// 글 수정버튼 클릭
$(document).on('click', '#communityboard_modify', function(){
  // 게시글번호 추출
  let result = get_query();

  location.href = '/appleMarket/view/communityboard/communityboardModifyForm.jsp?communityboard_seq='+result.communityboard_seq;
});

// 글 삭제버튼 클릭
$(document).on('click', '#communityboard_delete', function(){
  // 게시글번호 추출
  let result = get_query();

  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/communityHistoryDelete',
      type: 'post',
      data: 'communityboard_seq='+result.communityboard_seq,
      success: function(){
        console.log('우동 글삭 성공~~~~~~~');
        location.href = '/appleMarket/view/communityboard/communityboardList.jsp?pg=1';
      },
      error: function(){
        console.log('우동 글삭 실패')
      }
    });
  }else return false;
});

// 댓글 삭제 버튼 클릭
$(document).on('click', '.trash', function(){
  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 댓글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/comment/communityboardCommentDelete',
      type: 'get',
      data: 'communityboard_comment_seq='+$('#comment_seq').val(),
      success: function(){
        console.log('조잘 댓글 삭제 o');
        location.reload();
      },
      error: function(){
        console.log('조잘 댓글 삭제x');
      }
    });
  }else return false;
});

// 댓글 쓰기 버튼 클릭
$('.bd_btn').click(function(e){
  
  if($('textarea#editor_668947').val()){
    $.ajax({
      url: '/appleMarket/comment/communityboardCommentWrite',
      type: 'post',
      data: $('.cmt_wrt').serialize(),
      success: function(){
        location.reload();
      },
      error: function(){
        console.log('조잘 댓글 실패')
      }
    })
  }else{
    e.preventDefault();
    $('#editor_668947').attr('placeholder', '최소 1글자 이상 입력해주세요');
  }

});

