$(function(){
	$.ajax({
		url: '/appleMarket/getAdminBlackList', 
		type: 'post',
		dataType: 'json', 
		success: function(data){
			//alert(JSON.stringify(data));
		
		$.each(data, function(index,items){
			$('<tr>').append($('<td>',{
				align : 'center', 
				text : items.blackList_seq
			})).append($('<td>',{
				align : 'center', 
				id:'member_id',
				class:'member_id',
				text : items.member_id
			})).append($('<td>',{
				align : 'center', 
				id:'member_siteCheck',
				class:'member_siteCheck',
				text : items.member_siteCheck
			})).appendTo($('#adminBlackList'));
				
});//each
	
			
		},error:function(err){
			console.log(err);
		}
	});



});			
 