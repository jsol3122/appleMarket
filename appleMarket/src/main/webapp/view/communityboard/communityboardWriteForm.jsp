<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- 글쓰기 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- CKEDITOR  -->
    <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
	
    <link rel="stylesheet" href="/appleMarket/css/userupdatapage.css">
    <title>사고팔고마켓</title>
</head>

<body>
    <%@include file="/includes/header.jsp" %>
		<div class="row">
		    <div class="col-md-2"></div>
		    <div class="col-md-8" style="margin-top: 100px;">
		        <h2 class="text-center" style="margin-bottom: 30px;">게시글 쓰기</h2>
		        <form id="communityWriteForm">
		          <table class="table table-striped">
		            <tr>
		                <td>아이디</td>
		                <td><input type="text"  value="${member_id}" class="form-control" name="communityboard_user_id" readonly></td>
		            </tr>
		            <tr>
		                <td>제목</td>
		                <td><input type="text"  class="form-control" name="communityboard_subject"></td>
		            </tr>
		            <tr>
		                <td>글내용</td>
		                <td><textarea rows="10" cols="50" name="communityboard_content" class="form-control"></textarea></td>
		            </tr>
		            <tr>
		                 
		                <td colspan="2"  class="text-center">
		                    <input type="button" value="글쓰기" class="btn btn-success">
		                    <input type="reset" value="다시작성" class="btn btn-warning">
		                    <button type="button"  class="btn btn-primary">전체 게시글보기</button>
		                </td>
		            </tr>
		             
		          </table>
		        </form>
		    </div>
		</div>
		<script>
		//CKEDITOR 적용 
		CKEDITOR.replace('content', {
		         
		    width:'100%',
		    height:'350'
		         
		});
		 
		</script>
    
    <%@include file="/includes/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/appleMarket/js/communityWrite.js"></script>

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