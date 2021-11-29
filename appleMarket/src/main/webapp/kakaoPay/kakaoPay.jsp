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

<form id = KakaoPayForm method="post" >
	<button id=kakaoPay type="button">결제버튼</button>
</form>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#kakaoPay').click(function(){
	var IMP = window.IMP;
	IMP.init('imp67037870');
	IMP.request_pay({
		pg : "kakaopay",
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '결제Test',
		amount : 50000,
		buyer_email : '1188gur@naver.com',
		buyer_name : '맹주혁',
		buyer_tel : '010-1111-1111',
		buyer_addr : '구매자 주소',
		buyer_postcode : '구매자 주소',
		<%--m_redirect_url : 'redirect url'--%>
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