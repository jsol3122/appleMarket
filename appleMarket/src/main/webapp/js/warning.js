//신고팝업창 중앙정렬
function openPopup() {
 
    var _width = '530';
    var _height = '600';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open('/appleMarket/warningBoardForm','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
}


//신고버튼 눌렀을떄 등록되기
$('#WarningWriteBtn').click(function(){
	//초기화 과정
	$('#contentDiv').empty();
	
	  if(warningWriteForm.language.value ==''){
		  alert("신고사유를 등록하여 주십시요.");
		  warningWriteForm.language.focus();
	  }else if($('#message').val() == ''){
		$('#contentDiv').html('내용 입력');
		$('#message').focus();
		}
	else{ 
		$.ajax({
			url: '/appleMarket/warningBoardWrite',
			type: 'post',
			data: $('#warningWriteForm').serialize(),
			success: function(){
				alert("글 작성 성공");
				location.href="/appleMarket/index"
			},
			error: function(err){
				console.log(err);
			}	
		});
	}	
});