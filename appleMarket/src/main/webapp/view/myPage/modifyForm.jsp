<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                            <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>회원정보수정</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" readonly/>
                                </div>
                                <div class="memberupwrite">
                                    <label>현재 비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>새 비밀번호 </label>
                                    <input type="password" name="member_newPwd" id="member_newPwd" placeholder="8자 이상의 영문과 숫자를 조합" />
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
                                    <input type="text" name="member_tel2" id="member_tel2" maxlength="4" style="width:80px; margin: 0 10px;"> -
                                    <input type="text" name="member_tel3" id="member_tel3" maxlength="4" style="width:80px; margin: 0 10px;">
                                    <input type="text" id="user_valid" class="hidden">
                                    <input type="hidden" id="checked_user" value="">
<<<<<<< HEAD
                                </div>
                                <div class="memberupwrite">
                                    <label>이메일 </label>
                                    <input type="email" name="member_email" id="member_email" placeholder="예: appleMarket@gmail.com" />
                                </div>
                  
								<input type="button" value="수정하기" id="writeBtn" class="sbm" />
=======

                                </div>
                                <div class="memberupwrite">
                                    <label>이메일 </label>
                                    <input type="email" name="member_email" id="member_email" placeholder="예: appleMarket@gmail.com" />
                                </div>
                                <input type="button" value="수정하기" id="writeBtn" class="sbm" />
>>>>>>> branch 'master' of https://github.com/jsol3122/appleMarket.git
                            </form>
       