<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<input type='button' value='카카오톡으로 초대하기'/>

    </a>
</body>

<!-- kakao sdk 호출 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('769ba7b37ddfb195c3a3dd15cddfee5f');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {
    	
	  var member_id = '<%=(String)session.getAttribute("member_id")%>';
	  alert(member_id);
	  
	  Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '따뜻한 우리 동네 중고 직거래 마켓을 함께 해요 :)',
        description: '#우리동네 #직거래 #미니멀리즘 #당근마켓',
        imageUrl: 'https://raw.githubusercontent.com/jsol3122/appleMarket/master/appleMarket/src/main/webapp/img/shortcut_icon.png',
        link: {
          mobileWebUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
          webUrl: 'http://localhost:8080/appleMarket/index?recommend_id='+member_id,
        },
      },
      buttons: [
        {
          title: '당근마켓 시작하기',
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
</script>
</html>