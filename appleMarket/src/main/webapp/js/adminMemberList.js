$(function(){
	$.ajax({
		url: '/appleMarket/getAdminMemberList', //getUserList ? 
		type: 'post',
		dataType: 'json', 
		success: function(data){
			//alert(JSON.stringify(data));
			
			//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
			$.each(data, function(index,items){
				$('<tr>').append($('<td>',{
					align : 'center', 
					text : items.member_seq
				})).append($('<td>',{
					align : 'center', 
					id:'member_id',
					class:'member_id',
					text : items.member_id
				})).append($('<td>',{
					align : 'center', 
					text : items.member_email
				})).append($('<td>',{
					align : 'center', 
					text : '0'+items.member_tel1+''+items.member_tel2+''+items.member_tel3
				})).append($('<td>',{
					align:'center',
				}).append($('<ion-icon>',{//td의 자식 
					name:'caret-down-outline',
					class:'nav__icon',
					style: 'vertical-align: bottom'
				})).append($('<input>',{//td의 자식 
					type:'text',
					style:'text-align:center;border:none;background: transparent',
					size:'1',
					value:items.member_reputation
				})).append($('<ion-icon>',{//td의 자식 
					name:'caret-up-outline',
					class:'nav__icon',
					style:'vertical-align: bottom'
				}))).append($('<td>',{
					align : 'center', 
					text : items.member_siteCheck
				})).append($('<td>',{
					align:'center',
				}).append($('<input>',{//td의 자식 
					type: 'button',
					value: '삭제',
					class:'btn btn-outline btn-primary pull-right',
					id:'memberDelete'
				}))).appendTo($('#adminMember'));
				
				$('input').prop('readonly', true);
});//each

		},error:function(err){
			console.log(err);
		}
	});



});