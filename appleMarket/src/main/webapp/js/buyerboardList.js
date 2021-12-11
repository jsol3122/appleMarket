let isEnd = false;
let pageNum = 1;
let buyerboardC="*";

/* 카테고리 체크박스 눌렀을때 value값 가져오기 */
function getCheckboxValue(event)  {
	pageNum = 1;
    let result =  event.target.value;
    
    document.getElementById('searchcategory_result').value = result;    
      
    buyerboardC=result;
    
    console.log($('#searchcategory_result').val());
 
    
    $('.new_arrivals_list *').remove();
      
    $(window).scroll(function(){
                    
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
                
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
    
        if( scrollTop + windowHeight + 10 > documentHeight ){
            fetchList(buyerboardC);
            pageNum++;
        }
       
            
    });
    
     fetchList(buyerboardC);

    // 물품등록 버튼 클릭
    $('#buyerboardWriteBtn').click(function(){
        location.href = '/appleMarket/buyerboard/buyerboardWriteForm'; 
    });
                  
                        
}

   
       
$(function(){
          
    $(window).scroll(function(){
                          
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
                
    // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
    
        if( scrollTop + windowHeight + 10 > documentHeight ){
            fetchList(buyerboardC);
            pageNum++;
        }
              
    });
     fetchList(buyerboardC);
      
      
      
          /*$("input[name='buyerboard_category']").click(function(){
              $("input[name='buyerboard_category']").each(function(){  
                  if($(this).is(":checked"))  {// ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
                   
                  console.log($('#searchcategory_result').val());
                  
                  
              // 방명록 리스트를 가져올 때 시작 번호
              // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
              // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
                          $.ajax({
                              url:"/appleMarket/buyerboard/buyerboardGetList?pg=" + pageNum,
                              data: 'buyerboard_category='+$('#searchcategory_result').val(),
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
                          }); //ajax()   
                   }  
               });
          });*/
      
      
    // 물품등록 버튼 클릭
    $('#buyerboardWriteBtn').click(function(){
        location.href = '/appleMarket/buyerboard/buyerboardWriteForm'; 
    });
                       
})

        
let fetchList = function(buyerboardC){
    if(isEnd == true){
        return;
    }
    $.ajax({
        url:"/appleMarket/buyerboard/buyerboardGetList",
        data: 'pg='+pageNum+'&buyerboard_category='+buyerboardC,
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
    }); //ajax()
}//fetchlist


let renderList = function(mode, DTO){
   if(DTO.location_dong == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
       DTO.location_dong = '역삼동'; 
       //DTO.location1_addr2.replace(/null/g, '');
    }
    
    let category = DTO.buyerboard_category;
   
    // 리스트 html을 정의
    let html = "<li id=product_"+DTO.buyerboard_seq+">"+
        "<div class=list_contents>"+
            "<div class=default onclick=location.href='/appleMarket/view/buyerboard/buyerboardView.jsp?buyerboard_seq="+DTO.buyerboard_seq+"'>"+
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
    $('.new_arrivals_list>li').addClass(['col-md-3',category]);
}