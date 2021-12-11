$(function(){
		$.ajax({
			url: '/appleMarket/getAdminCommunityCommentList', 
			type: 'post',
			dataType: 'json', 
			success: function(data){
				alert(JSON.stringify(data));		
				
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'communityboard_comment_seq',
						text : items.communityboard_comment_seq
					})).append($('<td>',{
						align : 'center', 
						id:'communityboard_comment_content',
						text : items.communityboard_comment_content
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_comment_user_id
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_comment_logtime
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_seq
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'communityboard_comment_delete'
					}))).appendTo($('#adminCommunityComment'));

	});//each 

		},error:function(err){
			console.log(err);
		}
	});


});