
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

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

    <link rel="stylesheet" href="/appleMarket/css/recommend/recommend.css">
    <title>사고팔고마켓</title>
</head>

<body>
	<header id="headBox">
	        <div class="inner">
	            <h1>
	                <a href="#"><img class="logo" src="/appleMarket/img/logo-basic.png" alt="사과마켓"></a>
	            </h1>
	            <form action="#" method="get" class="search_box">
	                <fieldset>
	                    <legend>검색창</legend>
	                    <label class="hidden" for="searchPrd">지역, 상품, 업체등을 검색해보세요.</label>
	                    <input type="text" id="searchPrd" name="searchPrd" placeholder="지역, 상품, 업체등을 검색해보세요.">
	                    <button type="submit"><i class="fas fa-search"></i><span class="hidden">검색버튼</span></button>
	                </fieldset>
	            </form>
	            <ul class="category">
	                <li><a href="#">사고/팔고</a></li>
	                <li><a href="#">조잘조잘</a></li>
	                <li><a href="#">우리동네</a></li>
	                <li><a href="#">문의하기</a></li>
	            </ul>
	            <ul class="login">
	                <li><a href="userUpdataForm.html" rel="modal:open">회원정보수정</a></li>
	                <li><a href="index.html">로그아웃</a></li>
	
	            </ul>
	            <!-- <div class="btnbox_search"> 수정해야하지만 일단 잘 돌아감 -->
	            <div class="btnbox_search">
	                <!-- 캐러셀 -->
	                <button type="button"><i class="fas fa-search"></i><span class="hidden">검색창 펼치기</span></button>
	            </div>
	
	            <nav id="nav">
	                <!-- <h1></h1> -->
	                <div class="ham">
	                    <span class="bar1"></span>
	                    <span class="bar2"></span>
	                    <span class="bar3"></span>
	                </div>
	                <ul class="menu">
	                    <li class="active"><a href="#">사고/팔고</a></li>
	                    <li><a href="#">조잘조잘</a></li>
	                    <li><a href="#">우리동네</a></li>
	                    <li><a href="#">문의하기</a></li>
	                </ul>
	            </nav>
	
	        </div>
	    </header>
    <div class="memberup">
        <div class="main">
            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>친구초대</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>초대한 친구가 가입하고, 동네인증을 하면 두 사람 모두 사과 1개를 받아요, 사과 5개마다 스타벅스 커피 1잔 쿠폰을 드려요.</label>
                                </div>
                                <input type="button" value="카카오톡으로 초대하기" id="writeBtn" class="sbm" />
                                <input type="button" value="URL 링크로 초대하기?" id="writeBtn" class="sbm2" />
                                <hr>
                                <div class="memberupwrite">
                                    <label>현재 받은 사과 </label>
                                </div>
                                <div class="memberupwrite">
                                    <img class="logo" src="/appleMarket/img/recommend/1번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;">
                                    <img class="logo" src="/appleMarket/img/recommend/2번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;">
                                    <img class="logo" src="/appleMarket/img/recommend/3번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;">
                                    <img class="logo" src="/appleMarket/img/recommend/4번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;">
                                    <img class="logo" src="/appleMarket/img/recommend/5번대기중.png" alt="사과마켓" style="width: 100px; margin-left: 20px;">
                                </div>
                                <input type="button" disabled="disabled" value="쿠폰 받기" id="writeBtn" class="sbm2" />
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
                                <li><a href="/appleMarket/view/myPage/salehistory.jsp">판매내역</a></li>
                                <li><a href="/appleMarket/view/myPage/buyhistory.jsp">구매내역</a></li>
                                <li><a href="/appleMarket/view/myPage/wishlist.jsp">관심목록</a></li>
                                <li><a href="#">동네인증</a></li>
                                <li><a href="/appleMarket/view/myPage/communityboardhistory.jsp">조잘조잘 글</a></li>
                                <li><a href="/appleMarket/view/myPage/communityboardcommenthistory.jsp">조잘조잘 댓글</a></li>
                                <li><a href="/appleMarket/view/myPage/localcommunityboardhistory.jsp">우리동네이야기 글</a></li>
                                <li><a href="/appleMarket/view/myPage/localcommunityboardcommenthistory.jsp">우리동네이야기 댓글</a></li>
                                <li><a href="/appleMarket/view/myPage/recommend.jsp">친구초대</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
    <footer id="footBox">
        <h1 class="hidden">사과마켓 하단 정보</h1>
        <ul id="inb">
            <li><a href="">이용약관</a></li>
            <li><a href="">개인정보처리방침</a></li>
            <li><a href="">위치기반서비스 이용약관</a></li>
            <li><a href="">광고주센터</a></li>
            <li><a href="">ABOUT US</a></li>
        </ul>
        <ul class="addresss_list">
            <li>사업자 등록번호 : XXX-XX-XXXXX</li>
            <li>서울 강남구 강남대로94길 20 삼오빌딩 903호</li>
            <li>
                <p>고객문의 : <a href="mailto:xx@xxxxxxx.com">cs@xxxxxxx.com</a></p>
                <p>제휴문의 : <a href="mailto:xx@xxxxxxx.com">contact@xxxxxxx.com</a></p>
            </li>
        </ul>
        <p>(주)사과마켓 대표 전진솔, 이지현, 유혜림, 김현정, 맹주혁, 이상진</p>
        <small class="copyright">
            Copyright &copy; Apple Market Inc. All rights reserved.
        </small>
        <ul class="sns_list">
            <li><a href=""><i class="fab fa-facebook-square"></i><span class="hidden">페이스북</span></a></li>
            <li><a href=""><i class="fab fa-instagram"></i><span class="hidden">인스타그램</span></a></li>
            <li><a href=""><i class="fas fa-blog"></i><span class="hidden">블로그</span></a></li>
        </ul>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/appleMarket/js/user.js"></script>
</body>
</html>






