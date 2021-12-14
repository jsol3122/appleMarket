$(function(){
    $.ajax({
        url:'/appleMarket/getAdminLocalCommunityView'
        ,type:'post'
        ,data:{'localcommunity_seq': $('#localcommunity_seq').val()}
        ,dataType:'json'
        ,success:function(data){
            $('#subjectSpan').text(data.localcommunity_subject);
			$('#seqSpan').text(data.localcommunity_seq);
            $('#localSpan').text(data.location_dong);
			$('#idSpan').text(data.localcommunity_user_id);
			$('#hitSpan').text(data.localcommunity_hit);
			$('#contentSpan').text(data.localcommunity_content);
        }
        ,error:function(err){
			console.log(err);
		}
    });
    
});