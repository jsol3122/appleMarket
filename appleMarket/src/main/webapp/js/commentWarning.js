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
function commentOpenPopup() {
 
    var _width = '530';
    var _height = '600';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	
 	if($('#localcommunity_seq').val()!=null){
    	window.open('/appleMarket/warningBoardForm?localcommunity_seq='+$('#localcommunity_seq').val()+'&warning_id='+$('.nick').text(),'팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else if($('#communityboard_seq').val()!=null){
		window.open('/appleMarket/warningBoardForm?communityboard_seq='+$('#communityboard_seq').val()+'&warning_id='+$('.nick').text(),'팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else if($('#sale_seq').val()!=null){
		window.open('/appleMarket/warningBoardForm?sale_seq='+$('#sale_seq').val()+'&warning_id='+$('.nick').text(),'팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}else{
		window.open('/appleMarket/warningBoardForm?buyerboard_seq='+$('#buyerboard_seq').val()+'&warning_id='+$('.nick').text(),'팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}
}