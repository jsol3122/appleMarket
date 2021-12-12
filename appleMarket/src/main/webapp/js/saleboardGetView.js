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
    
    $.ajax({
        url: '/appleMarket/saleboard/saleboardGetView',
        type: 'post',
        data: 'sale_seq='+result.sale_seq,
        dataType: 'json',
        success: function(data){
            let DTO = data[0];
            get_detail(DTO);
            
            // 상세페이지 통해 작성자 id 받아와서 해당하는 글 목록 12개 띄우는 함수
            $.ajax({
                url: '/appleMarket/saleboard/saleboardGetListId',
                type: 'post',
                data: 'member_id='+DTO.member_id+'&sale_seq='+DTO.sale_seq,
                dataType: 'json',
                success: function(list){
                    $.each(list, function(index, DTO){
                        renderList(false, DTO);
                    })
                },
                errer: function(err){
                    console.log('id해당글 12개 불러오기 실패')
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
    let html = 
    "<div class=row>"+
        "<div class=product_pictures>"+
            "<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:300px;height:245px; alt=상세사진1 class=big_img>"+
            // 캐러셀????????써서 상세페이지 이미지 5개 슬라이드처리
            "<ul class=thumb_img>"+
                "<li class=active>"+
                  "<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:57px;height:57px; data-target="+DTO.sale_image1+" alt=상세사진1>"+
              "</li>"+
              "<li class=''>"+
                  "<img src='/appleMarket/storage/"+DTO.sale_image2+"' style=width:57px;height:57px; data-target="+DTO.sale_image2+" alt=상세사진2>"+
              "</li>"+
            "</ul>"+
        "</div>"+
        "<div class=product_specs>"+
            "<h2>"+DTO.sale_subject+"</h2>"+
            "<h3>"+DTO.location_dong+"</h3>"+
            "<p>"+DTO.sale_content+"</p>"+
            "<form action=''>"+
                "<hr/>"+
                "<div class=option>"+
                    "<div class=size>"+
                        "<h4>"+DTO.member_id+"</h4>"+
                    "</div>"+
                    "<span class=divider>|</span>"+
                "</div>"+
                "<hr/>"+
                "<div class=option>"+
                    "<div class=total_price>"+
                        "<h4>가격</h4>"+
                        "<span class=price>"+DTO.sale_price+" 원</span>"+
                    "</div>"+
                    "<div class=order_now>"+
                        "<ul>"+
                            "<li>"+
                                "<a href='' class=addcart>addcart</a>"+
                            "</li>"+
                            "<li>"+
                            	"<a href='' class=trash></a>"+
                            "</li>"+
                        "</ul>"+
                        
                        "<button type='button' class='chat' value="+ DTO.sale_seq+">채팅하기</button>"+
                        
                    "</div>"+
                "</div>"+
            "</form>"+
        "</div>"+
    "</div>";

    $(".product_info .container").append(html);

    $('.product_pictures').addClass('col-mod-5');
    $('.product_specs').addClass(['col-mod-7', 'jumbotron']);
    $('.option').addClass(['row', 'justify-content-between']);
    $('form div').eq(2).addClass('order_summary');
    $('.addcart').addClass('sprites');

//saleboardDTO 변수들만 넣을 수 있다
	var member_id = DTO.member_id;
	var sale_seq = DTO.sale_seq;

	// 채팅하기 버튼 클릭
	
	$(document).on('click', '.chat',function(DTO){
 	alert(member_id+" "+sale_seq+"DTO 들어왔나?");  
	    $.ajax({
	      url: '/appleMarket/chat/newChat',
	      type: 'post',
	      data: 'member_id='+member_id+'&sale_seq='+sale_seq,  
	      async: false,
	      success: function(data){
	        //alert(JSON.stringify(data)); //newChat에서 JSON으로 넘어온다.
	        var chatRoom_id = JSON.stringify(data);
	        alert(chatRoom_id);
	        //alert({chatRoom_id}); 
	        //const obj = JSON.parse(json);
			//console.log(obj.chatRoom_id);
			//alert(obj.chatRoom_id);
	        // 여기서 return map 값이 나와서 seq, chatRoom_id 까지 전부 들어있다.
	        //console.log('dto 보내기 성공~~~~~~~');
	        
	       
	        //location.href='/appleMarket/chat/personalChat?chatRoom_id='+chatRoom_id;
	        var popup = window.open('/appleMarket/chat/personalChat?chatRoom_id='+chatRoom_id, '팝업', 'width=900px,height=500px,left=600px,top=200px,scrollbars=yes');
	        
	        //var newChatMap = JSON.stringify(data);
	        //var obj = JSON.parse(json);
	        //alert(newChatMap);
	        //var chatRoom_id = document.getElementById("newChatMap").innerHTML += newChatMap.chatRoom_id ;
			//console.log(newChatMap.chatRoom_id);
	        //alert(chatRoom_id);

/*            
            $.ajax({
                //url: '/appleMarket/chat/personalChat/{chatRoom_id}',
                url: '/appleMarket/view/chat/personalChat',
                type: 'post',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function(data){
                    //location.href='/appleMarket/view/chat/personalChat/{chatRoom_id}'
                    location.href='/appleMarket/chat/personalChat';
                },
                errer: function(err){
                    console.log('이중 ajax 실패')
                }
            });
	*/        
	     
	       
	      },
	      error: function(){
	        console.log('dto 보내기 실패')
	      }
        });      
	});

/*
	$(document).on('click', '.chat',function(DTO){
		if(confirm("여긴 들어오나?")) {
		function sendPost(url, params){
			var form = document.createElement('form');
			form.setAttribute('method','post');	
			form.setAttribute('action', '/appleMarket/chat/newChat');	
			document.charset = "utf-8";
			for (var key in params) {
				var hiddenField = document.createElement('input');
				hiddenField.setAttribute('type', 'hidden');
				hiddenField.setAttribute('name', 'sale_seq');
				hiddenField.setAttribute('value', sale_seq);
				form.appendChild(hiddenField);	
				
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "member_id");
				hiddenField.setAttribute("value", member_id);
				form.appendChild(hiddenField);	
			
			}
			document.body.appendChild(form);
			form.submit();
			console.log('dto 보내기 성공~~~~~~~');
		}
		}
	});
*/
	
    if(DTO.sale_image3 != null){
        make_li(DTO.sale_image3);
    }else if(DTO.sale_image4 != null){
        make_li(DTO.sale_image4);
    }else if(DTO.sale_image5 != null){
        make_li(DTO.sale_image5);
    }
    
    // 본인 작성글일 경우 글수정&글삭제 버튼 생성 - 채팅하기 버튼 비활성화
	  if(DTO.member_id == $('#session_id').val()){
	    let buttons = 
	    "<button type=button id=saleboard_modify>글 수정</button>"+
	    "<button type=button id=saleboard_delete>글 삭제</button>";
	
	    $('.order_now').append(buttons);
	
	    $('#chat').attr('disabled', 'true');
	  }
    
    console.log('상세페이지 뜨기 완료')
}

// 사진 갯수만큼 동적 li삽입
function make_li(imgNum){
    let li = 
        "<li class=''>"+
            "<img src='/appleMarket/storage/"+imgNum+"' style=width:57px;height:57px; data-target="+imgNum+" alt="+imgNum+">"+
        "</li>";
    
    $('.thumb_img').append(li);
}

// 사진 리스트 중 클릭 시 상단 큰 이미지로 변경
$(document).on('click', '.thumb_img li', function(){
  $('.big_img').attr('src', $(this).children().attr('src'));
  $('.thumb_img li').removeClass('active');
  $(this).addClass('active');
});

// 리스트 출력 함수
let renderList = function(mode, DTO){
	if(DTO.location_dong == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
       DTO.location_dong = '강남구'; 
       //DTO.location1_addr2.replace(/null/g, '');
    }
    
    let category = DTO.sale_category;

    // 리스트 html을 정의
    let html = "<li id=product_"+DTO.sale_seq+">"+
        "<div class=list_contents>"+
            "<div class=default onclick=location.href='/appleMarket/view/saleboard/saleboardView.jsp?sale_seq="+DTO.sale_seq+"'>"+
                //"<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<h3>"+DTO.sale_subject+"</h3>"+
                "<h3>"+DTO.location_dong+"</h3>"+
                "<h4>"+DTO.sale_price+"</h4>"+
            "</div>"+
            "<div class=hover>"+
                "<ul>"+
                    "<li><a href='#' class=sprites>addcart</a></li>"+
                "</ul>"+
            "</div>"+
        "</div>"+
    "</li>";
    
    $(".new_arrivals_list").append(html);
    console.log(mode)
    
    $('.hover a').addClass('addcart');
    $('.new_arrivals_list>li').addClass(['col-md-3', category]);
    

}


// 글 수정버튼 클릭
$(document).on('click', '#saleboard_modify', function(){
  // 게시글번호 추출
  let result = get_query();

  location.href = '/appleMarket/view/saleboard/saleboardModifyForm.jsp?sale_seq='+result.sale_seq;
});

// 글 삭제버튼 클릭
$(document).on('click', '#saleboard_delete', function(){
  // 게시글번호 추출
  let result = get_query();

  // 삭제여부 다시한번 확인
  if(confirm('정말로 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다')){
    $.ajax({
      url: '/appleMarket/salehistoryDelete',
      type: 'post',
      data: 'sale_seq='+result.sale_seq,
      success: function(){
        location.href = '/appleMarket/view/saleboard/saleboardList.jsp?pg=1';
        console.log('세이;ㄹ보드 글삭 성공~~~~~~~');
      },
      error: function(){
        console.log('세일보드 글삭 실패')
      }
    });
  }else return false;
});





