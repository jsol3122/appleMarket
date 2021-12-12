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
    <!-- 우리동네 css -->
     <link rel="stylesheet" href="/appleMarket/css/localCommunityboardView.css">
    <title>사과마켓 커뮤니티</title>
    <link rel="canonical" href="#">
    <meta property="og:locale" content="ko_KR">
    <meta property="og:type" content="website">
    <meta property="og:url" content="#">
    <meta property="og:site_name" content="사과마켓">
    <meta property="og:title" content="사과마켓">
  
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
                            <input type="hidden" id="session_id" value="${member_id}" /> 
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
                                                    <!-- 글제목&사용자 부분 ajax로 띄우기 -->
                                                </div>
                                            </div>
                                            <div class="rd_body clear" style="height: auto !important;">
                                                <article style="height: auto !important;">
                                                    <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                                    <!-- 이 주석 지우지마! -->
                                                    <br>
                                                    <!-- 이 주석 지우지마! -->
                                                    <!--BeforeDocument(668947,639682)-->
                                                    	<!-- 글 내용 부분 ajax로 뿌리기 -->
                                                    <!--AfterDocument(668947,639682)-->
                                                </article>
                                            </div>
                                            
                                            <div class="rd_ft">
                                                <div class="rd_ft_nav clear">
                                                    <div class="rd_nav img_tx fr m_btn_wrp">
                                                        <!-- 본인 글일 때 수정&삭제 버튼 활성화 -->

                                                        <a class="document_668947 action bubble m_no" href="#" onclick="openPopup()"  title="신고">
                                                        	<i class="fa fa-concierge-bell"></i>
                                                        		<b class="tx">신고</b>
                                                        </a> 
                                                    </div>
                                                </div>
                                            </div>
											
											<!--  댓글  -->
                                            <div class="fdb_lst_wrp  ">
                                                <div id="668947_comment" class="fdb_lst clear fdb_nav_btm ">
                                                    <div class="cmt_editor">
                                                        <label for="editor_668947" class="cmt_editor_tl fl"><em>✔</em><strong>댓글 쓰기</strong></label>
                                                        <form class="bd_wrt cmt_wrt clear" editor_sequence="668947"><input type="hidden" name="error_return_url" value="/index.php?mid=freebd&amp;sort_index=readed_count&amp;order_type=desc&amp;document_srl=668947"><input type="hidden" name="act" value="">
                                                            <input type="hidden" name="vid" value="">
                                                            <input type="hidden" name="mid" value="freebd">
                                                            <input type="hidden" name="document_srl" value="668947">
                                                            <input type="hidden" name="comment_srl" value="">
                                                            <input type="hidden" name="content" value="">
                                                            <div class="simple_wrt">
                                                                <div class="text">
                                                                    <input type="hidden" name="use_html" value="Y">
                                                                    <input type="hidden" id="htm_668947" value="n">
                                                                    <input type="hidden" name="localcommunity_seq" id="localcommunity_seq" value="">
                                                                    <textarea id="editor_668947" name="localcommunity_comment_content" cols="50" rows="4" style="overflow: hidden; min-height: 4em; height: 46px; width: 100%;"></textarea>
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
                                                            <a class="ui_font bubble" href="#" onclick="jQuery(this).parent().nextAll('ul,.bd_pg').slideToggle();return false" title="댓글 보기">Comments <b></b></a>
                                                        </div>
                                                        <ul class="fdb_lst_ul ">
                                                            <!-- 댓글 ajax로 불러오기 -->
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
												<!-- 공지사항 ajax로 띄우기 -->
                                                
                                                <!-- 일반 글목록 ajax로 띄우기 -->
                                            </tbody>
                                        </table>
                                        <div class="btm_mn clear">

                                            <div class="fl">
                                                <a class="btn_img fl" href="/appleMarket/view/localCommunityboard/localCommunityboardList.jsp?pg=1"><i class="fa fa-bars"></i> 목록</a>
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
                                                        <option value="title_content">제목+내용</option><option value="title">제목</option><option value="content">내용</option><option value="comment">댓글</option><option value="nick_name">닉네임</option><option value="user_id">아이디</option><option value="tag">태그</option>            </select>
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
    <script src="/appleMarket/js/localCommunityboardGetView.js"></script>
    <script src="/appleMarket/js/warning.js"></script>
        <script type="text/javascript">
    
	$(document).on("click", ".bell", function(){

		warning_id = $(this).parents().prev().prev().children().eq(0).text();
		//alert(warning_id);
			
		var comment_seq = $(this).parents().prev().next().next().val();
		//alert(comment_seq);
		
	  	var _width = '530';
	    var _height = '600';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	 	
	 
	    window.open('/appleMarket/warningBoardForm?localcommunity_seq='+$('#localcommunity_seq').val()+'&comment_seq='+comment_seq+'&warning_id='+warning_id+'&comment_YN='+'Y','팝업창','width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	    
	    $('#comment_YN').val('Y');
	    $('#warning_id').val(warning_id);
	  
	  
	});
    </script>
</body>

</html>