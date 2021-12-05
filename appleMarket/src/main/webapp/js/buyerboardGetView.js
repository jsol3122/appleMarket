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
        url: '/appleMarket/buyerboard/buyerboardGetView',
        type: 'post',
        data: 'buyerboard_seq='+result.buyerboard_seq,
        dataType: 'json',
        success: function(data){
            let DTO = data[0];
            get_detail(DTO);
            
            // 상세페이지 통해 작성자 id 받아와서 해당하는 글 목록 12개 띄우는 함수
            $.ajax({
                url: '/appleMarket/buyerboard/buyerboardGetListId',
                type: 'post',
                data: 'member_id='+DTO.member_id+'&buyerboard_seq='+DTO.buyerboard_seq,
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
            "<img src='/appleMarket/storage/"+DTO.buyerboard_image1+"' style=width:300px;height:245px; alt=상세사진1 class=big_img>"+
            // 캐러셀????????써서 상세페이지 이미지 5개 슬라이드처리
            "<ul class=thumb_img>"+
                "<li class=active>"+
                    "<img src=/appleMarket/storage/"+DTO.buyerboard_image2+"' style=width:30px;height:57px; data-target="+DTO.sale_image2+" alt=상세사진2>"+
                "</li>"+
            "</ul>"+
        "</div>"+
        "<div class=product_specs>"+
            "<h2>"+DTO.buyerboard_subject+"</h2>"+
            "<h3>"+DTO.location_dong+"</h3>"+
            "<p>"+DTO.buyerboard_content+"</p>"+
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
                        "<span class=price>"+DTO.buyerboard_price+" 원</span>"+
                    "</div>"+
                    "<div class=order_now>"+
                        "<ul>"+
                            "<li>"+
                                "<a href='' class=addcart>addcart</a>"+
                            "</li>"+
                        "</ul>"+
                        "<button type=submit>채팅하기</button>"+
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

    if(DTO.buyerboard_image3 != null){
        make_li(DTO.buyerboard_image3);
    }
    
    console.log('상세페이지 뜨기 완료')
}

// 사진 갯수만큼 동적 li삽입
function make_li(imgNum){
    let li = 
        "<li>"+
            "<img src=/appleMarket/storage/"+imgNum+"' style=width:30px;height:57px; data-target="+imgNum+" alt="+imgNum+">"+
        "</li>";
    
    $('.thumb_img').append(li);
}

// 리스트 출력 함수
let renderList = function(mode, DTO){
	if(DTO.location_dong == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
       DTO.location_dong = '강남구'; 
       //DTO.location1_addr2.replace(/null/g, '');
    }
    
    let category = DTO.sale_category;

    // 리스트 html을 정의
    let html = "<li id=product_"+DTO.buyerboard_seq+">"+
        "<div class=list_contents>"+
            "<div class=default onclick=location.href='/appleMarket/view/buyerboardboard/buyerboardboardView.jsp?buyerboard_seq="+DTO.buyerboard_seq+"'>"+
                //"<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<img src='/appleMarket/storage/"+DTO.buyerboard_image1+"' style=width:200px;height:180px; alt=img>"+
                "<h3>"+DTO.buyerboard_subject+"</h3>"+
                "<h3>"+DTO.location_dong+"</h3>"+
                "<h4>"+DTO.buyerboard_price+"</h4>"+
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
