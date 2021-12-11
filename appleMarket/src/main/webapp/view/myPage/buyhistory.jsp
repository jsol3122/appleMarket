
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
    <!-- 
    <script src="/appleMarket/js/buyhistory.js"></script>
     -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <!-- 구매내역 -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/appleMarket/css/buystyle/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/appleMarket/css/buystyle/plugins/bootstrap/css/bootstrap-slider.css">
    <!-- Font Awesome -->
    <link href="/appleMarket/css/buystyle/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- CUSTOM CSS -->
    <link rel="stylesheet" href="/appleMarket/css/buysalehistory.css">
    <link rel="stylesheet" href="/appleMarket/css/comboard.css">
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
                        <section class="dashboard section" style="padding-top: 0px;">
                            <!-- Container Start -->
                            <div class="container">
                                <!-- Row Start -->
                                <div class="row">
                                    <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
                                        <!-- Recently Favorited -->
                                        <div class="widget dashboard-container my-adslist" style="width: 730px;">
                                            <h3 class="widget-header">구매내역</h3>
                                            <table class="table table-responsive product-dashboard-table">
                                                <thead>
                                                    <tr>
                                                        <th>물품</th>
                                                        <th>상세내역</th>
                                                        <th class="text-center">거래상황</th>
                                                        <th class="text-center">관리</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/에어팟1-3.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">A급 에어팟 싸게 파라요!~~</h3>
                                                            <span class="add-id"><strong>ID:</strong>itgdtd@apple.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/11/08</time> </span>
                                                            <span class="status active"><strong>가격:</strong>110000</span>
                                                            <span class="location"><strong>장소:</strong>서울시 종로구 사직동</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래완료</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래완료</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                        <!-- pagination -->
                                        <div class="pagination justify-content-center">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <!-- pagination -->

                                    </div>
                                </div>
                                <!-- Row End -->
                            </div>
                            <!-- Container End -->
                        </section>
                        <!-- Container End -->
                        <!-- To Top -->
                        <div class="top-to">
                            <a id="top" class="" href="#"><i class="fa fa-angle-up"></i></a>
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
                                <li><a href="#">친구초대</a></li>
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

    <!-- Channel Plugin Scripts -->
    <script>
        (function() {
            var w = window;
            if (w.ChannelIO) {
                return (window.console.error || window.console.log || function() {})('ChannelIO script included twice.');
            }
            var ch = function() {
                ch.c(arguments);
            };
            ch.q = [];
            ch.c = function(args) {
                ch.q.push(args);
            };
            w.ChannelIO = ch;

            function l() {
                if (w.ChannelIOInitialized) {
                    return;
                }
                w.ChannelIOInitialized = true;
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
                s.charset = 'UTF-8';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            }
            if (document.readyState === 'complete') {
                l();
            } else if (window.attachEvent) {
                window.attachEvent('onload', l);
            } else {
                window.addEventListener('DOMContentLoaded', l, false);
                window.addEventListener('load', l, false);
            }
        })();
        ChannelIO('boot', {
            "pluginKey": "8f477d11-b3a5-4a18-9f84-31eeb55cd47e"
        });
    </script>
    <!-- JAVASCRIPTS -->
    <script src="/appleMarket/css/buystyle/plugins/jQuery/jquery.min.js"></script>
    <script src="/appleMarket/css/buystyle/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/appleMarket/css/buystyle/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/appleMarket/css/buystyle/plugins/bootstrap/js/bootstrap-slider.js"></script>
</body>

</html>
