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
                            <!--#JSPLUGIN:ui-->
                                    <script>
                                        //<![CDATA[
                                        var lang_type = "ko";
                                        var bdLogin = "";
                                        jQuery(function($) {
                                            board('#bd_112_668947');
                                            $.cookie('bd_viewer_font', $('body').css('font-family'));
                                        });
                                        //]]>
                                    </script>
                                    <div></div>
                                    <div id="bd_112_668947" class="bd use_np  hover_effect" data-default_style="list" data-bdbubble="N" data-bdfilestype="" data-bdnavside="N" style="height: auto !important;">
                                        <div class="bd_hd v2 clear">


                                            <div class="bd_set fr m_btn_wrp m_no">
                                            </div>

                                        </div>
                                        <div class="rd rd_nav_style2 clear" style="height: auto !important;" data-docsrl="668947">

                                            <div class="rd_hd clear" style="margin:0 -15px 20px">

                                                <div class="board clear ">
                                                    <div class="top_area ngeb">
                                                        <div class="fr">
                                                            <span class="date m_no">2017.11.17 00:12</span> </div>
                                                        <h1 class="np_18px"><a href="#">이번주 월요일... 나 수술하는데 다들 기도해줘.</a></h1>
                                                    </div>
                                                    <div class="btm_area clear">
                                                        <div class="side">
                                                            <a href="#" class="nick member_639682" onclick="return false">
                                                                <img src="/appleMarket/img/temperature/36.5tem.png" alt="온도" title="온도: 36.5도" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">evlecrash</a>
                                                        </div>
                                                        <div class="side fr">
                                                            <span>조회 수 <b>3454</b></span> <span>댓글 <b>3</b></span> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="rd_body clear" style="height: auto !important;">
                                                <article style="height: auto !important;">
                                                    <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                                    <!-- 이 주석 지우지마! -->
                                                    <br>
                                                    <!-- 이 주석 지우지마! -->
                                                    <!--BeforeDocument(668947,639682)-->
                                                    <div class="document_668947_639682 xe_content">
                                                        <p>몸의 일부가 떨어져 나가는 병인데, 유전병인지, 후천성인지는 밝혀지지 않았어....</p>
                                                        <p><br></p>
                                                        <p>내 몸의 일부를 떼어서 다시 그 자리에 봉합하는 수술인데 잘 될지 모르겠네..ㅠㅠ</p>
                                                    </div>
                                                    <!--AfterDocument(668947,639682)-->
                                                </article>
                                            </div>
                                            <div class="rd_ft">
                                                <div class="rd_ft_nav clear">
                                                    <div class="rd_nav img_tx fr m_btn_wrp">
                                                        <a class="back_to bubble m_no" href="#bd_112_668947" title="위로"><i class="fa fa-arrow-up"></i><b class="tx">위로</b></a>
                                                        <a class="back_to bubble m_no" href="#rd_end_668947" title="(목록) 아래로"><i class="fa fa-arrow-down"></i><b class="tx">아래로</b></a>
                                                        <a class="back_to bubble m_no" href="#" title="삭제"><i class="fa fa-pencil"></i><b class="tx">수정</b></a>
                                                        <a class="back_to bubble m_no" href="#" title="삭제"><i class="fa fa-trash"></i><b class="tx">삭제</b></a>
                                                        <a class="document_668947 action bubble m_no" href="#" onclick="return false;" title="신고"><i class="fa fa-concierge-bell"></i><b class="tx">신고</b></a> 
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="fdb_lst_wrp  ">
                                                <div id="668947_comment" class="fdb_lst clear fdb_nav_btm ">
                                                    <div class="cmt_editor">
                                                        <label for="editor_668947" class="cmt_editor_tl fl"><em>✔</em><strong>댓글 쓰기</strong></label>
                                                        <form action="./" method="post" onsubmit="return procFilter(this, insert_comment)" class="bd_wrt cmt_wrt clear" editor_sequence="668947"><input type="hidden" name="error_return_url" value="/index.php?mid=freebd&amp;sort_index=readed_count&amp;order_type=desc&amp;document_srl=668947"><input type="hidden" name="act" value="">
                                                            <input type="hidden" name="vid" value="">
                                                            <input type="hidden" name="mid" value="freebd">
                                                            <input type="hidden" name="document_srl" value="668947">
                                                            <input type="hidden" name="comment_srl" value="">
                                                            <input type="hidden" name="content" value="">
                                                            <div class="simple_wrt">
                                                                <div class="text">
                                                                    <input type="hidden" name="use_html" value="Y">
                                                                    <input type="hidden" id="htm_668947" value="n">
                                                                    <textarea id="editor_668947" cols="50" rows="4" style="overflow: hidden; min-height: 4em; height: 46px; width: 100%;"></textarea>
                                                                    <div class="autogrow-textarea-mirror" style="display: none; overflow-wrap: break-word; padding: 4px 6px; width: 582px; font-family: Tahoma, AppleGothic, sans-serif; font-size: 12px; line-height: 18px;">.<br>.</div>
                                                                </div>
                                                                <input type="submit" value="등록" class="bd_btn">
                                                            </div>
                                                            <div class="edit_opt clear" style="display:none">
                                                                <div class="opt_chk">
                                                                    <input type="checkbox" name="notify_message" value="Y" id="notify_message_668947">
                                                                    <label for="notify_message_668947">알림</label>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div id="re_cmt">
                                                            <label for="editor_2" class="cmt_editor_tl fl"><i class="fa fa-share fa-flip-vertical re"></i><strong>댓글 쓰기</strong></label>
                                                            <div class="editor_select fr">
                                                                <a class="wysiwyg m_no" href="#"><em class="fa fa-info-circle bd_info_icon"></em> 에디터 사용하기</a>
                                                                <a class="close" href="#" onclick="jQuery('#re_cmt').fadeOut().parent().find('.re_comment').focus();return false"><i class="fa fa-times"></i> 닫기</a>
                                                            </div>
                                                            <form action="./" method="post" onsubmit="return procFilter(this,insert_comment)" class="bd_wrt clear" editor_sequence="2"><input type="hidden" name="error_return_url" value="/index.php?mid=freebd&amp;sort_index=readed_count&amp;order_type=desc&amp;document_srl=668947"><input type="hidden" name="act" value="">
                                                                <input type="hidden" name="vid" value="">
                                                                <input type="hidden" name="mid" value="freebd">
                                                                <input type="hidden" name="document_srl" value="668947">
                                                                <input type="hidden" name="content" value="">
                                                                <input type="hidden" name="parent_srl" value="">
                                                                <input type="hidden" name="use_html" value="Y">
                                                                <div class="simple_wrt">
                                                                    <input type="hidden" id="htm_2" value="n">
                                                                    <textarea id="editor_2" cols="50" rows="8" style="overflow: hidden; min-height: 8em; height: 10px; width: 100%;"></textarea>
                                                                    <div class="autogrow-textarea-mirror" style="display: none; overflow-wrap: break-word; padding: 4px 6px; width: 100%; font-family: Tahoma, AppleGothic, sans-serif; font-size: 12px; line-height: 18px;">.<br>.</div>
                                                                </div>
                                                                <div class="edit_opt">
                                                                    <input type="submit" value="등록" class="bd_btn fr">
                                                                </div>
                                                                <span class="opt_chk">
                                <input type="checkbox" name="notify_message" value="Y" id="notify_message">
                    <label for="notify_message">알림</label>
                                    </span>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div id="cmtPosition" aria-live="polite">
                                                        <div class="fdb_tag">
                                                            <a class="ui_font bubble" href="#" onclick="jQuery(this).parent().nextAll('ul,.bd_pg').slideToggle();return false" title="댓글 보기">Comments <b>'3'</b></a>
                                                        </div>
                                                        <ul class="fdb_lst_ul ">
                                                            <li id="comment_668948" class="fdb_itm clear">
                                                                <div class="meta">
                                                                    <a href="#popup_menu_area" class="member_639682" onclick="return false">
                                                                        <img src="/appleMarket/img/temperature/60tem.png" alt="온도" title="온도: 60도" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">gdgdwqwqwq</a>
                                                                    <span class="date">2017.11.17 00:13</span>

                                                                </div>

                                                                <!--BeforeComment(668948,639682)-->
                                                                <div class="comment_668948_639682 xe_content">꼭 무사히 수술 마치셨으면 좋겠어요!~~</div>
                                                                <!--AfterComment(668948,639682)-->
                                                                <div class="fdb_nav img_tx">
                                                                	<a class="re_comment" ><i class="fa fa-pencil"></i> 수정</a>
                                                                	<a class="re_comment" ><i class="fa fa-trash"></i> 삭제</a>
                                                                    <a class="re_comment" onclick=""><i class="fa fa-concierge-bell"></i> 신고</a>
                                                                </div>
                                                            </li>
                                                            <li id="comment_102626" class="fdb_itm clear">
                                                                <div class="meta">
                                                                    <a href="#popup_menu_area" class="member_37507" onclick="return false">
                                                                    <img src="/appleMarket/img/temperature/36.5tem.png" alt="온도" title="온도: 36.5도" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">evlecrash</a>
                                                                    <span class="date">2017.11.17 01:13</span>

                                                                </div>

                                                                <!--BeforeComment(102626,37507)-->
                                                                <div class="comment_102626_37507 xe_content">나도 모발이식은 처음이라 많이 떨린다 고마워요</div>
                                                                <!--AfterComment(102626,37507)-->
                                                                <div class="fdb_nav img_tx">
                                                                	<a class="re_comment" ><i class="fa fa-pencil"></i> 수정</a>
                                                                    <a class="re_comment" ><i class="fa fa-trash"></i> 삭제</a>
                                                                    <a class="re_comment" ><i class="fa fa-concierge-bell"></i> 신고</a>
                                                                </div>
                                                            </li>
                                                            <li id="comment_16938" class="fdb_itm clear">
                                                                <div class="meta">
                                                                    <a href="#popup_menu_area" class="member_10055" onclick="return false">
                                                                    <img src="/appleMarket/img/temperature/40tem.png" alt="온도" title="온도: 40도" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">aojvrnauornvap</a>
                                                                    <span class="date">2017.11.17 02:13</span>

                                                                </div>

                                                                <!--BeforeComment(16938,10055)-->
                                                                <div class="comment_16938_10055 xe_content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div>
                                                                <!--AfterComment(16938,10055)-->
                                                                <div class="fdb_nav img_tx">
                                                                	<a class="re_comment" ><i class="fa fa-pencil"></i> 수정</a>
                                                                	<a class="re_comment" ><i class="fa fa-trash"></i> 삭제</a>
                                                                    <a class="re_comment" ><i class="fa fa-concierge-bell"></i> 신고</a>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                <div id="bd_112_0" class="bd use_np  hover_effect" data-default_style="list" data-bdbubble="N" data-bdfilestype="" data-bdnavside="N">

                                    <div class="bd_lst_wrp">
                                        <div class="tl_srch clear">

                                            <div class="bd_tl">
                                                <h1 class="ngeb clear"><i class="bg_color"></i><a href="#">우리동네게시판</a>
                                                	<c:if test="${member_id ne null}">
                                                		<span id='dong' style='font-size:8pt'></span>
                                                	</c:if>
                                                	<input type="hidden" id="session_id" value="${member_id}" />
                                                </h1>
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
    <script src="/appleMarket/js/localCommunityboardList.js"></script>

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
    <!-- End Channel Plugin -->
</body>

</html>