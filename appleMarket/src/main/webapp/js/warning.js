//view의 주소값에서 상품 글번호 추출
function get_query(){ 
    var url = document.location.href; 
    var qs = url.substring(url.indexOf('?') + 1).split('&'); 
    for(var i = 0, result = {}; i < qs.length; i++){
         qs[i] = qs[i].split('='); 
         result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
    } 
    return result; 
}

//신고팝업창 중앙정렬
function openPopup() {
 
    var _width = '530';
    var _height = '600';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	
 	
 	if($('#localcommunity_seq').val()!=null){
    	window.open('/appleMarket/warningBoardForm?localcommunity_seq='+$('#localcommunity_seq').val()+'&warning_id='+$('.nick').text()+'&comment_YN='+'N','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else if($('#communityboard_seq').val()!=null){
		window.open('/appleMarket/warningBoardForm?communityboard_seq='+$('#communityboard_seq').val()+'&warning_id='+$('.nick').text()+'&comment_YN='+'N','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else if($('#sale_seq').val()!=null){
		window.open('/appleMarket/warningBoardForm?sale_seq='+$('#sale_seq').val()+'&warning_id='+$('.nick').text()+'&comment_YN='+'N','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else{
		window.open('/appleMarket/warningBoardForm?buyerboard_seq='+$('#buyerboard_seq').val()+'&warning_id='+$('.nick').text()+'&comment_YN='+'N','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}
}

$(function(){
	//게시판 신고 - 주소에서 가져오기
	var result = get_query();
	var warning_id = result.warning_id;
	var comment_YN = result.comment_YN;
	var comment_seq = result.comment_seq; 
	
	if(result.localcommunity_seq!=null){
		var board_seq = result.localcommunity_seq;
	}else if(result.communityboard_seq!=null){
		var board_seq = result.communityboard_seq;
	}else if(result.sale_seq!=null){
		var board_seq = result.sale_seq;
	}else{
		var board_seq = result.buyerboard_seq;
	}
	
	//alert(result);
	if(comment_seq==null){
		$('#board_seq').val(board_seq);
	}else{
		$('#board_seq').val(comment_seq);
	}
	$('#warning_id').val(warning_id);
	$('#comment_YN').val(comment_YN);
	$('#comment_seq').val(comment_seq);
		
	if(result.localcommunity_seq!=null){
		$('#board_name').val('localcommunityboard');
	}else if(result.communityboard_seq!=null){
		$('#board_name').val('communityboard');
	}else if(result.sale_seq!=null){
		$('#board_name').val('saleboard');
	}else {
		$('#board_name').val('buyerboard');
	}
	
	
	//신고버튼 눌렀을떄 등록되기
	$('#WarningWriteBtn').click(function(){
	
		
		   if(!$('#warning_category > option:selected').val()) {
			  alert('신고사유를 선택하세요.');
		  }else if($('#warning_subject').val() == ''){
			  alert('제목을 입력해주세요.');
			  $('#warning_subject').focus();
		  }else if($('#warning_content').val() == ''){
			  alert('내용을 입력해주세요.');
			  $('#warning_content').focus();
		  }else if($('#input_file').val() == ''){
		  	  alert('증거사진을 등록해주세요.');
			  $('#input_file').focus();
		  
		  }else{ 
			var formData = new FormData($('#warningWriteForm')[0]);	  
				  	
			$.ajax({
				url: '/appleMarket/warningBoardWrite',
				type: 'post',
				enctype: 'multipart/form-data',
				processData: false, 
				contentType: false,
				data: formData,
				success: function(){
					alert("글 작성 성공");
					self.close();
				},
				error: function(err){
					console.log(err);
				}	
			});
		}	
	});
	

});