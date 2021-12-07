<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>회원비밀번호변경</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" value="${sessionScope.member_id}" readonly/>
                                </div>
                                <div class="memberupwrite">
                                    <label>현재비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>새 비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>새 비밀번호확인 </label>
                                    <input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요" />
                                </div>
                                <input type="button" value="비밀변호변경" id="writeBtn" class="sbm" />
                            </form>

                            </form>

