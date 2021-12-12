<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
					<div class="article">
                      <form class="memberuptext" id="writeForm" name="writeForm" action="" method="">
                          <h3>회원정보수정</h3>
                          <hr>
                       <div class="memberupwriteid">
                              <label>아이디 </label>
                              <input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" readonly/>
                          </div>
                          <div class="memberupwrite">
                              <label>현재 비밀번호 </label>
                              <input type="password" name="member_beforepwd" id="member_beforepwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                               <input type="hidden" id="checked_pw" value="">
                          </div>
                          <div class="memberupwrite">
                              <label>새 비밀번호 </label>
                              <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                          </div>
                          <div class="memberupwrite">
                              <label>새 비밀번호 확인 </label>
                              <input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요" />
                          </div>
                          <div class="memberupwrite">
                              <label>휴대폰 </label>
                              <select name="member_tel1" id="member_tel1" style="width:60px; height:33px; margin: 0 10px 0 0;">
                          <option value="010" selected>010</option>
                          <option value="011">011</option>
                          <option value="019">019</option>
                        </select> -
                              <input type="text" name="member_tel2" id="member_tel2" maxlength="4" style="width:80px; margin: 0 10px;" value=""> -
                              <input type="text" name="member_tel3" id="member_tel3" maxlength="4" style="width:80px; margin: 0 10px;" value="">
                              <input type="text" id="user_valid" class="hidden">
                              <input type="hidden" id="checked_user" value="">
                          </div>
                          <div class="memberupwrite">
                              <label>이메일 </label>
                              <input type="email" name="member_email" id="member_email" placeholder="예: appleMarket@gmail.com" value=""/>
                          </div>
                          
            
						<input type="button" value="수정하기" id="userchangBtn" class="sbm" name="writeBtn" />
                   </form>
                     </div>

<script type="text/javascript" src="/appleMarket/js/user.js"></script>
 <script>
 /*회원정보 받아오기  */
$(document).ready(function() {
	 $.ajax({
			url: '/appleMarket/user/checkId',
			type: 'post',
			data: 'member_id='+$('#member_id').val(),
			dataType: 'json',
			success: function(data){
				$('#member_tel2').val(data.member_tel2);
				$('#member_tel3').val(data.member_tel3);
				$('#member_email').val(data.member_email);
				$('#checked_pw').val(data.member_pwd);
				
				if(data.member_siteCheck==1){
					$('#member_beforepwd').attr("placeholder","현재 비밀번호가 없습니다. 새로 입력해주세요.");
					$("#member_beforepwd").attr("disabled",true); 
				}
					
				
			},
			error: function(err){
				console.log(err);
			}
		});
});
	
 </script>