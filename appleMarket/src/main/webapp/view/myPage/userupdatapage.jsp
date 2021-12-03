<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">

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
</head>

<body>
<!-- 상단 -->
   <%@include file="/includes/header.jsp" %>
    <div class="memberup">
        <div class="main">
            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>회원정보수정</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" placeholder= ${sessionScope.login_info.member_id} readonly/>
                                </div>
                                <div class="memberupwrite">
                                    <label>비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>비밀번호확인 </label>
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

                                </div>
                                <div class="memberupwrite">
                                    <label>이메일 </label>
                                    <input type="email" name="member_email" id="member_email" placeholder="예: appleMarket@gmail.com" />
                                </div>
                                <input type="button" value="수정하기" id="writeBtn" class="sbm" />
                            </form>
                        </div>
                    </div>
                    <div class="sidebar">
                        <div class="clr"></div>
                        <div class="gadget">
                            <h2 class="star"><span>마이페이지</span></h2>
                            <div class="clr"></div>
                            <ul class="sb_menu">
                                <li><a href="/appleMarket/view/myPage/userupdatapage.jsp">회원정보수정</a></li>
                                <li><a href="/appleMarket/view/myPage/userchangepwpage.jsp">비밀번호변경</a></li>
                                <li><a href="/appleMarket/view/myPage/userdeletepage.jsp">회원탈퇴</a></li>
                                <li><a href="/appleMarket/view/myPage/userupdatapage.jsp">회원정보수정</a></li>
                                <li><a href="/appleMarket/view/myPage/userchangepwpage.jsp">비밀번호변경</a></li>
                                <li><a href="/appleMarket/view/myPage/userdeletepage.jsp">회원탈퇴</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
 <!--하단  -->
<%@include file="/includes/footer.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/appleMarket/js/user.js"></script>
</body>
</html>






