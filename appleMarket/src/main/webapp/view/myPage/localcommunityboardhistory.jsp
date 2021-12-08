
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
    <link rel="shortcut icon" type="image/x-icon" href="/appleMarket/img/communityboardhistory/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/xe.min.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/board.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/communityhistorydefault.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/communityhistory.css">
    <title>사고팔고마켓</title>

    <!-- RSS -->
    <!-- ICON -->


    <link rel="canonical" href="#">
    <meta property="og:locale" content="ko_KR">
    <meta property="og:type" content="website">
    <meta property="og:url" content="#">
    <meta property="og:site_name" content="사과마켓">
    <meta property="og:title" content="사과마켓">
    <style type="text/css">
        .s_header_nav {
            height: 36px
        }
        
        .s_header h1 {
            top: 15px
        }
        
        .s_header h1 {
            left: 5px
        }
        
        .s_nav li,
        .rollNav li,
        .dropNav li,
        .s_navSub li,
        .rollNavSub li,
        .dropNav li {
            font-family: Arial Black
        }
        
        .s_nav li a,
        .s_nav li a:hover,
        .s_nav li a:active,
        .s_nav li a:focus,
        .s_nav li.active a,
        .rollNav li a,
        .rollNav li a:hover,
        .rollNav li a:active,
        .rollNav li a:focus,
        .rollNav li.active a,
        .dropNav li a,
        .dropNav li a:hover,
        .dropNav li a:active,
        .dropNav li a:focus,
        .dropNav li.active a {
            color: #FFFFFF
        }
        
        .s_nav li,
        .rollNav li,
        .dropNav li {
            font-size: 14px
        }
        
        .s_nav li a,
        .rollNav li a,
        .dropNav li a {
            font-weight: bold
        }
        
        .s_navSub li a,
        .rollNavSub li a,
        .dropNav li li a {
            color: #CC6600 !important
        }
        
        .slideWrap .slideArea #slideBar {
            width: 200px
        }
        
        .slideWrap .slideArea #slideBar {
            right: -212px
        }
        
        #s_popup {
            top: 300px
        }
        
        #s_popup {
            left: 500px
        }
    </style>
    <style type="text/css">
        .s_body {
            padding-left: 10px;
            padding-right: 10px
        }
        
        .s_body {
            background-color: #ffffff
        }
        
        .s_content {
            background-color: #ffffff
        }
        
        #sitemapWrap {
            padding-left: 10px;
            padding-right: 10px
        }
        
        #footer {
            padding-left: 10px;
            padding-right: 10px
        }
        
        #footer,
        #sitemapWrap {
            background-color: #ffffff
        }
        
        #footer {
            -moz-border-radius: 0 0 4px 4px;
            -webkit-border-radius: 0 0 4px 4px;
            border-radius: 0 0 4px 4px
        }
        
        #footer .footNav {
            border-top: none
        }
        
        #footer {
            height: 10px
        }
    </style>
    <style data-id="bdCss">
        .bd a:focus,
        .bd input:focus,
        .bd button:focus,
        .bd textarea:focus,
        .bd select:focus {
            outline-color: #4169e1;
        }
        
        .bd .replyNum {
            color: #4169e1 !important
        }
        
        .bd .trackbackNum {
            color: #646496 !important
        }
        
        .bd.fdb_count .replyNum {
            background: #4169e1;
        }
        
        .bd.fdb_count .trackbackNum {
            background: #646496;
        }
        
        .bd em,
        .bd .color {
            color: #4169e1;
        }
        
        .bd .shadow {
            text-shadow: 1px 1px 1px #646496;
        }
        
        .bd .bolder {
            color: #4169e1;
            text-shadow: 2px 2px 4px #646496;
        }
        
        .bd .bg_color {
            background-color: #fffe00;
        }
        
        .bd .bg_f_color {
            background-color: #4169e1;
            background: -webkit-linear-gradient(#FFF -50%, #4169e1 50%);
            background: linear-gradient(to bottom, #FFF -50%, #4169e1 50%);
        }
        
        .bd .border_color {
            border-color: #4169e1;
        }
        
        .bd .bx_shadow {
            box-shadow: 0 0 2px #646496;
        }
        
        .viewer_with.on:before {
            background-color: #4169e1;
            box-shadow: 0 0 2px #4169e1;
        }
        
        .bd_zine.zine li:first-child,
        .bd_tb_lst.common_notice tr:first-child td {
            margin-top: 2px;
            border-top: 1px solid #DDD
        }
        
        .bd_zine .info b,
        .bd_zine .info a {
            color: #646496;
        }
        
        .bd_zine.card h3 {
            color: #4169e1;
        }
        
        .bd_tb_lst {
            margin-top: 0
        }
        
        .bd_tb_lst .cate span,
        .bd_tb_lst .author span,
        .bd_tb_lst .last_post small {
            max-width: px
        }
    </style>
    <style type="text/css">
        .css3pie {
            behavior: url(./layouts/smart/js/PIE.htc);
        }
    </style>
</head>

<body>
    <header id="headBox">
        <div class="inner">
            <h1>
                <a href="#"><img class="logo" src="/appleMarket/img/communityboardhistory/logo-basic.png" alt="사과마켓"></a>
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
                        <div id="body_container">
                            <div class="s_body">
                                <div class="s_content">
                                    <div id="bd_112_0" class="bd use_np  hover_effect" data-default_style="list" data-bdbubble="N" data-bdfilestype="" data-bdnavside="N">

                                        <div class="bd_lst_wrp">
                                            <div class="tl_srch clear">

                                                <div class="bd_tl">
                                                    <h1 class="ngeb clear"><i class="bg_color"></i><a href="#">My 우리동네 글</a></h1>
                                                </div>
                                            </div>
                                            <div class="cnb_n_list">
                                            </div>
                                            <table class="bd_lst bd_tb_lst bd_tb">
                                                <caption class="blind">List of Articles</caption>
                                                <thead class="bg_f_f9">

                                                    <tr>
                                                        <th scope="col" class="no"><span><a href="#" title="내림차순">번호</a></span></th>
                                                        <th scope="col" class="title"><span><a href="#">제목</a></span></th>
                                                        <th scope="col"><span>글쓴이</span></th>
                                                        <th scope="col"><span><a href="">날짜</a></span></th>
                                                        <th scope="col" class="m_no"><span><a href="#">삭제</a></span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>


                                                    <tr>
                                                        <td class="no">
                                                            14474 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="15 시간 전">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14473 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="17 시간 전">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14472 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="17 시간 전">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14471 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="12:31">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14470 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="12:02">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14469 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="11:32">2021.11.29</td>
                                                        <td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="no">
                                                            14468 </td>
                                                        <td class="title">

                                                            <a href="#" class="hx" data-viewer="#">감자감자</a>
                                                            <span class="extraimages"></span>
                                                        </td>
                                                        <td class="author"><span><a href="#popup_menu_area" class="member_795436" onclick="return false">
                                                            <!--<img src="http://www.reva.kr/modules/point/icons/lv/7.gif" alt="[레벨:7]" title="포인트:5250point (10%), 레벨:7/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                            -->
                                                            감자돌이</a></span></td>
                                                        <td class="time" title="18:52">2021.11.28</td>
                                                        <<td class="m_no"><a href="#"><i class="fas fa-trash"></i></a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="btm_mn clear">

                                                <div class="fl">
                                                    <a class="btn_img fl" href="#"><i class="fa fa-bars"></i> 목록</a>
                                                    <form action="#" method="get" onsubmit="return procFilter(this, search)" class="bd_srch_btm"><input type="hidden" name="act" value="">
                                                        <input type="hidden" name="vid" value="">
                                                        <input type="hidden" name="mid" value="freebd">
                                                        <input type="hidden" name="category" value="">
                                                        <span class="btn_img itx_wrp">
                                                            <button type="submit" onclick="jQuery(this).parents('form.bd_srch_btm').submit();return false;" class="ico_16px search">Search</button>
                                                            <label for="bd_srch_btm_itx_112">검색</label>
                                                            <input type="text" name="search_keyword" id="bd_srch_btm_itx_112" class="bd_srch_btm_itx srch_itx" value="">
                                                        </span>
                                                        <span class="btn_img select">
                                                            <select name="search_target">
                                                            <option value="title_content">제목+내용</option><option value="title">제목</option><option value="content">내용</option>
                                                        </select>
                                                    </span>
                                                    </form>
                                                </div>
                                                <div class="fr">
                                                    <a class="btn_img" href="#"><i class="ico_16px write"></i> 쓰기</a> </div>
                                            </div>
                                            <form action="./" method="get" class="bd_pg clear"><input type="hidden" name="error_return_url" value="/freebd"><input type="hidden" name="act" value="">
                                                <fieldset>
                                                    <legend class="blind">Board Pagination</legend>
                                                    <input type="hidden" name="vid" value="">
                                                    <input type="hidden" name="mid" value="freebd">
                                                    <input type="hidden" name="category" value="">
                                                    <input type="hidden" name="search_keyword" value="">
                                                    <input type="hidden" name="search_target" value="">
                                                    <input type="hidden" name="listStyle" value="list">
                                                    <strong class="direction"><i class="fa fa-angle-left"></i> Prev</strong> <a class="frst_last bubble this" href="#" title="첫 페이지">1</a>

                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#">4</a>
                                                    <a href="#">5</a> <span class="bubble"><a href="#" class="tg_btn2" data-href=".bd_go_page" title="페이지 직접 이동">...</a></span> <a class="frst_last bubble" href="#" title="끝 페이지">10</a> <a href="#" class="direction">Next <i class="fa fa-angle-right"></i></a>
                                                    <div class="bd_go_page tg_cnt2 wrp">
                                                        <button type="button" class="tg_blur2"></button>
                                                        <input type="text" name="page" class="itx">/ 10 <button type="submit" class="bd_btn">GO</button>
                                                        <span class="edge"></span>
                                                        <i class="ie8_only bl"></i><i class="ie8_only br"></i>
                                                        <button type="button" class="tg_blur2"></button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    <script src="js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

</html>






