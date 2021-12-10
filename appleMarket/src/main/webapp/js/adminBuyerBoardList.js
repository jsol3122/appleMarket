$(function(){
	$.ajax({
		url: '/appleMarket/getAdminBuyerBoardList', 
		type: 'post',
		dataType: 'json', 
		success: function(data){
			//alert(JSON.stringify(data));
			
			//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
			$.each(data, function(index,items){
				$('<tr>').append($('<td>',{
					align : 'center',
					id:'buyerboard_seq',
					text : items.buyerboard_seq
				})).append($('<td>',{
					align : 'center', 
					id:'buyerboard_category',
					class:'buyerboard_category',
					text : items.buyerboard_category
				})).append($('<td>',{
					align:'center',
				}).append($('<a>',{
					href:'/appleMarket/adminBuyerBoardView?buyerboard_seq='+items.buyerboard_seq,
					class:'buyerboard_subject',
					text : items.buyerboard_subject,
					style:'text-decoration:none; color: inherit',
				}))).append($('<td>',{
					align : 'center', 
					text : items.location_dong
				})).append($('<td>',{
					align : 'center', 
					text : items.buyer_status
				})).append($('<td>',{
					align : 'center', 
					text : items.member_id
				})).append($('<td>',{
					align : 'center', 
					text : items.buyerboard_price
				})).append($('<td>',{
					align : 'center', 
					text : items.buyerboard_logtime
				})).append($('<td>',{
					align:'center',
				}).append($('<input>',{//td의 자식 
					type: 'button',
					value: '삭제',
					class:'btn btn-outline btn-primary pull-right',
					id:'buyerDelete'
				}))).appendTo($('#adminBuyerBoard'));

});//each

		},error:function(err){
			console.log(err);
		}
	});



});