$(function(){
		$.ajax({
			url: '/appleMarket/getAdminSaleBoardList', 
			type: 'post',
			dataType: 'json', 
			success: function(data){
				//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'sale_seq',
						text : items.sale_seq
					})).append($('<td>',{
						align : 'center', 
						id:'sale_category',
						class:'sale_category',
						text : items.sale_category
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminSaleBoardView?sale_seq='+items.sale_seq,
						class:'sale_subject',
						text : items.sale_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						text : items.location_dong
					})).append($('<td>',{
						align : 'center', 
						text : items.sale_status
					})).append($('<td>',{
						align : 'center', 
						text : items.member_id
					})).append($('<td>',{
						align : 'center', 
						text : items.sale_price
					})).append($('<td>',{
						align : 'center', 
						text : items.sale_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'saleDelete'
					}))).appendTo($('#adminSaleBoard'));

	});//each

		},error:function(err){
			console.log(err);
		}
	});

});