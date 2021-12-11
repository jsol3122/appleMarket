//view의 주소값에서 상품 글번호 추출
function get_query(){ 
    var url = document.location.href; 
    var qs = url.substring(url.indexOf('?') + 1).split('&'); 
    for(var i = 0, result = {}; i < qs.length; i++){
         qs[i] = qs[i].split('='); 
         result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
    } 
    return result; 
}

//관심목록버튼
$(document).on("click", ".order_now .addcart", function(){
		var result = get_query();
		var sale_seq = result.sale_seq;
		var member_id = $('#session_id').val();
		alert(sale_seq);
		alert(member_id);
	    var result = confirm("관심목록으로 이동하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/saleboard/saleboardPick',
				type : 'post',
				data : {'sale_seq' : sale_seq, 'member_id': member_id},
				success: function(data){
				    alert('관심목록으로 이동되었습니다.');
				    //location.href='/appleMarket/adminBuyerBoardList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		} 
});
