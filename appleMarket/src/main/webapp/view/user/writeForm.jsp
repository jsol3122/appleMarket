<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Form</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/user.css">
</head>
<body>
	<div id="modal-content">
		<div class="modal-header"> <!-- modal header -->
			<button type="button" class="close" data-dismiss="modal">×</button>
		</div>

		<div class="modal-body"> <!-- modal body -->
		<form id="writeForm" action="/appleMarket/user/write" method="post">
			<h3>회원가입</h3>
			<hr>
			<p class="warning">* 는 필수 입력 항목입니다</p>
			<br>
			<br>
			<div>
				<label>아이디 <span class="warning">*</span></label>
				<input type="text" name="member_id" id="member_id" placeholder="5자 이상 입력해주세요"/>
				<input type="button" value="중복확인" class="chk" id="id_chk" />
				<input type="text" id="id_valid" class="hidden">
				<input type="hidden" id="checked_id" value="">
			</div>
			<div>
				<label>비밀번호 <span class="warning">*</span></label>
				<input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합"/>
			</div>
			<div>
				<label>비밀번호확인 <span class="warning">*</span></label>
				<input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요"/>
			</div>
			<div>
				<label>휴대폰 <span class="warning">*</span></label>
				<select name="member_tel1" id="member_tel1" >
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select> -
				<input type="text" name="member_tel2" id="member_tel2" maxlength="4" style="width:60px; margin-right: 0;"> -
				<input type="text" name="member_tel3" id="member_tel3" maxlength="4" style="width:60px; margin-right: 0;">
				<input type="button" value="본인인증"  class="chk" id="tel_chk"/>
				<input type="text" id="user_valid" class="hidden">
				<input type="hidden" id="checked_user" value="">
				
			</div>
			<div>
				<label>이메일 <span class="warning">*</span></label>
				<input type="email" name="member_email" id="member_email" placeholder="예: appleMarket@gmail.com"/>
			</div>
			<div>
				<label>주소</label>
				<input type="text" name="member_sido_sigungu" id="member_sido_sigungu" placeholder="우편번호 검색을 이용해주세요" readonly/>
				<input type="button" value="우편번호 검색"  class="chk" id="addr_chk"/>
				<input type="text" name="member_dong" id="member_dong" style="margin: 10px 102px 0;" readonly />
				<input type="text" name="member_address" id="member_address" readonly />
				<input type="text" name="member_detailAddr" id="member_detailAddr" placeholder="상세 주소를 입력해주세요"/>
				
			</div>
			<div>
				<label>성별</label>
				<input type="radio" name="member_gender" id="m" value=0>
				<label for="m" class="radio_lbl"> 남 </label>
				<input type="radio" name="member_gender" id="w" value=1>
				<label for="w" class="radio_lbl"> 여 </label>
				<input type="radio" name="member_gender" id="n" value=2 checked>
				<label for="n" class="radio_lbl"> 선택 안함 </label>
			</div>
			<div>
				<input type="button" value="가입하기" id="writeBtn" class="sbm" />
			</div>
		</form>
		</div>
		<!-- Modal footer -->
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
	</div> <!-- modal content -->

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/user.js"></script>
</html>