$(function(){
    $.ajax({
        url:'/appleMarket/getAdminLocalCommunityList'
        ,type:'post'
        ,dataType:'json'
        ,success:function(data){
            //console.log(JSON.stringify(data));

            $.each(data,function(index,items){
                $('<tr>').append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_seq
                })).append($('<td>',{
                    align:'center'
                }).append($('<a>',{ //td 자식
                    href:'/appleMarket/adminLocalCommunityView?localcommunity_seq='+items.localcommunity_seq
                    ,class:'localcommunity_subject'
                    ,text: items.localcommunity_subject
                    ,style:'text-decoration:none; color: inherit'
                }))).append($('<td>',{
                    align : 'center'
                    ,text : items.location_dong
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_user_id
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_logtime
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_hit
                })).append($('<td>',{
                    align:'center'
                }).append($('<input>',{//td의 자식
                    type:'button'
                    ,value:'delete'
                    ,class:'btn btn-outline btn-primary pull-right localCommunityDelete' 
                }))).appendTo($('#localCommunityTable'));
            });
            
        }
        ,error:function(err){
            console.log(err);
        }


    });
});