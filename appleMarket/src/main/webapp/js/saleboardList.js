$(function(){
	$.ajax({
		url: '/appleMarket/user/getUserList', //getUserList ? 
		type: 'post',
		dataType: 'json', 
		success: function(data){
			alert(JSON.stringify(data));
			
			//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
			$.each(data, function(index,items){
				$('<tr>').append($('<td>',{
					align : 'center', 
					text : items.name
				})).append($('<td>',{
					align : 'center', 
					text : items.id
				})).append($('<td>',{
					align : 'center', 
					text : items.pwd
				})).appendTo($('#table'));
			});//each
		},error:function(err){
			console.log(err);
		}
	});
});