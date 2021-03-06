let isEnd = false;
let pageNum = 1;
let saleboardC="*";

/* 카테고리 체크박스 눌렀을때 value값 가져오기 */
function getCheckboxValue(event)  {
	pageNum = 1;
    let result =  event.target.value;
    
    document.getElementById('searchcategory_result').value = result;    
      
    saleboardC=result;
    
    console.log($('#searchcategory_result').val());
 
    
    $('.new_arrivals_list *').remove();
      
    $(window).scroll(function(){
                    
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
                
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
    
        if( scrollTop + windowHeight + 10 > documentHeight ){
            fetchList(saleboardC);
            pageNum++;
        }
       
            
    });
    
     fetchList(saleboardC);

   
    // 물품등록 버튼 클릭
    $('#saleboardWriteBtn').click(function(){
      if($('#session_id').val())
	      location.href = '/appleMarket/saleboard/saleboardWriteForm'; 
      else
        alert('로그인이 필요한 서비스입니다')
    });
                  
                        
}

$(function(){
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        
        // console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 30 > documentHeight ){
            pageNum++;
            fetchList(saleboardC);
        }
    })
    fetchList(saleboardC);
    
    // 물품등록 버튼 클릭
    $('#saleboardWriteBtn').click(function(){
      if($('#session_id').val())
	      location.href = '/appleMarket/saleboard/saleboardWriteForm'; 
      else
        alert('로그인이 필요한 서비스입니다')
    });
    
})

let fetchList = function(){
    if(isEnd == true){
        return;
    }
    
    // 방명록 리스트를 가져올 때 시작 번호
    // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
    // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
    $.ajax({
        url:"/appleMarket/saleboard/saleboardGetList",
         data: 'pg='+pageNum+'&sale_category='+saleboardC,
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
	if(DTO.location_dong == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
       DTO.location_dong = '역삼동'; 
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
    
   /* $('.hover a').addClass('addcart');*/
    $('.new_arrivals_list>li').addClass(['col-md-3', category]);
    

}