$(function(){

/* 현재 받은 사과 쿠폰, 추천인 목록 */
 $.ajax({
		url: '/appleMarket/recommendList',
		type: 'post',
		data: 'member_id='+$('#member_id').text(),	
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			var items = document.getElementsByClassName("stamp");
			
			  $.each(data, function(index, list){		 
					console.log(list.recommended_id);			
					
					items[index].innerHTML = list.recommended_id;
					console.log(items[index].innerHTML);
					
					if(items[index].innerHTML != "" && index<=3){
					$('input.changelog').eq(index).attr('src', '/appleMarket/img/recommend/사과스탬프.png');
						
					}else if(items[4].innerHTML != ""){
						$('input.changelog').eq(index).attr('src', '/appleMarket/img/recommend/5개사과스탬프.png');
						$('input.changelog').eq(index).attr('value', 'exist');
					}
		
			  });	     			
		},
		error: function(err){
			console.log(err);
		}
	});
	
	
 /* sms 쿠폰 발송 버튼  */
$('#recommendSMS').click(function(){

	if($('#recommended_id5').val() == 'exist'){
		 $.ajax({
				url: '/appleMarket/recommendSMS',				
				type: 'get',
				data: $('#recommend').serialize(),				
				success: function(){
					alert('기프티콘을 발송 하였습니다. 문자를 확인해주세요!');					
					
					/* 쿠폰발송시 5개 쿠폰 초기화 */
					$.post("/appleMarket/recommendCoupon",
					{ member_id: $('#member_id').text()},					
					function(data, status){
						//alert("y를n으로 바꿧다."+data+"<br>"+status);
					});
					
					/* 사진 변경을 위해 재로딩 */
					location.reload();
				},
				error: function(err){
					console.log(err);
				}
			});	
		}//if
		else{
			alert('5명에게 초대 링크를 보내주세요!! 스타벅스 기프티콘을 드립니다. 😁');
		}
	});
	
	
});



  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('769ba7b37ddfb195c3a3dd15cddfee5f');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {    	
	  var member_id = '<%=(String)session.getAttribute("member_id")%>';

	  
	  Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '따뜻한 우리 동네 중고 직거래 마켓을 함께 해요 :)',
        description: '#우리동네 #직거래 #미니멀리즘 #사과마켓',
        imageUrl: 'https://raw.githubusercontent.com/jsol3122/appleMarket/master/appleMarket/src/main/webapp/img/shortcut_icon.png',
        link: {
          mobileWebUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
          webUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
        },
      },
      buttons: [
        {
          title: '사과마켓 시작하기',
          link: {
            mobileWebUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
            webUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }