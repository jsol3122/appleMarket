$(function(){
	$.ajax({
		url: '/appleMarket/getAdminWarningList', //getUserList ? 
		type: 'post',
		dataType: 'json', 
		success: function(data){
			//alert(JSON.stringify(data));
			
			$.each(data, function(index,items){
				$('<tr>').append($('<td>',{
					align : 'center', 
					id:'warning_seq',
					text : items.warning_seq
				})).append($('<td>',{
					align : 'center', 
					text : items.warning_category
				})).append($('<td>',{
					align:'center',
				}).append($('<a>',{
					href:'/appleMarket/adminWarningView?warning_seq='+items.warning_seq,
					class:'warning_subject',
					text : items.warning_subject,
					style:'text-decoration:none; color: inherit',
				}))).append($('<td>',{
					align : 'center', 
					text : items.warning_logtime
				})).append($('<td>',{
					align : 'center', 
					text : items.warning_status_YN
				})).append($('<td>',{
					align:'center',
				}).append($('<input>',{//td의 자식 
					type: 'button',
					value: '처리완료',
					class:'btn btn-outline btn-primary pull-right',
					id:'warning_status_Y'
				}))).appendTo($('#adminWarning'));
				
});//each

		},error:function(err){
			console.log(err);
		}
	});



});