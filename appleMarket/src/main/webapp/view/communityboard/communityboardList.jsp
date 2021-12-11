<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/appleMarket/img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/userchangepwpage.css">

    <link rel="stylesheet" href="/appleMarket/css/comboard.css">
    <link rel="stylesheet" href="/appleMarket/css/comjquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/appleMarket/css/comboard.css">
    <link rel="stylesheet" href="/appleMarket/css/comdefault.css">
    <link rel="stylesheet" href="/appleMarket/css/comstyle.css">
    <title>사과마켓 커뮤니티</title>

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

    </style>
    <style type="text/css">

    </style>
    <style type="text/css">
        #mainNav {
            background: none !important;
            background: url(http://www.reva.kr/files/attach/images/107/e33fd1faeb8cf73de19825b96841f62a.png) repeat-x left top !important
        }
    </style>
    <style type="text/css">
        body {
            background: url(http://www.reva.kr/files/attach/images/107/069eb8ae6e790ab1e3196548d03048a1.png) repeat center fixed
        }
        
        #header_container {
            background: url(http://www.reva.kr/files/attach/images/107/be580dededc628d702a59041f19fead1.png) repeat center 0
        }
        
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
    <!--
    <style type="text/css">
        A:link {
            text-decoration: none;
            color: #006633;
        }
        
        A:visited {
            text-decoration: none;
            color: #006633;
        }
        
        A:hover {
            text-decoration: none;
            color: #006633;
        }
        
    -->
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
            background-color: #4169e1;
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
    <%@include file="/includes/header.jsp" %>

    <div class="memberup">
        <div class="main">
            <div class="content">
                <div class="content_resize">
                    <div id="body_container">
                        <div class="s_body" style="width: 820px;">
                            <div class="s_content">
                                <div id="bd_112_0" class="bd use_np  hover_effect" data-default_style="list" data-bdbubble="N" data-bdfilestype="" data-bdnavside="N">

                                    <div class="bd_lst_wrp">
                                        <div class="tl_srch clear">

                                            <div class="bd_tl">
                                                <h1 class="ngeb clear"><i class="bg_color"></i><a href="#">조잘조잘 - 자유게시판</a></h1>
                                            	<input type="hidden" id="session_id" value="${member_id}" />
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
                                                    <th scope="col" class="m_no"><span><a href="#">조회 수</a></span></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr class="notice">
                                                    <td class="no">
                                                        <strong>공지</strong> </td>
                                                    <td class="title">
                                                        <a href="#"><strong><span style="font-weight:bold;;color:#ff0000">[필독]사과마켓 글 준수사항!</span></strong></a>
                                                        <!--
                                                            <a href="http://www.reva.kr/freebd/771023#771023_comment" class="replyNum" title="댓글">5</a> <span class="extraimages"></span>
                                                        -->
                                                    </td>
                                                    <td class="author"><span><a href="#" class="member_4" onclick="return false">
                                                        <!--
                                                            <img src="http://www.reva.kr/modules/point/icons/lv/20.gif" alt="[레벨:20]" title="포인트:1017630point, 레벨:20/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                        -->
                                                            관리자</a></span></td>
                                                    <td class="time">2021.02.14</td>
                                                    <td class="m_no">14610</td>
                                                </tr>
                                                <tr class="notice">
                                                    <td class="no">
                                                        <strong>14119</strong> </td>
                                                    <td class="title">
                                                        <a href="http://www.reva.kr/freebd/70247"><strong>둘이서 먹다 ㄹㅇ 한명이 죽어도 모릅니다!!!!!</strong></a>
                                                        <a href="http://www.reva.kr/freebd/70247#70247_comment" class="replyNum" title="댓글">161</a> <span class="extraimages"></span>
                                                    </td>
                                                    <td class="author"><span><a href="#" class="member_4134" onclick="return false">
                                                        <!--
                                                            <img src="http://www.reva.kr/modules/point/icons/lv/20.gif" alt="[레벨:20]" title="포인트:1000470point, 레벨:20/20" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">
                                                        -->
                                                            김탁구</a></span></td>
                                                    <td class="time">2016.03.02</td>
                                                    <td class="m_no">10405</td>
                                                </tr>
                                                <!-- 일반 글목록 ajax로 띄우기 -->
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
                                                        <option value="title_content">제목+내용</option><option value="title">제목</option><option value="content">내용</option><option value="comment">댓글</option><option value="nick_name">닉네임</option><option value="user_id">아이디</option><option value="tag">태그</option>				</select>
                                                </span>
                                                </form>
                                            </div>
                                            <div class="fr">
                                                <a class="btn_img" href="#"><i class="ico_16px write"></i> 쓰기</a> </div>
                                        </div>
                                        <form action="./" method="get" class="bd_pg clear"><input type="hidden" name="error_return_url" value="/freebd"><input type="hidden" name="act" value="">
                                            <fieldset>
                                                <!-- 페이징처리 ajax로 뿌리기 -->
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/includes/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/appleMarket/js/communityboardList.js"></script>
</body>

</html>