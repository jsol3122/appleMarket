$(function(){
		$.ajax({
			url: '/appleMarket/getAdminCommunityBoardList', 
			type: 'post',
			dataType: 'json', 
			success: function(data){
				//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'communityboard_seq',
						text : items.communityboard_seq
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminCommunityBoardView?communityboard_seq='+items.communityboard_seq,
						class:'communityboard_subject',
						text : items.communityboard_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						id:'communityboard_user_id',
						text : items.communityboard_user_id
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'saleDelete'
					}))).appendTo($('#adminCommunityBoard'));

	});//each

		},error:function(err){
			console.log(err);
		}
	});


});