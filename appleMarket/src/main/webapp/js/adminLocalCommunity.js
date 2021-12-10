
$('#localCommunityTable .location').focusout(function(){
    $("#localCommunityTable tr:gt(0)").remove(); 

    var location_dong = $(this).parents().children().eq(0).val();
    alert(location_dong);

    if(location_dong!='지역'){
        $.ajax({
            url:'/appleMarket/getAdminLocalCommunityListDong'
            ,type:'post'
            ,data:{'location_dong' :location_dong}
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
                        href:'#'
                        ,text: items.localcommunity_subject
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
        }else{
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
                    href:'#'
                    ,text: items.localcommunity_subject
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
        
        }

});









