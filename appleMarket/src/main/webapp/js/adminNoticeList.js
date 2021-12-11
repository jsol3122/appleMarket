$(function(){
    $.ajax({
        url:'/appleMarket/getAdminNoticeList'
        ,type:'post'
        ,dataType:'json'
        ,success:function(data){
            //console.log(JSON.stringify(data));

            $.each(data,function(index,items){
                $('<tr>').append($('<td>',{
                    align : 'center'
                    ,text : items.admin_notice_seq
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.admin_notice_subject
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.admin_notice_logtime
                })).append($('<td>',{
                    align:'center'
                }).append($('<input>',{//td의 자식
                    type:'button'
                    ,value:'modify'
                    ,class:'btn btn-outline btn-primary pull-right NoticeModify' 
                    
                }))).append($('<td>',{
                    align:'center'
                }).append($('<input>',{//td의 자식
                    type:'button'
                    ,value:'delete'
                    ,class:'btn btn-outline btn-primary pull-right NoticeDelete' 
                }))).appendTo($('#noticeTable'));
                
            });
        }


    });
});