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



// 상세페이지 통해 작성자 id 받아와서 해당하는 글 목록 12개 띄우는 함수

// 추출한 글번호로 db 갔다와서 해당하는 글 내용 불러오기
$(function(){
    var result = get_query(); //result { category: "1060192", } - 의형식으로 추출됨
    
    $.ajax({
        url: '/appleMarket/saleboard/saleboardGetView',
        type: 'post',
        data: 'saleboard_seq='+result.sale_seq,
        dataType: 'json',
        success: function(data){
        	console.log(JSON.stringify(data));
        	console.log(data.sale_subject);
            get_detail(data);
        },
        error: function(err){
            console.log(err);
        }
    });
});

// 화면에 글 상세페이지 삽입하는 함수
function get_detail(data){
    let html = 
    "<div class=row>"+
        "<div class=product_pictures col-mod-5>"+
            "<img src='/appleMarket/storage/"+data.sale_image1+"' style=width:300px; height:245px; alt=상세사진1 class=big_img>"+
            // 캐러셀????????써서 상세페이지 이미지 5개 슬라이드처리
            "<ul class=thumb_img>"+
                "<li class=active>"+
                    "<img src=/appleMarket/storage/"+data.sale_image2+"' style=width:30px;height:57px; data-target="+data.sale_image2+" alt=상세사진2>"+
                "</li>"+
                "<li class=active>"+
                    "<img src=/appleMarket/storage/"+data.sale_image3+"' style=width:30px;height:57px; data-target="+data.sale_image3+" alt=상세사진3>"+
                "</li>"+
                "<li class=active>"+
                    "<img src=/appleMarket/storage/"+data.sale_image4+"' style=width:30px;height:57px; data-target="+data.sale_image4+" alt=상세사진4>"+
                "</li>"+
                "<li class=active>"+
                    "<img src=/appleMarket/storage/"+data.sale_image5+"' style=width:30px;height:57px; data-target="+data.sale_image5+" alt=상세사진5>"+
                "</li>"+
            "</ul>"+
        "</div>"+
        "<div class=product_specs jumbotron col-md-7>"+
            "<h2>"+data.sale_subject+"</h2>"+
            "<h3>"+data.location1_addr2+"</h3>"+
            "<p>"+data.sale_content+"</p>"+
            "<form action=''>"+
                "<hr/>"+
                "<div class=option row justify-content-between>"+
                    "<div class=size>"+
                        "<h4>"+data.member_id+"</h4>"+
                    "</div>"+
                    "<span class=divider>|</span>"+
                "</div>"+
                "<hr/>"+
                "<div class=option order_summary row justify-content-between>"+
                    "<div class=total_price>"+
                        "<h4>가격</h4>"+
                        "<span class=price>"+data.sale_price+" 원</span>"+
                    "</div>"+
                    "<div class=order_now>"+
                        "<ul>"+
                            "<li>"+
                                "<a href='' class=sprites addcart>addcart</a>"+
                            "</li>"+
                        "</ul>"+
                        "<button type=submit>채팅하기</button>"+
                    "</div>"+
                "</div>"+
            "</form>"+
        "</div>"+
    "</div>";

    console.log(html);

    $(".product_info .container").append(html);
    console.log('상세페이지 뜨기 완료')
}

