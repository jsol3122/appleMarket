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


//Animation Styles
$(function() {

var index = 0;

function initScroll() {
 $(".message-wrap").animate({ 
   scrollTop: $("main").height() 
 }, 1000);
}

function scroll() {
 $(".message-wrap").animate({
   scrollTop: 9000
 }, 1000);
}

$("input[type='submit']").click(function() {
 scroll();
});

$("aside").find("li").click(function() {
 initScroll();
 $(".init").animate({
   'opacity': '0'
 }, 500);
});

$("aside").find("li").click(function() {
 if (index == 1) {
   index = 0;
   $(".message-wrap").find(".message").css({
     'opacity': '1'
   });
 } else {
   index = 0;
   $(".message-wrap").find(".message").css({
     'opacity': '0'
   });
   $(".loader").delay(500).animate({
     'opacity': '1'
   });
   setTimeout(function() {
     index = 0;
     $(".message-wrap").find(".message").css({
       'opacity': '1'
     });
     $(".loader").animate({
       'opacity': '0'
     });
   }, 3000)
 }
});
/*
//보내기버튼
$(document).on("click", "#chatSend", function(){
		var result = get_query();
		var chatRoom_id = result.chatRoom_id;

		
	
		var member_id = $(this).parents().prev().prev().prev().prev().prev().prev().html();
		var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminMemberDelete',
				type : 'post',
				data : {'member_id' :member_id},
				success: function(data){
				    alert('회원 정보 삭제 완료');
				    location.href='/appleMarket/adminMemberList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		}
});
*/
});
