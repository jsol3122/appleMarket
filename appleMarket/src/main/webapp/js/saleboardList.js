let isEnd = false;
let pageNum = 1;
    
$(function(){
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        
        console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 30 > documentHeight ){
            pageNum++;
            fetchList();
        }
    })
    fetchList();
})

let fetchList = function(){
    if(isEnd == true){
        return;
    }
    
    // 방명록 리스트를 가져올 때 시작 번호
    // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
    // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
    $.ajax({
        url:"/appleMarket/saleboard/saleboardGetList?pg=" + pageNum ,
        type: "post",
        dataType: "json",
        success: function(result){
            // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
            // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
            let length = result.list.length;
            if( length < 5 ){
                isEnd = true;
            }
            $.each(result.list, function(index, DTO){
                renderList(false, DTO);
            })
        }
    });
}

let renderList = function(mode, DTO){
    //DTO.location1_addr2 = DTO.location1_addr2.replace(/null/g, '강남구');
    // 리스트 html을 정의
    
    if(DTO.location1_addr2 == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
    	DTO.location1_addr2 = '강남구'; 
    	//DTO.location1_addr2.replace(/null/g, '');
    }
    let html = "<li id=product_'"+ DTO.sale_seq +"'>" +
        "<div class=list_contents>"+
            "<div class=default>"+
                "<img src='/appleMarket/img/''"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<h3>"+DTO.sale_subject+"</h3>"+
                "<h3>"+DTO.location1_addr2+"</h3>"+
                "<h4>"+DTO.sale_price+"</h4>"+
            "</div>"+
            "<div class=hover>"+
                "<ul>"+
                    "<li><a href='#' class=sprites addcart>addcart</a></li>"+
                "</ul>"+
            "</div>"+
        "</div>"+
    "</li>";

    
    $(".new_arrivals_list").append(html);
    console.log(mode)
    
    /*
    if( mode ){
        $(".new_arrivals_list").prepend(html);
        console.log(mode)
    }
    else{
        $(".new_arrivals_list").append(html);
        console.log(mode)
    }
    */
}