<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/appleMarket/css/recommend/recommend.css">
<style>
a.sbm{
 	display:block;
    width:80px;
    line-height:45px;
    text-align:center;
    shadow: 0px -2px rgba(0, 0, 0, 0.44);
 	 

}
.sbm:active{
      transform: translateY(3px);
}
    
 .sbm2:active{
      transform: translateY(3px);
 }
 a.sbm2{
 	display:block;
    width:80px;
    line-height:45px;
    text-align:center;
    shadow: 0px -2px rgba(0, 0, 0, 0.44);
 	 

}
</style>
</head>
<!-- kakao sdk 호출 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/appleMarket/js/recommend.js"></script>
<script src="/appleMarket/js/clipboard.min.js"></script>


<body>
	 <form class="memberuptext" name="recommend" id="recommend">
	     <h3>친구초대</h3>
	     <hr>
	     <label id="member_id" hidden>${member_id}</label>
	     <div class="memberupwriteid">
	         <label>초대한 친구가 가입하고, 동네인증을 하면 두 사람 모두 사과 1개를 받아요, 사과 5개마다 스타벅스 커피 1잔 쿠폰을 드려요.</label>
	     </div>
	     
		     <a id="kakao-link-btn" href="javascript:kakaoShare()" class="sbm"> 카카오톡으로 초대하기  </a>
	     
		     <a id="url_invite" href="#" class="sbm2" data-clipboard-text="http://localhost:8080/appleMarket/index?recommend_id=${member_id}"> URL 링크로 초대하기  </a>
		   
	   
	     <hr>
	     <div class="memberupwrite" id="memberupwrite">
	         <label>현재 받은 사과</label>
	     </div>
	     <div class="memberupwrite">
       
	         <input type="image" name="recommended_id" value="http://localhost:8080/appleMarket/index?recommend_id=${member_id}" class="logo changelog" src="/appleMarket/img/recommend/1번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;" disabled/> 
	         <input type="image" name="recommended_id" value="" class="logo changelog" src="/appleMarket/img/recommend/2번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;" disabled />
	         <input type="image" name="recommended_id" value="" class="logo changelog" src="/appleMarket/img/recommend/3번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;" disabled/>
	         <input type="image" name="recommended_id" value="" class="logo changelog" src="/appleMarket/img/recommend/4번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;" disabled/>
	         <input type="image" id="recommended_id5" name="recommended_id5" value="" class="logo changelog" src="/appleMarket/img/recommend/5번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;" disabled/>
      
	     </div>
	     
	     <div>
             <label class="stamp" style="width: 80px; margin-left: 45px;"></label>
             <label class="stamp" style="width: 80px; margin-left: 45px;"></label>
             <label class="stamp" style="width: 80px; margin-left: 45px;"></label>
             <label class="stamp" style="width: 80px; margin-left: 45px;"></label>
             <label id="chkcoupon" class="stamp" style="width: 80px; margin-left: 45px;"></label>
 		</div>
	        <a id="recommendSMS" href="#" class="sbm2"> 쿠폰 받기 </a>	     
	     
	     <hr>
	     <div class="memberupwrite">
	         <label>주의사항 </label>
	     </div>
	     <div class="memberupwrite4">
	         <label>1. 사과 1개를 받기 위해서는 친구가 내 초대 URL을 통해 가입을 해야 합니다. </label>
	         <label>2. 내가 초대한 친구가 가입하고 동네인즈을 하면, 친구도 나도 사과을 1개 받을 수 있어요. </label>
	         <label>3. 사과 5개 받으면 쿠폰 받기를 클릭할 수 있고, 클릭하면 가입한 전화번호로 쿠폰이 발송됩니다. </label>
	         <label>4. 쿠폰 유효기간은 쿠폰 발송한 날짜로부터 60일입니다. </label>
	         <label>5. 이벤트 용으로 받은 쿠폰은 환불이 불가능합니다. </label>
	         <label>6. 사과는 초대 링크를 통해 가입한 최초 1회만 받을 수 있습니다. </label>
	         <label>7. 회원 탈퇴 후 초대로 재가입하여도 당근은 발급되지 않습니다. </label>
	         <label>8. 동일한 전화번호나 기기를 이용해서 가입을 시도할 경우 사과가 지급되지 않습니다. </label>
	         <label>9. 신뢰할 수 없는 전화번호나 이메일을 이용하는 경우 사과가 지급되지 않습니다. </label>
	         <label>10. 회원탈퇴하면 모든 사과가 소멸됩니다. </label>
	         <label>11. 초대하기 관련하여 문의사항이 있으시면 쳇봇을 이용해 주세요! </label>
	     </div>
	 </form>
	 <%-- <div>	   
	  	<input type="text" id="foo" value='http://localhost:8080/appleMarket/index?recommend_id=${member_id}'/>
	 </div> --%>
 <script>
 var clipboard = new ClipboardJS('#url_invite');

 clipboard.on('success', function(e) {
	 alert('복사를 완료했습니다. 링크를 친구에게 전송해 주세요. 😙');	 
     console.info('Action:', e.action);
     console.info('Text:', e.text);
     console.info('Trigger:', e.trigger);

     e.clearSelection();
 });

 clipboard.on('error', function(e) {
     console.error('Action:', e.action);
     console.error('Trigger:', e.trigger);
 });

 </script>   
</body>

</html>