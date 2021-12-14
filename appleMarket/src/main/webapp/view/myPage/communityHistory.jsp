
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

    <!-- CSS -->
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/xe.min.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/board.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/communityhistorydefault.css">
    <link rel="stylesheet" href="/appleMarket/css/communityboardhistory/communityhistory.css">
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
            background-color: #ffffff;
          	position: relative;
	        right: 250px;
	        width : 650px;
	        top : 10px;
      	
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
            background-color: #e14141;
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
                        <div id="body_container">
                            <div>
                                <div class="s_content">
                                    <div id="bd_112_0" class="bd use_np  hover_effect" data-default_style="list" data-bdbubble="N" data-bdfilestype="" data-bdnavside="N">

                                        <div class="bd_lst_wrp">
                                            <div class="tl_srch clear">

                                                <div class="bd_tl">
                                                    <h1 class="ngeb clear"><i class="bg_color"></i><a href="#">My 조잘조잘 글</a></h1>
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
													<!-- ajax로 사용자의 우리동네 글 내역 띄우기 -->
                                                </tbody>
                                            </table>
                                            
                                            <form action="./" method="get" class="bd_pg clear"><input type="hidden" name="error_return_url" value="/freebd"><input type="hidden" name="act" value="">
                                                <fieldset>
                                                    <!-- 페이징처리 ajax로 띄우기 -->
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    <div class="clr"></div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/appleMarket/js/communityHistory.js"></script>
</body>

</html>





