$(function(){

	var member_id = $('#nickname_member_id').text();
	//alert(member_id);
	
	//지역 출력
	$.ajax({
		url : '/appleMarket/getLocation', 
		type : 'post',
		data : {'member_id' : member_id} ,
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#region_name').text(data.location_dong);
				
			
		},error:function(err){
			console.log(err);
		}
	});

	//아이디출력
	$.ajax({
		url : '/appleMarket/getAdminMemberListId', 
		type : 'post',
		data : {'member_id' : member_id} ,
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('.profile-detail-count').text(data.member_reputation);
				
			
		},error:function(err){
			console.log(err);
		}
	});
	
	//찜목록 리스트 출력
	$.ajax({
		url: '/appleMarket/getinterestList', 
		type: 'post',
		data : {'member_id' : member_id} ,
		success: function(data){
			//alert(member_id);
			//alert(JSON.stringify(data));
			$.each(data, function(index,items){
	 // 리스트 html을 정의
    let html = "<article class='card'>"+
              "<a class='card-link' data-event-label='325118947' href='/appleMarket/view/saleboard/saleboardView.jsp?sale_seq="+items.sale_seq+"'>"+
               "<div class='card-photo'>"+
                 "<img alt='이미지1' src='/appleMarket/storage/"+items.sale_image1+"'/>"
             	+"</div>"+"</a>"+
             	"<div class='card-desc'>"+
             	"<h2 class='card-title'>"+items.sale_subject+"</h2>"+
             	"<div class='card-price'>"+items.sale_status+"</div>"+
             	"<div class='card-region-name'>"+items.sale_price+"<br><ion-icon name='close-outline' class='nav__icon'></ion-icon></div>"
             	+"<input type='hidden' class='interestList_seq' value="+items.interestList_seq+">";
    
    $(".cards-wrap").append(html);
				
});//each		
		
		},error:function(err){
			console.log(err);
		}
	});

});

//삭제 버튼
	$(document).on("click", ".nav__icon", function(){

		var interestList_seq = $(this).parents().next().val();
		//alert(interestList_seq);
	    var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/interestDelete',
				type : 'post',
				data : {'interestList_seq' :interestList_seq},
				success: function(data){
				    alert('삭제 완료');
				    location.href='/appleMarket/mypageMainForm';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		} 
});		