<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/userupdatapage.css">
    <title>사고팔고마켓</title>
<style type="text/css">

</style>    
</head>

<%@include file="/includes/header.jsp" %>
<br>
<br>
<br>
<br>
        <div id="section">
			<p align="center" style="color:#333; font-size:20pt;"><br>회원가입</p><br>
			<p align="center"><img src="../img/write_step3.png" width="500" alt="회원가입_스탭3"/></p>
			<div class="box">
				<br>
				<p class="username" align="center">${sessionScope.memName } 고객님  </p>
				<br>
				<p class ="icon" align="center">
					<img src="/appleMarket/img/writeFormSuccess.jpg" width="200" alt="회원가입_아이콘"/><br><br><br>
				</p>
				<p align="center">회원가입을 진심으로 축하합니다.</p><br><br>
			</div>
			<br>
			<p align="center"><button class="btn" onclick="location.href='/appleMarket/view/user/loginForm.jsp' rel='modal:open'" style=" color: white; background: #39210D;font-size : 13pt;">
			로그인</button></p><br>
 </div><!--section-->

<%@include file="/includes/footer.jsp" %>