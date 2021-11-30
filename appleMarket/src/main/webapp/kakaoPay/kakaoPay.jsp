<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>KakaoPayTest</h1>
<input type="text" id = "price">
<form id = KakaoPayForm method="post" >
	<button id=kakaoPay type="button">결제버튼</button>
</form>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#kakaoPay').click(function(){
	var IMP = window.IMP;
	IMP.init('imp67037870'); //가맹점 코드
	IMP.request_pay({
		pg : "kakaopay",
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '상품명', //결제창에서 보여질 이름
		amount : $('#price').val(), //실제 결제 가격
		buyer_email : '',
		buyer_name : '',
		buyer_tel : '',
		buyer_addr : '',
		buyer_postcode : '',
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        alert(msg);
			location.href = '/appleMarket/kakaoPay/kakaopaySuccess.jsp';
		} else {
			var msg = '결제에 실패하였습니다.';
			rsp.error_msg;

		}
	});
	
	
});
	
</script>

</body>
</html>