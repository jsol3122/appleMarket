$(function(){
  $.ajax({
    url: '/appleMarket/myBuyerGetList',
    type: 'post',
    data: 'pg=1',
    dataType:'json',
    success: function(data){
      $.each(data.list, function(index, list){
        // 글목록 html 생성&삽입 함수 호출
        make_list(list);
      });
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
      "<img width=80px height=auto src='/appleMarket/storage/"+list.buyerboard_image1+"' alt='구매내역사진'>"+
    "</td>"+
    "<td class=product-details>"+
      "<h3 class=title>"+list.buyerboard_subject+"</h3>"+
      "<span class=add-id><strong>ID:</strong>"+list.member_id+"</span>"+
      "<span><strong>날짜:</strong><time>2021/11/27</time></span>"+
      "<span class=status><strong>가격:</strong>"+list.buyerboard_price+"</span>"+
      "<span class=location><strong>장소:</strong>"+list.location_dong+"</span>"+
    "</td>"+
    "<td class=product-category>"+
      "<span class=categories>"+list.buyerboard_category+"</span>"+
    "</td>"+
    "<td class=action data-title=Action>"+
      "<div class=''>"+
        "<ul class=list-inline>"+
          "<li class=list-inline-item>"+
            "<a data-toggle=tooltip data-placement=top title=Delete class=delete href=''>"+
              "<i class=fa>"+
            "</a>"+
          "</li>"+
        "</ul>"+
      "</div>"+
    "</td>"+
  "</tr>";
    
  $('.product-dashboard-table tbody').append(html);
  $('.status').addClass('active');
  $('.list-inline').addClass('justify-content-center');
  $('.fa').addClass('fa-trash');
    
}